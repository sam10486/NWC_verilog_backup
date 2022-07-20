`include "../include/define.svh"

module Controller (
    input clk, 
    input rst,
    //AGU_top
    input AGU_done,
    input BN_MA_out_en,

    //memory
    input r_enable_out,
    input w_enable_out,

    //ntt
    input ntt_done,

    // TF_gen
    output logic TF_init_base,
    output logic TF_ren,
    output logic TF_wen,
    output logic [`D_width-1:0] it_depth_cnt,
    output logic TF_init_const,
    
    // AGU_top
    output logic AGU_enable,

    //memory
    output logic r_enable,
    output logic w_enable,

    //ntt
    output logic ntt_enable
);
    
    enum {RESET, IDLE, NTT_ite1, NTT_ite2, NTT_ite3
            , Fin_state} cs, ns;

    parameter bank_num = `bank_num;
    parameter k = `ite_k;
    parameter delay_cycle = 2;
    parameter ite_0 = `ite_0;
    parameter ite_1 = `ite_1;
    parameter ite_2 = `ite_2;
    parameter BU_total = `BU_total;
    parameter degree = `degree;

    logic [`D_width-1:0] ite_stage;
    logic [`D_width-1:0] ite_sw_cnt;
    logic [`D_width-1:0] BU_cnt;
    logic [`D_width-1:0] delay_cnt;
    logic delay_flag;
    logic compute_complete;

    logic [`D_width-1:0] TF_base_l;
    logic [`D_width-1:0] TF_base_i;
    logic [`D_width-1:0] TF_const_i;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            cs <= RESET;
        end else begin
            cs <= ns;
        end
    end

    logic [`D_width-1:0] init_cnt;
    logic init_done;
    //-------------inital time----------
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            init_cnt <= 'd0;
            init_done <= 'd0;
        end else begin
            if (init_cnt == degree) begin
                init_cnt <= 'd0;
                init_done <= 'd1;
            end else begin
                init_cnt <= init_cnt +'d1;
                init_done <= init_done;
            end
        end
    end

    //----------NTT start---------------
    
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            ite_sw_cnt <= 'd0;
            ite_stage <= 'd0;
        end else begin
            if (init_done) begin
                if (ite_sw_cnt == BU_total-1) begin
                    ite_sw_cnt <= 'd0;
                    if (ite_stage == 'd3) begin     //'d3 represent that raidx_k1 finished
                        ite_stage <= ite_stage;
                    end else begin
                        ite_stage <= ite_stage + 'd1;
                    end
                end else begin
                    if (TF_ren) begin
                        ite_sw_cnt <= ite_sw_cnt + 'd1;
                        ite_stage <= ite_stage; 
                    end else begin
                        ite_sw_cnt <= ite_sw_cnt;
                        ite_stage <= ite_stage; 
                    end
                end
            end 
        end
    end


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            BU_cnt <= 'd0;
        end else begin
            if (r_enable) begin
                case (cs)
                    NTT_ite1: begin
                        if (BU_cnt == ite_0-1) begin
                            BU_cnt <= 'd0;
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end
                        end
                    end
                    NTT_ite2: begin
                        if (BU_cnt == ite_1-1) begin
                            BU_cnt <= 'd0;
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end 
                        end
                    end
                    NTT_ite3: begin
                        if (BU_cnt == ite_2-1) begin
                            BU_cnt <= 'd0;
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end
                        end
                    end 
                    default: begin
                        BU_cnt <= 'd0;
                    end
                endcase
            end
        end
    end

    //--------signal machine-------------

    always_comb begin
        case (cs)
            RESET: begin
                TF_init_base = 'd0;
                TF_ren = 'd0;
                TF_wen = 'd0;
                TF_init_const = 'd0;
                it_depth_cnt = 'd0;
                AGU_enable = 'd0;
                r_enable = 'd0;
                w_enable = 'd0;
                ntt_enable = 'd0;
            end
            IDLE: begin
                TF_init_base = 'd1; 
                TF_ren = 'd0;
                TF_wen = 'd0;
                TF_init_const = 'd1;
                it_depth_cnt = 'd0;
                compute_complete = 'd0;
                AGU_enable = 'd0;
                r_enable = 'd0;
                w_enable = 'd0;
                ntt_enable = 'd0;
            end 
            NTT_ite1: begin
                if (BN_MA_out_en) begin
                    r_enable <= 'd1;
                    if (BU_cnt == ite_0-1) begin
                        TF_init_base = 'd0;
                        TF_ren = 'd0;
                        TF_wen = 'd1;
                        TF_init_const = 'd0;
                        it_depth_cnt = ite_stage;
                    end else begin
                        TF_init_base = 'd0;
                        TF_ren = 'd1;
                        TF_wen = 'd0;
                        TF_init_const = 'd0;
                        it_depth_cnt = ite_stage;
                    end
                    TF_ren = 'd1;
                end else begin
                    r_enable = 'd0;
                    TF_ren = 'd0;
                end
                if (ntt_done) begin
                    w_enable = 'd1;
                end else begin
                    w_enable = 'd0;
                end
                if (r_enable_out) begin
                    ntt_enable = 'd1;
                end else begin
                    ntt_enable = 'd0;
                end
                compute_complete = 'd0;
                AGU_enable = 'd1;
            end
            default: begin
                TF_init_base = 'd0;
                TF_ren = 'd0;
                TF_wen = 'd0;
                TF_init_const = 'd0;
                it_depth_cnt = 'd0;
                compute_complete = 'd0;
                AGU_enable = 'd0;
                r_enable = 'd0;
                w_enable = 'd0;
                ntt_enable = 'd0; 
            end
        endcase
    end
   
    //----------state machine--------------

    always_comb begin
        case (cs)
            RESET: begin //0
                ns <= IDLE;
            end
            IDLE: begin //1
                if (init_done) begin
                    ns <= NTT_ite1;
                end else begin
                    ns <= cs;
                end
            end 
            NTT_ite1: begin //2
                if (BN_MA_out_en && BU_cnt == ite_0-1) begin
                    ns <= cs;
                end else begin
                    ns <= cs;
                end          
            end
            NTT_ite2: begin
                
            end
            default: begin
            end
        endcase
    end

endmodule