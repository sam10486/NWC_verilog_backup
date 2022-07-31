`include "../include/define.svh"


module R16_IN_mux (
    input LAST_STAGE,
    input [`D_width-1:0] mem_x0 ,
    input [`D_width-1:0] mem_x1 ,
    input [`D_width-1:0] mem_x2 ,
    input [`D_width-1:0] mem_x3 ,
    input [`D_width-1:0] mem_x4 ,
    input [`D_width-1:0] mem_x5 ,
    input [`D_width-1:0] mem_x6 ,
    input [`D_width-1:0] mem_x7 ,
    input [`D_width-1:0] mem_x8 ,
    input [`D_width-1:0] mem_x9 ,
    input [`D_width-1:0] mem_x10,
    input [`D_width-1:0] mem_x11,
    input [`D_width-1:0] mem_x12,
    input [`D_width-1:0] mem_x13,
    input [`D_width-1:0] mem_x14,
    input [`D_width-1:0] mem_x15,

    input [`D_width-1:0] twiddle_0,
    input [`D_width-1:0] twiddle_1,
    input [`D_width-1:0] twiddle_2,
    input [`D_width-1:0] twiddle_3,
    input [`D_width-1:0] twiddle_4,
    input [`D_width-1:0] twiddle_5,
    input [`D_width-1:0] twiddle_6,
    input [`D_width-1:0] twiddle_7,
    input [`D_width-1:0] twiddle_8,
    input [`D_width-1:0] twiddle_9,
    input [`D_width-1:0] twiddle_10,
    input [`D_width-1:0] twiddle_11,
    input [`D_width-1:0] twiddle_12,
    input [`D_width-1:0] twiddle_13,
    input [`D_width-1:0] twiddle_14,
    input [`D_width-1:0] twiddle_15,

    output logic [`D_width-1:0] R16_x0_mux  ,
    output logic [`D_width-1:0] R16_x1_mux  ,
    output logic [`D_width-1:0] R16_x2_mux  ,
    output logic [`D_width-1:0] R16_x3_mux  ,
    output logic [`D_width-1:0] R16_x4_mux  ,
    output logic [`D_width-1:0] R16_x5_mux  ,
    output logic [`D_width-1:0] R16_x6_mux  ,
    output logic [`D_width-1:0] R16_x7_mux  ,
    output logic [`D_width-1:0] R16_x8_mux  ,
    output logic [`D_width-1:0] R16_x9_mux  ,
    output logic [`D_width-1:0] R16_x10_mux ,
    output logic [`D_width-1:0] R16_x11_mux ,
    output logic [`D_width-1:0] R16_x12_mux ,
    output logic [`D_width-1:0] R16_x13_mux ,
    output logic [`D_width-1:0] R16_x14_mux ,
    output logic [`D_width-1:0] R16_x15_mux ,

    output logic [`D_width-1:0] R16_twiddle0_mux  ,
    output logic [`D_width-1:0] R16_twiddle1_mux  ,
    output logic [`D_width-1:0] R16_twiddle2_mux  ,
    output logic [`D_width-1:0] R16_twiddle3_mux  ,
    output logic [`D_width-1:0] R16_twiddle4_mux  ,
    output logic [`D_width-1:0] R16_twiddle5_mux  ,
    output logic [`D_width-1:0] R16_twiddle6_mux  ,
    output logic [`D_width-1:0] R16_twiddle7_mux  ,
    output logic [`D_width-1:0] R16_twiddle8_mux  ,
    output logic [`D_width-1:0] R16_twiddle9_mux  ,
    output logic [`D_width-1:0] R16_twiddle10_mux ,
    output logic [`D_width-1:0] R16_twiddle11_mux ,
    output logic [`D_width-1:0] R16_twiddle12_mux ,
    output logic [`D_width-1:0] R16_twiddle13_mux ,
    output logic [`D_width-1:0] R16_twiddle14_mux ,
    output logic [`D_width-1:0] R16_twiddle15_mux 
);

    always_comb begin
        if (LAST_STAGE) begin
            R16_x0_mux = mem_x0;
            R16_x1_mux = 'd0;
            R16_x2_mux = 'd0;
            R16_x3_mux = 'd0;
            R16_x4_mux = 'd0;
            R16_x5_mux = 'd0;
            R16_x6_mux = 'd0;
            R16_x7_mux = 'd0;
            R16_x8_mux = mem_x1;
            R16_x0_mux = 'd0;
            R16_x1_mux = 'd0;
            R16_x2_mux = 'd0;
            R16_x3_mux = 'd0;
            R16_x4_mux = 'd0;
            R16_x5_mux = 'd0;
            R16_x6_mux = 'd0;
            R16_x7_mux = 'd0;
            R16_x8_mux = 'd0;

            R16_twiddle0_mux  = 'd0   ;  
            R16_twiddle1_mux  = twiddle_0;  
            R16_twiddle2_mux  = 'd0  ;  
            R16_twiddle3_mux  = 'd0  ;  
            R16_twiddle4_mux  = 'd0  ;  
            R16_twiddle5_mux  = 'd0  ;  
            R16_twiddle6_mux  = 'd0  ;  
            R16_twiddle7_mux  = 'd0  ;  
            R16_twiddle8_mux  = 'd0  ;  
            R16_twiddle9_mux  = 'd0  ;  
            R16_twiddle10_mux = 'd0  ;   
            R16_twiddle11_mux = 'd0  ;   
            R16_twiddle12_mux = 'd0  ;  
            R16_twiddle13_mux = 'd0  ;  
            R16_twiddle14_mux = 'd0  ;  
            R16_twiddle15_mux = 'd0  ;  
        end else begin
            R16_x0_mux = mem_x0;
            R16_x1_mux = mem_x1;
            R16_x2_mux = mem_x2;
            R16_x3_mux = mem_x3;
            R16_x4_mux = mem_x4;
            R16_x5_mux = mem_x5;
            R16_x6_mux = mem_x6;
            R16_x7_mux = mem_x7;
            R16_x8_mux = mem_x8;
            R16_x9_mux = mem_x9;
            R16_x10_mux = mem_x10;
            R16_x11_mux = mem_x11;
            R16_x12_mux = mem_x12;
            R16_x13_mux = mem_x13;
            R16_x14_mux = mem_x14;
            R16_x15_mux = mem_x15;

            R16_twiddle0_mux  = twiddle_0   ;
            R16_twiddle1_mux  = twiddle_1   ;
            R16_twiddle2_mux  = twiddle_2   ;
            R16_twiddle3_mux  = twiddle_3   ;
            R16_twiddle4_mux  = twiddle_4   ;
            R16_twiddle5_mux  = twiddle_5   ;
            R16_twiddle6_mux  = twiddle_6   ;
            R16_twiddle7_mux  = twiddle_7   ;
            R16_twiddle8_mux  = twiddle_8   ;
            R16_twiddle9_mux  = twiddle_9   ;
            R16_twiddle10_mux = twiddle_10  ;
            R16_twiddle11_mux = twiddle_11  ;
            R16_twiddle12_mux = twiddle_12  ;
            R16_twiddle13_mux = twiddle_13  ;
            R16_twiddle14_mux = twiddle_14  ;
            R16_twiddle15_mux = twiddle_15  ;
        end
    end

endmodule