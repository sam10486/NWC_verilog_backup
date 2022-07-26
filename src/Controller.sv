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
    
    enum {RESET, IDLE, NTT_ite0, NTT_ite1, NTT_ite2, NTT_buffer_0, NTT_buffer_1, NTT_buffer_2, NTT_finish
            , Fin_state} cs, ns;

    parameter bank_num = `bank_num;
    parameter k = `ite_k;
    parameter delay_cycle = 2;
    parameter ite_0 = `ite_0;
    parameter ite_1 = `ite_1;
    parameter ite_2 = `ite_2;
    parameter BU_total = `BU_total;
    parameter degree = `degree;
    parameter total_BU_number = `ite_0;

    logic [`D_width-1:0] ite_stage;
    logic [`D_width-1:0] ite_sw_cnt;
    logic [`D_width-1:0] BU_cnt;
    logic [`D_width-1:0] BU_group_cnt;
    logic [`D_width-1:0] delay_cnt;
    logic delay_flag;
    logic compute_complete;

    logic [`D_width-1:0] TF_base_l;
    logic [`D_width-1:0] TF_base_i;
    logic [`D_width-1:0] TF_const_i;

    logic [`D_width-1:0] buffer_0_cnt;
    parameter buffer_0_cnt_bound = 12;

    logic [`D_width-1:0] buffer_1_cnt;
    parameter buffer_1_cnt_bound = 12;

    logic [`D_width-1:0] buffer_2_cnt;
    parameter buffer_2_cnt_bound = 12;

    logic [`D_width-1:0] AGU_en_cnt;

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
            BU_group_cnt <= 'd0;
        end else begin
            if (r_enable) begin
                case (cs)
                    NTT_ite0: begin
                        if (BU_cnt == ite_0-1) begin
                            BU_cnt <= 'd0;
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end
                        end
                        BU_group_cnt <= 'd0;
                    end
                    NTT_ite1: begin
                        if (BU_cnt == ite_1-1) begin
                            BU_cnt <= 'd0;
                            if (BU_group_cnt == 'd15) begin
                                BU_group_cnt <= 'd0;
                            end else begin
                                BU_group_cnt <= BU_group_cnt + 'd1;
                            end
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end 
                            BU_group_cnt <= BU_group_cnt;

                        end
                    end
                    NTT_ite2: begin
                        if (BU_cnt == ite_2-1) begin
                            BU_cnt <= 'd0;
                            if (BU_group_cnt == 'd1) begin
                                BU_group_cnt <= 'd0;
                            end else begin
                                BU_group_cnt <= BU_group_cnt + 'd1;
                            end
                        end else begin
                            if (TF_ren) begin
                                BU_cnt <= BU_cnt + 'd1;
                            end else begin
                                BU_cnt <= BU_cnt;
                            end
                            BU_group_cnt <= 'd0;
                        end
                    end 
                    default: begin
                        BU_cnt <= 'd0;
                        BU_group_cnt <= 'd0;
                    end
                endcase
            end
        end
    end

    //---------buffer_0_cnt-------------------------

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            buffer_0_cnt <= 'd0;
        end else begin
            if (cs == NTT_buffer_0) begin
                if (buffer_0_cnt == buffer_0_cnt_bound) begin
                    buffer_0_cnt <= buffer_0_cnt;
                end else begin
                    buffer_0_cnt <= buffer_0_cnt + 'd1;
                end
            end
        end
    end

    //---------buffer_1_cnt--------------------

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            buffer_1_cnt <= 'd0;
        end else begin
            if (cs == NTT_buffer_1) begin
                if (buffer_1_cnt == buffer_1_cnt_bound) begin
                    buffer_1_cnt <= buffer_1_cnt;
                end else begin
                    buffer_1_cnt <= buffer_1_cnt + 'd1;
                end
            end
        end
    end


    //----------AGU_enable cnt-------------
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            AGU_en_cnt <= 'd0;
        end else begin
            case (cs)
                NTT_ite0: begin
                    if (AGU_en_cnt == ite_0) begin
                        AGU_en_cnt <= AGU_en_cnt;
                    end else begin
                        AGU_en_cnt <= AGU_en_cnt + 'd1;
                    end
                end
                NTT_ite1: begin
                    if (AGU_en_cnt == ite_1-'d1) begin
                        AGU_en_cnt <= AGU_en_cnt;
                    end else begin
                        AGU_en_cnt <= AGU_en_cnt + 'd1;
                    end
                end
                NTT_ite2: begin
                    if (AGU_en_cnt == ite_2-'d1) begin
                        AGU_en_cnt <= AGU_en_cnt;
                    end else begin
                        AGU_en_cnt <= AGU_en_cnt + 'd1;
                    end
                end 
                default: begin
                    AGU_en_cnt <= 'd0;
                end
            endcase
        end
    end

    //---------depth cnt-----------------
    logic [1:0] depth_buf_cnt;
    logic [`D_width-1:0] ite2_depth_buf;
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            depth_buf_cnt <= 'd0;
            ite2_depth_buf <= 'd2;
        end else begin
            if (TF_ren && cs == NTT_ite2) begin
                case (depth_buf_cnt)
                    'b00: begin
                        depth_buf_cnt <= depth_buf_cnt + 'd1;
                        ite2_depth_buf <= ite_stage;
                    end 
                    'b01: begin
                        depth_buf_cnt <= depth_buf_cnt + 'd1;
                        ite2_depth_buf <= ite_stage + 'd1  ;
                    end
                    'b10: begin
                        depth_buf_cnt <= depth_buf_cnt + 'd1;
                        ite2_depth_buf <= ite_stage + 'd1 ;
                    end
                    'b11: begin
                        depth_buf_cnt <= depth_buf_cnt + 'd1;
                        ite2_depth_buf <= ite_stage;
                    end
                    default: begin
                        depth_buf_cnt <= 'd0;
                        ite2_depth_buf <= 'd0;
                    end
                endcase
            end 
        end
    end

    //---------buffer_2_cnt--------------------

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            buffer_2_cnt <= 'd0;
        end else begin
            if (cs == NTT_buffer_2) begin
                if (buffer_2_cnt == buffer_2_cnt_bound) begin
                    buffer_2_cnt <= buffer_2_cnt;
                end else begin
                    buffer_2_cnt <= buffer_2_cnt + 'd1;
                end
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
            NTT_ite0: begin
                if (BN_MA_out_en) begin
                    r_enable <= 'd1;
                    TF_init_base = 'd0;
                    TF_ren = 'd1;
                    TF_init_const = 'd0;
                    it_depth_cnt = ite_stage;
                end else begin
                    r_enable = 'd0;
                    TF_init_base = 'd0;
                    TF_ren = 'd0;
                    TF_init_const = 'd0;
                    it_depth_cnt = 'd0;
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
                if (AGU_en_cnt == ite_0) begin
                    AGU_enable = 'd0;
                end else begin
                    AGU_enable = 'd1;
                end
                TF_wen = 'd0;
            end
            NTT_buffer_0: begin
                TF_init_base = 'd0;
                TF_ren = 'd0;
                TF_wen = 'd0;
                TF_init_const = 'd0;
                it_depth_cnt = ite_stage;
                compute_complete = 'd0;
                AGU_enable = 'd0;
                r_enable = 'd0;
                w_enable = 'd1; 
                if (r_enable_out) begin
                    ntt_enable = 'd1; 
                end else begin
                    ntt_enable = 'd0; 
                end
            end
            NTT_ite1: begin
                if (BN_MA_out_en) begin
                    r_enable <= 'd1;
                    TF_init_base = 'd0;
                    TF_ren = 'd1;
                    TF_init_const = 'd0;
                    it_depth_cnt = ite_stage;
                end else begin
                    r_enable = 'd0;
                    TF_init_base = 'd0;
                    TF_ren = 'd0;
                    TF_init_const = 'd0;
                    it_depth_cnt = 'd0;
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
                if (BU_cnt == ite_1-1 && BU_group_cnt != 'd15) begin
                    TF_wen <= 'd1;
                end else begin
                    TF_wen <= 'd0;
                end
                AGU_enable = 'd1;
            end
            NTT_buffer_1: begin
                TF_init_base = 'd0;
                TF_ren = 'd0;
                TF_wen = 'd0;
                TF_init_const = 'd0;
                it_depth_cnt = ite_stage;
                compute_complete = 'd0;
                AGU_enable = 'd0;
                r_enable = 'd0;
                w_enable = 'd1; 
                if (r_enable_out) begin
                    ntt_enable = 'd1; 
                end else begin
                    ntt_enable = 'd0; 
                end
            end
            NTT_ite2: begin
                if (BN_MA_out_en) begin
                    r_enable <= 'd1;
                    TF_init_base = 'd0;
                    TF_ren = 'd1;
                    TF_init_const = 'd0;
                    it_depth_cnt = ite2_depth_buf;
                end else begin
                    r_enable = 'd0;
                    TF_init_base = 'd0;
                    TF_ren = 'd0;
                    TF_init_const = 'd0;
                    it_depth_cnt = 'd0;
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
                if (BU_group_cnt == 'd1) begin
                    TF_wen <= 'd1;
                end else begin
                    TF_wen <= 'd0;
                end
                AGU_enable = 'd1;
            end
            NTT_buffer_2: begin
                TF_init_base = 'd0;
                TF_ren = 'd0;
                TF_wen = 'd0;
                TF_init_const = 'd0;
                it_depth_cnt = ite_stage;
                compute_complete = 'd0;
                AGU_enable = 'd0;
                r_enable = 'd0;
                w_enable = 'd1; 
                if (r_enable_out) begin
                    ntt_enable = 'd1; 
                end else begin
                    ntt_enable = 'd0; 
                end
            end
            NTT_finish: begin
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
                    ns <= NTT_ite0;
                end else begin
                    ns <= cs;
                end
            end 
            NTT_ite0: begin //2
                if (ite_sw_cnt == total_BU_number-1) begin
                    ns <= NTT_buffer_0;
                end else begin
                    ns <= cs;
                end          
            end
            NTT_buffer_0: begin
                if (buffer_0_cnt == buffer_0_cnt_bound) begin
                    ns <= NTT_ite1;
                end else begin
                    ns <= cs; 
                end
            end
            NTT_ite1: begin
                if (ite_sw_cnt == total_BU_number-1) begin
                    ns <= NTT_buffer_1;
                end else begin
                    ns <= cs; 
                end
            end
            NTT_buffer_1: begin
                if (buffer_1_cnt == buffer_1_cnt_bound) begin
                    ns <= NTT_ite2;
                end else begin
                    ns <= cs; 
                end
            end
            NTT_ite2: begin
               if (ite_sw_cnt == total_BU_number-1) begin
                    ns <= NTT_buffer_2;
                end else begin
                    ns <= cs; 
                end
            end
            NTT_buffer_2: begin
                if (buffer_2_cnt == buffer_2_cnt_bound) begin
                    ns <= NTT_finish;
                end else begin
                    ns <= cs; 
                end
            end
            NTT_finish: begin
                ns <= NTT_finish;
            end
            default: begin
            end
        endcase
    end

endmodule