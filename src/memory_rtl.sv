`include "../include/define.svh"

module memory_rtl(
    input [`D_width-1:0] data_in0,
    input [`D_width-1:0] data_in1,
    input [`D_width-1:0] data_in2,
    input [`D_width-1:0] data_in3,
    input [`D_width-1:0] data_in4,
    input [`D_width-1:0] data_in5,
    input [`D_width-1:0] data_in6,
    input [`D_width-1:0] data_in7,
    input [`D_width-1:0] data_in8,
    input [`D_width-1:0] data_in9,
    input [`D_width-1:0] data_in10,
    input [`D_width-1:0] data_in11,
    input [`D_width-1:0] data_in12,
    input [`D_width-1:0] data_in13,
    input [`D_width-1:0] data_in14,
    input [`D_width-1:0] data_in15,

    input [`D_width-1:0] MA0_idx,
    input [`D_width-1:0] MA1_idx,
    input [`D_width-1:0] MA2_idx,
    input [`D_width-1:0] MA3_idx,
    input [`D_width-1:0] MA4_idx,
    input [`D_width-1:0] MA5_idx,
    input [`D_width-1:0] MA6_idx,
    input [`D_width-1:0] MA7_idx,
    input [`D_width-1:0] MA8_idx,
    input [`D_width-1:0] MA9_idx,
    input [`D_width-1:0] MA10_idx,
    input [`D_width-1:0] MA11_idx,
    input [`D_width-1:0] MA12_idx,
    input [`D_width-1:0] MA13_idx,
    input [`D_width-1:0] MA14_idx,
    input [`D_width-1:0] MA15_idx,

    input [`D_width-1:0] BN0_idx,
    input [`D_width-1:0] BN1_idx,
    input [`D_width-1:0] BN2_idx,
    input [`D_width-1:0] BN3_idx,
    input [`D_width-1:0] BN4_idx,
    input [`D_width-1:0] BN5_idx,
    input [`D_width-1:0] BN6_idx,
    input [`D_width-1:0] BN7_idx,
    input [`D_width-1:0] BN8_idx,
    input [`D_width-1:0] BN9_idx,
    input [`D_width-1:0] BN10_idx,
    input [`D_width-1:0] BN11_idx,
    input [`D_width-1:0] BN12_idx,
    input [`D_width-1:0] BN13_idx,
    input [`D_width-1:0] BN14_idx,
    input [`D_width-1:0] BN15_idx,
    

    input r_enable,
    input w_enable,
    input clk,
    input rst,
    input [`D_width-1:0] R16_w_MA0_idx,
    input [`D_width-1:0] R16_w_MA1_idx,
    input [`D_width-1:0] R16_w_MA2_idx,
    input [`D_width-1:0] R16_w_MA3_idx,
    input [`D_width-1:0] R16_w_MA4_idx,
    input [`D_width-1:0] R16_w_MA5_idx,
    input [`D_width-1:0] R16_w_MA6_idx,
    input [`D_width-1:0] R16_w_MA7_idx,
    input [`D_width-1:0] R16_w_MA8_idx,
    input [`D_width-1:0] R16_w_MA9_idx,
    input [`D_width-1:0] R16_w_MA10_idx,
    input [`D_width-1:0] R16_w_MA11_idx,
    input [`D_width-1:0] R16_w_MA12_idx,
    input [`D_width-1:0] R16_w_MA13_idx,
    input [`D_width-1:0] R16_w_MA14_idx,
    input [`D_width-1:0] R16_w_MA15_idx,

    input [`D_width-1:0] R16_w_BN0_idx,
    input [`D_width-1:0] R16_w_BN1_idx,
    input [`D_width-1:0] R16_w_BN2_idx,
    input [`D_width-1:0] R16_w_BN3_idx,
    input [`D_width-1:0] R16_w_BN4_idx,
    input [`D_width-1:0] R16_w_BN5_idx,
    input [`D_width-1:0] R16_w_BN6_idx,
    input [`D_width-1:0] R16_w_BN7_idx,
    input [`D_width-1:0] R16_w_BN8_idx,
    input [`D_width-1:0] R16_w_BN9_idx,
    input [`D_width-1:0] R16_w_BN10_idx,
    input [`D_width-1:0] R16_w_BN11_idx,
    input [`D_width-1:0] R16_w_BN12_idx,
    input [`D_width-1:0] R16_w_BN13_idx,
    input [`D_width-1:0] R16_w_BN14_idx,
    input [`D_width-1:0] R16_w_BN15_idx,

    output logic [`D_width-1:0] memory_b0,
    output logic [`D_width-1:0] memory_b1,
    output logic [`D_width-1:0] memory_b2,
    output logic [`D_width-1:0] memory_b3,
    output logic [`D_width-1:0] memory_b4,
    output logic [`D_width-1:0] memory_b5,
    output logic [`D_width-1:0] memory_b6,
    output logic [`D_width-1:0] memory_b7,
    output logic [`D_width-1:0] memory_b8,
    output logic [`D_width-1:0] memory_b9,
    output logic [`D_width-1:0] memory_b10,
    output logic [`D_width-1:0] memory_b11,
    output logic [`D_width-1:0] memory_b12,
    output logic [`D_width-1:0] memory_b13,
    output logic [`D_width-1:0] memory_b14,
    output logic [`D_width-1:0] memory_b15,

    output logic r_enable_out,
    output logic w_enable_out,
    output logic [`D_width-1:0] MA0_idx_out,
    output logic [`D_width-1:0] MA1_idx_out,
    output logic [`D_width-1:0] MA2_idx_out,
    output logic [`D_width-1:0] MA3_idx_out,
    output logic [`D_width-1:0] MA4_idx_out,
    output logic [`D_width-1:0] MA5_idx_out,
    output logic [`D_width-1:0] MA6_idx_out,
    output logic [`D_width-1:0] MA7_idx_out,
    output logic [`D_width-1:0] MA8_idx_out,
    output logic [`D_width-1:0] MA9_idx_out,
    output logic [`D_width-1:0] MA10_idx_out,
    output logic [`D_width-1:0] MA11_idx_out,
    output logic [`D_width-1:0] MA12_idx_out,
    output logic [`D_width-1:0] MA13_idx_out,
    output logic [`D_width-1:0] MA14_idx_out,
    output logic [`D_width-1:0] MA15_idx_out,

    output logic [`D_width-1:0] BN0_idx_out,
    output logic [`D_width-1:0] BN1_idx_out,
    output logic [`D_width-1:0] BN2_idx_out,
    output logic [`D_width-1:0] BN3_idx_out,
    output logic [`D_width-1:0] BN4_idx_out,
    output logic [`D_width-1:0] BN5_idx_out,
    output logic [`D_width-1:0] BN6_idx_out,
    output logic [`D_width-1:0] BN7_idx_out,
    output logic [`D_width-1:0] BN8_idx_out,
    output logic [`D_width-1:0] BN9_idx_out,
    output logic [`D_width-1:0] BN10_idx_out,
    output logic [`D_width-1:0] BN11_idx_out,
    output logic [`D_width-1:0] BN12_idx_out,
    output logic [`D_width-1:0] BN13_idx_out,
    output logic [`D_width-1:0] BN14_idx_out,
    output logic [`D_width-1:0] BN15_idx_out

);


    logic [`D_width-1:0] memory_array [0:`BN-1][0:`MA-1];
 

    always_ff @( posedge clk or posedge rst ) begin
        integer i, j;
        if (rst) begin
            for (i = 0; i<`BN; i=i+1) begin
                for (j = 0; j<`MA ; j=j+1 ) begin
                    memory_array[i][j] <= 'd0;
                end
            end
        end 
    end
    
    logic [`D_width-1:0] test0_0, test0_1, test0_2, test1_0, test1_1, test1_2;

    assign test0_0 = memory_array[0][0];
    assign test0_1 = memory_array[2][32];
    assign test0_2 = memory_array[4][64];

    assign test1_0 = R16_w_BN0_idx;
    assign test1_1 = R16_w_MA0_idx;
    assign test1_2 = memory_array[5][0];

/*
    logic [`D_width-1:0] data_in0_tmp;
    logic [`D_width-1:0] data_in1_tmp;
    logic [`D_width-1:0] data_in2_tmp;
    logic [`D_width-1:0] data_in3_tmp;
    logic [`D_width-1:0] data_in4_tmp;
    logic [`D_width-1:0] data_in5_tmp;
    logic [`D_width-1:0] data_in6_tmp;
    logic [`D_width-1:0] data_in7_tmp;
    logic [`D_width-1:0] data_in8_tmp;
    logic [`D_width-1:0] data_in9_tmp;
    logic [`D_width-1:0] data_in10_tmp;
    logic [`D_width-1:0] data_in11_tmp;
    logic [`D_width-1:0] data_in12_tmp;
    logic [`D_width-1:0] data_in13_tmp;
    logic [`D_width-1:0] data_in14_tmp;
    logic [`D_width-1:0] data_in15_tmp;

    logic [`D_width-1:0] R16_w_MA0_idx_tmp;
    logic [`D_width-1:0] R16_w_MA1_idx_tmp;
    logic [`D_width-1:0] R16_w_MA2_idx_tmp;
    logic [`D_width-1:0] R16_w_MA3_idx_tmp;
    logic [`D_width-1:0] R16_w_MA4_idx_tmp;
    logic [`D_width-1:0] R16_w_MA5_idx_tmp;
    logic [`D_width-1:0] R16_w_MA6_idx_tmp;
    logic [`D_width-1:0] R16_w_MA7_idx_tmp;
    logic [`D_width-1:0] R16_w_MA8_idx_tmp;
    logic [`D_width-1:0] R16_w_MA9_idx_tmp;
    logic [`D_width-1:0] R16_w_MA10_idx_tmp;
    logic [`D_width-1:0] R16_w_MA11_idx_tmp;
    logic [`D_width-1:0] R16_w_MA12_idx_tmp;
    logic [`D_width-1:0] R16_w_MA13_idx_tmp;
    logic [`D_width-1:0] R16_w_MA14_idx_tmp;
    logic [`D_width-1:0] R16_w_MA15_idx_tmp;

    logic [`D_width-1:0] R16_w_BN0_idx_tmp;
    logic [`D_width-1:0] R16_w_BN1_idx_tmp;
    logic [`D_width-1:0] R16_w_BN2_idx_tmp;
    logic [`D_width-1:0] R16_w_BN3_idx_tmp;
    logic [`D_width-1:0] R16_w_BN4_idx_tmp;
    logic [`D_width-1:0] R16_w_BN5_idx_tmp;
    logic [`D_width-1:0] R16_w_BN6_idx_tmp;
    logic [`D_width-1:0] R16_w_BN7_idx_tmp;
    logic [`D_width-1:0] R16_w_BN8_idx_tmp;
    logic [`D_width-1:0] R16_w_BN9_idx_tmp;
    logic [`D_width-1:0] R16_w_BN10_idx_tmp;
    logic [`D_width-1:0] R16_w_BN11_idx_tmp;
    logic [`D_width-1:0] R16_w_BN12_idx_tmp;
    logic [`D_width-1:0] R16_w_BN13_idx_tmp;
    logic [`D_width-1:0] R16_w_BN14_idx_tmp;
    logic [`D_width-1:0] R16_w_BN15_idx_tmp;

    logic r_enable_tmp;
    logic w_enable_tmp;


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            data_in0_tmp    <=  'd0   ;
            data_in1_tmp    <=  'd0   ;
            data_in2_tmp    <=  'd0   ;
            data_in3_tmp    <=  'd0   ;
            data_in4_tmp    <=  'd0   ;
            data_in5_tmp    <=  'd0   ;
            data_in6_tmp    <=  'd0   ;
            data_in7_tmp    <=  'd0   ;
            data_in8_tmp    <=  'd0   ;
            data_in9_tmp    <=  'd0   ;
            data_in10_tmp   <=  'd0   ; 
            data_in11_tmp   <=  'd0   ; 
            data_in12_tmp   <=  'd0   ; 
            data_in13_tmp   <=  'd0   ; 
            data_in14_tmp   <=  'd0   ; 
            data_in15_tmp   <=  'd0   ; 

            R16_w_MA0_idx_tmp   <=  'd0  ;
            R16_w_MA1_idx_tmp   <=  'd0  ;
            R16_w_MA2_idx_tmp   <=  'd0  ;
            R16_w_MA3_idx_tmp   <=  'd0  ;
            R16_w_MA4_idx_tmp   <=  'd0  ;
            R16_w_MA5_idx_tmp   <=  'd0  ;
            R16_w_MA6_idx_tmp   <=  'd0  ;
            R16_w_MA7_idx_tmp   <=  'd0  ;
            R16_w_MA8_idx_tmp   <=  'd0  ;
            R16_w_MA9_idx_tmp   <=  'd0  ;
            R16_w_MA10_idx_tmp  <=  'd0  ;
            R16_w_MA11_idx_tmp  <=  'd0  ;
            R16_w_MA12_idx_tmp  <=  'd0  ;
            R16_w_MA13_idx_tmp  <=  'd0  ;
            R16_w_MA14_idx_tmp  <=  'd0  ;
            R16_w_MA15_idx_tmp  <=  'd0  ;

            R16_w_BN0_idx_tmp   <=  'd0  ;
            R16_w_BN1_idx_tmp   <=  'd0  ;
            R16_w_BN2_idx_tmp   <=  'd0  ;
            R16_w_BN3_idx_tmp   <=  'd0  ;
            R16_w_BN4_idx_tmp   <=  'd0  ;
            R16_w_BN5_idx_tmp   <=  'd0  ;
            R16_w_BN6_idx_tmp   <=  'd0  ;
            R16_w_BN7_idx_tmp   <=  'd0  ;
            R16_w_BN8_idx_tmp   <=  'd0  ;
            R16_w_BN9_idx_tmp   <=  'd0  ;
            R16_w_BN10_idx_tmp  <=  'd0  ; 
            R16_w_BN11_idx_tmp  <=  'd0  ; 
            R16_w_BN12_idx_tmp  <=  'd0  ; 
            R16_w_BN13_idx_tmp  <=  'd0  ; 
            R16_w_BN14_idx_tmp  <=  'd0  ; 
            R16_w_BN15_idx_tmp  <=  'd0  ; 
            r_enable_tmp <= 'd0;
            w_enable_tmp <= 'd0;
        end else begin
            data_in0_tmp    <=  data_in0    ;
            data_in1_tmp    <=  data_in1    ;
            data_in2_tmp    <=  data_in2    ;
            data_in3_tmp    <=  data_in3    ;
            data_in4_tmp    <=  data_in4    ;
            data_in5_tmp    <=  data_in5    ;
            data_in6_tmp    <=  data_in6    ;
            data_in7_tmp    <=  data_in7    ;
            data_in8_tmp    <=  data_in8    ;
            data_in9_tmp    <=  data_in9    ;
            data_in10_tmp   <=  data_in10   ; 
            data_in11_tmp   <=  data_in11   ; 
            data_in12_tmp   <=  data_in12   ; 
            data_in13_tmp   <=  data_in13   ; 
            data_in14_tmp   <=  data_in14   ; 
            data_in15_tmp   <=  data_in15   ; 

            R16_w_MA0_idx_tmp   <=  R16_w_MA0_idx   ;
            R16_w_MA1_idx_tmp   <=  R16_w_MA1_idx   ;
            R16_w_MA2_idx_tmp   <=  R16_w_MA2_idx   ;
            R16_w_MA3_idx_tmp   <=  R16_w_MA3_idx   ;
            R16_w_MA4_idx_tmp   <=  R16_w_MA4_idx   ;
            R16_w_MA5_idx_tmp   <=  R16_w_MA5_idx   ;
            R16_w_MA6_idx_tmp   <=  R16_w_MA6_idx   ;
            R16_w_MA7_idx_tmp   <=  R16_w_MA7_idx   ;
            R16_w_MA8_idx_tmp   <=  R16_w_MA8_idx   ;
            R16_w_MA9_idx_tmp   <=  R16_w_MA9_idx   ;
            R16_w_MA10_idx_tmp  <=  R16_w_MA10_idx  ;
            R16_w_MA11_idx_tmp  <=  R16_w_MA11_idx  ;
            R16_w_MA12_idx_tmp  <=  R16_w_MA12_idx  ;
            R16_w_MA13_idx_tmp  <=  R16_w_MA13_idx  ;
            R16_w_MA14_idx_tmp  <=  R16_w_MA14_idx  ;
            R16_w_MA15_idx_tmp  <=  R16_w_MA15_idx  ;

            R16_w_BN0_idx_tmp   <=  R16_w_BN0_idx   ;
            R16_w_BN1_idx_tmp   <=  R16_w_BN1_idx   ;
            R16_w_BN2_idx_tmp   <=  R16_w_BN2_idx   ;
            R16_w_BN3_idx_tmp   <=  R16_w_BN3_idx   ;
            R16_w_BN4_idx_tmp   <=  R16_w_BN4_idx   ;
            R16_w_BN5_idx_tmp   <=  R16_w_BN5_idx   ;
            R16_w_BN6_idx_tmp   <=  R16_w_BN6_idx   ;
            R16_w_BN7_idx_tmp   <=  R16_w_BN7_idx   ;
            R16_w_BN8_idx_tmp   <=  R16_w_BN8_idx   ;
            R16_w_BN9_idx_tmp   <=  R16_w_BN9_idx   ;
            R16_w_BN10_idx_tmp  <=  R16_w_BN10_idx  ; 
            R16_w_BN11_idx_tmp  <=  R16_w_BN11_idx  ; 
            R16_w_BN12_idx_tmp  <=  R16_w_BN12_idx  ; 
            R16_w_BN13_idx_tmp  <=  R16_w_BN13_idx  ; 
            R16_w_BN14_idx_tmp  <=  R16_w_BN14_idx  ; 
            R16_w_BN15_idx_tmp  <=  R16_w_BN15_idx  ; 

            r_enable_tmp <= r_enable;
            w_enable_tmp <= w_enable;
        end
    end
*/
    always_ff@(posedge clk) begin
        case({r_enable, w_enable})
            'b10: begin
                memory_b0       = memory_array[BN0_idx][MA0_idx];
                memory_b1       = memory_array[BN1_idx][MA1_idx];
                memory_b2       = memory_array[BN2_idx][MA2_idx];
                memory_b3       = memory_array[BN3_idx][MA3_idx];
                memory_b4       = memory_array[BN4_idx][MA4_idx];
                memory_b5       = memory_array[BN5_idx][MA5_idx];
                memory_b6       = memory_array[BN6_idx][MA6_idx];
                memory_b7       = memory_array[BN7_idx][MA7_idx];
                memory_b8       = memory_array[BN8_idx][MA8_idx];
                memory_b9       = memory_array[BN9_idx][MA9_idx];
                memory_b10      = memory_array[BN10_idx][MA10_idx];
                memory_b11      = memory_array[BN11_idx][MA11_idx];
                memory_b12      = memory_array[BN12_idx][MA12_idx];
                memory_b13      = memory_array[BN13_idx][MA13_idx];
                memory_b14      = memory_array[BN14_idx][MA14_idx];
                memory_b15      = memory_array[BN15_idx][MA15_idx];
                MA0_idx_out     = MA0_idx;
                MA1_idx_out     = MA1_idx;
                MA2_idx_out     = MA2_idx;
                MA3_idx_out     = MA3_idx;
                MA4_idx_out     = MA4_idx;
                MA5_idx_out     = MA5_idx;
                MA6_idx_out     = MA6_idx;
                MA7_idx_out     = MA7_idx;
                MA8_idx_out     = MA8_idx;
                MA9_idx_out     = MA9_idx;
                MA10_idx_out    = MA10_idx;
                MA11_idx_out    = MA11_idx;
                MA12_idx_out    = MA12_idx;
                MA13_idx_out    = MA13_idx;
                MA14_idx_out    = MA14_idx;
                MA15_idx_out    = MA15_idx;
                BN0_idx_out     = BN0_idx;
                BN1_idx_out     = BN1_idx;
                BN2_idx_out     = BN2_idx;
                BN3_idx_out     = BN3_idx;
                BN4_idx_out     = BN4_idx;
                BN5_idx_out     = BN5_idx;
                BN6_idx_out     = BN6_idx;
                BN7_idx_out     = BN7_idx;
                BN8_idx_out     = BN8_idx;
                BN9_idx_out     = BN9_idx;
                BN10_idx_out    = BN10_idx;
                BN11_idx_out    = BN11_idx;
                BN12_idx_out    = BN12_idx;
                BN13_idx_out    = BN13_idx;
                BN14_idx_out    = BN14_idx;
                BN15_idx_out    = BN15_idx;
            end
            /*'b01: begin
                memory_array[R16_w_BN0_idx][R16_w_MA0_idx]      = data_in0;
                memory_array[R16_w_BN1_idx][R16_w_MA1_idx]      = data_in1;
                memory_array[R16_w_BN2_idx][R16_w_MA2_idx]      = data_in2;
                memory_array[R16_w_BN3_idx][R16_w_MA3_idx]      = data_in3;
                memory_array[R16_w_BN4_idx][R16_w_MA4_idx]      = data_in4;
                memory_array[R16_w_BN5_idx][R16_w_MA5_idx]      = data_in5;
                memory_array[R16_w_BN6_idx][R16_w_MA6_idx]      = data_in6;
                memory_array[R16_w_BN7_idx][R16_w_MA7_idx]      = data_in7;
                memory_array[R16_w_BN8_idx][R16_w_MA8_idx]      = data_in8;
                memory_array[R16_w_BN9_idx][R16_w_MA9_idx]      = data_in9;
                memory_array[R16_w_BN10_idx][R16_w_MA10_idx]    = data_in10;
                memory_array[R16_w_BN11_idx][R16_w_MA11_idx]    = data_in11;
                memory_array[R16_w_BN12_idx][R16_w_MA12_idx]    = data_in12;
                memory_array[R16_w_BN13_idx][R16_w_MA13_idx]    = data_in13;
                memory_array[R16_w_BN14_idx][R16_w_MA14_idx]    = data_in14;
                memory_array[R16_w_BN15_idx][R16_w_MA15_idx]    = data_in15;
            end*/
            'b11: begin
                memory_b0   = memory_array[BN0_idx][MA0_idx];
                memory_b1   = memory_array[BN1_idx][MA1_idx];
                memory_b2   = memory_array[BN2_idx][MA2_idx];
                memory_b3   = memory_array[BN3_idx][MA3_idx];
                memory_b4   = memory_array[BN4_idx][MA4_idx];
                memory_b5   = memory_array[BN5_idx][MA5_idx];
                memory_b6   = memory_array[BN6_idx][MA6_idx];
                memory_b7   = memory_array[BN7_idx][MA7_idx];
                memory_b8   = memory_array[BN8_idx][MA8_idx];
                memory_b9   = memory_array[BN9_idx][MA9_idx];
                memory_b10  = memory_array[BN10_idx][MA10_idx];
                memory_b11  = memory_array[BN11_idx][MA11_idx];
                memory_b12  = memory_array[BN12_idx][MA12_idx];
                memory_b13  = memory_array[BN13_idx][MA13_idx];
                memory_b14  = memory_array[BN14_idx][MA14_idx];
                memory_b15  = memory_array[BN15_idx][MA15_idx];
                memory_array[R16_w_BN0_idx][R16_w_MA0_idx]      = data_in0;
                memory_array[R16_w_BN1_idx][R16_w_MA1_idx]      = data_in1;
                memory_array[R16_w_BN2_idx][R16_w_MA2_idx]      = data_in2;
                memory_array[R16_w_BN3_idx][R16_w_MA3_idx]      = data_in3;
                memory_array[R16_w_BN4_idx][R16_w_MA4_idx]      = data_in4;
                memory_array[R16_w_BN5_idx][R16_w_MA5_idx]      = data_in5;
                memory_array[R16_w_BN6_idx][R16_w_MA6_idx]      = data_in6;
                memory_array[R16_w_BN7_idx][R16_w_MA7_idx]      = data_in7;
                memory_array[R16_w_BN8_idx][R16_w_MA8_idx]      = data_in8;
                memory_array[R16_w_BN9_idx][R16_w_MA9_idx]      = data_in9;
                memory_array[R16_w_BN10_idx][R16_w_MA10_idx]    = data_in10;
                memory_array[R16_w_BN11_idx][R16_w_MA11_idx]    = data_in11;
                memory_array[R16_w_BN12_idx][R16_w_MA12_idx]    = data_in12;
                memory_array[R16_w_BN13_idx][R16_w_MA13_idx]    = data_in13;
                memory_array[R16_w_BN14_idx][R16_w_MA14_idx]    = data_in14;
                memory_array[R16_w_BN15_idx][R16_w_MA15_idx]    = data_in15;
                MA0_idx_out     = MA0_idx;
                MA1_idx_out     = MA1_idx;
                MA2_idx_out     = MA2_idx;
                MA3_idx_out     = MA3_idx;
                MA4_idx_out     = MA4_idx;
                MA5_idx_out     = MA5_idx;
                MA6_idx_out     = MA6_idx;
                MA7_idx_out     = MA7_idx;
                MA8_idx_out     = MA8_idx;
                MA9_idx_out     = MA9_idx;
                MA10_idx_out    = MA10_idx;
                MA11_idx_out    = MA11_idx;
                MA12_idx_out    = MA12_idx;
                MA13_idx_out    = MA13_idx;
                MA14_idx_out    = MA14_idx;
                MA15_idx_out    = MA15_idx;
                BN0_idx_out     = BN0_idx;
                BN1_idx_out     = BN1_idx;
                BN2_idx_out     = BN2_idx;
                BN3_idx_out     = BN3_idx;
                BN4_idx_out     = BN4_idx;
                BN5_idx_out     = BN5_idx;
                BN6_idx_out     = BN6_idx;
                BN7_idx_out     = BN7_idx;
                BN8_idx_out     = BN8_idx;
                BN9_idx_out     = BN9_idx;
                BN10_idx_out    = BN10_idx;
                BN11_idx_out    = BN11_idx;
                BN12_idx_out    = BN12_idx;
                BN13_idx_out    = BN13_idx;
                BN14_idx_out    = BN14_idx;
                BN15_idx_out    = BN15_idx;
            end
            default: begin
                memory_b0   = 'd0;
                memory_b1   = 'd0;
                memory_b2   = 'd0;
                memory_b3   = 'd0;
                memory_b4   = 'd0;
                memory_b5   = 'd0;
                memory_b6   = 'd0;
                memory_b7   = 'd0;
                memory_b8   = 'd0;
                memory_b9   = 'd0;
                memory_b10  = 'd0;
                memory_b11  = 'd0;
                memory_b12  = 'd0;
                memory_b13  = 'd0;
                memory_b14  = 'd0;
                memory_b15  = 'd0;
                memory_array[BN0_idx][MA0_idx]      = memory_array[BN0_idx][MA0_idx]  ;
                memory_array[BN1_idx][MA1_idx]      = memory_array[BN1_idx][MA1_idx]  ;
                memory_array[BN2_idx][MA2_idx]      = memory_array[BN2_idx][MA2_idx]  ;
                memory_array[BN3_idx][MA3_idx]      = memory_array[BN3_idx][MA3_idx]  ;
                memory_array[BN4_idx][MA4_idx]      = memory_array[BN4_idx][MA4_idx]  ;
                memory_array[BN5_idx][MA5_idx]      = memory_array[BN5_idx][MA5_idx]  ;
                memory_array[BN6_idx][MA6_idx]      = memory_array[BN6_idx][MA6_idx]  ;
                memory_array[BN7_idx][MA7_idx]      = memory_array[BN7_idx][MA7_idx]  ;
                memory_array[BN8_idx][MA8_idx]      = memory_array[BN8_idx][MA8_idx]  ;
                memory_array[BN9_idx][MA9_idx]      = memory_array[BN9_idx][MA9_idx]  ;
                memory_array[BN10_idx][MA10_idx]    = memory_array[BN10_idx][MA10_idx];
                memory_array[BN11_idx][MA11_idx]    = memory_array[BN11_idx][MA11_idx];
                memory_array[BN12_idx][MA12_idx]    = memory_array[BN12_idx][MA12_idx];
                memory_array[BN13_idx][MA13_idx]    = memory_array[BN13_idx][MA13_idx];
                memory_array[BN14_idx][MA14_idx]    = memory_array[BN14_idx][MA14_idx];
                memory_array[BN15_idx][MA14_idx]    = memory_array[BN15_idx][MA14_idx];
                MA0_idx_out     = 'd0;
                MA1_idx_out     = 'd0;
                MA2_idx_out     = 'd0;
                MA3_idx_out     = 'd0;
                MA4_idx_out     = 'd0;
                MA5_idx_out     = 'd0;
                MA6_idx_out     = 'd0;
                MA7_idx_out     = 'd0;
                MA8_idx_out     = 'd0;
                MA9_idx_out     = 'd0;
                MA10_idx_out    = 'd0;
                MA11_idx_out    = 'd0;
                MA12_idx_out    = 'd0;
                MA13_idx_out    = 'd0;
                MA14_idx_out    = 'd0;
                MA15_idx_out    = 'd0;
                BN0_idx_out     = 'd0;
                BN1_idx_out     = 'd0;
                BN2_idx_out     = 'd0;
                BN3_idx_out     = 'd0;
                BN4_idx_out     = 'd0;
                BN5_idx_out     = 'd0;
                BN6_idx_out     = 'd0;
                BN7_idx_out     = 'd0;
                BN8_idx_out     = 'd0;
                BN9_idx_out     = 'd0;
                BN10_idx_out    = 'd0;
                BN11_idx_out    = 'd0;
                BN12_idx_out    = 'd0;
                BN13_idx_out    = 'd0;
                BN14_idx_out    = 'd0;
                BN15_idx_out    = 'd0;
            end
        endcase
        r_enable_out    = r_enable;
        w_enable_out    = w_enable;
    end



endmodule