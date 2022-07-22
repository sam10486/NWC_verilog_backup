`include "../include/define.svh"

module delay_buffer (
    input clk,
    input rst,
    input ntt_enable,
    input [`D_width-1:0] R16_MA0_idx    ,
    input [`D_width-1:0] R16_MA1_idx    ,
    input [`D_width-1:0] R16_MA2_idx    ,
    input [`D_width-1:0] R16_MA3_idx    ,
    input [`D_width-1:0] R16_MA4_idx    ,
    input [`D_width-1:0] R16_MA5_idx    ,
    input [`D_width-1:0] R16_MA6_idx    ,
    input [`D_width-1:0] R16_MA7_idx    ,
    input [`D_width-1:0] R16_MA8_idx    ,
    input [`D_width-1:0] R16_MA9_idx    ,
    input [`D_width-1:0] R16_MA10_idx   ,
    input [`D_width-1:0] R16_MA11_idx   ,
    input [`D_width-1:0] R16_MA12_idx   ,
    input [`D_width-1:0] R16_MA13_idx   ,
    input [`D_width-1:0] R16_MA14_idx   ,
    input [`D_width-1:0] R16_MA15_idx   ,

    input [`D_width-1:0] R16_BN0_idx    ,
    input [`D_width-1:0] R16_BN1_idx    ,
    input [`D_width-1:0] R16_BN2_idx    ,
    input [`D_width-1:0] R16_BN3_idx    ,
    input [`D_width-1:0] R16_BN4_idx    ,
    input [`D_width-1:0] R16_BN5_idx    ,
    input [`D_width-1:0] R16_BN6_idx    ,
    input [`D_width-1:0] R16_BN7_idx    ,
    input [`D_width-1:0] R16_BN8_idx    ,
    input [`D_width-1:0] R16_BN9_idx    ,
    input [`D_width-1:0] R16_BN10_idx   ,
    input [`D_width-1:0] R16_BN11_idx   ,
    input [`D_width-1:0] R16_BN12_idx   ,
    input [`D_width-1:0] R16_BN13_idx   ,
    input [`D_width-1:0] R16_BN14_idx   ,
    input [`D_width-1:0] R16_BN15_idx   ,

    output logic [`D_width-1:0] R16_MA0_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA1_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA2_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA3_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA4_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA5_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA6_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA7_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA8_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA9_idx_pip_out ,
    output logic [`D_width-1:0] R16_MA10_idx_pip_out,
    output logic [`D_width-1:0] R16_MA11_idx_pip_out,
    output logic [`D_width-1:0] R16_MA12_idx_pip_out,
    output logic [`D_width-1:0] R16_MA13_idx_pip_out,
    output logic [`D_width-1:0] R16_MA14_idx_pip_out,
    output logic [`D_width-1:0] R16_MA15_idx_pip_out,

    output logic [`D_width-1:0] R16_BN0_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN1_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN2_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN3_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN4_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN5_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN6_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN7_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN8_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN9_idx_pip_out ,
    output logic [`D_width-1:0] R16_BN10_idx_pip_out,
    output logic [`D_width-1:0] R16_BN11_idx_pip_out,
    output logic [`D_width-1:0] R16_BN12_idx_pip_out,
    output logic [`D_width-1:0] R16_BN13_idx_pip_out,
    output logic [`D_width-1:0] R16_BN14_idx_pip_out,
    output logic [`D_width-1:0] R16_BN15_idx_pip_out,

    output logic ntt_done_pip_out
);

    logic [`D_width-1:0] R16_MA0_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA1_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA2_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA3_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA4_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA5_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA6_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA7_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA8_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA9_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_MA10_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_MA11_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_MA12_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_MA13_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_MA14_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_MA15_idx_pip[0:12]   ;

    logic [`D_width-1:0] R16_BN0_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN1_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN2_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN3_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN4_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN5_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN6_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN7_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN8_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN9_idx_pip[0:12]    ;
    logic [`D_width-1:0] R16_BN10_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_BN11_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_BN12_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_BN13_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_BN14_idx_pip[0:12]   ;
    logic [`D_width-1:0] R16_BN15_idx_pip[0:12]   ;

    logic [1:0] ntt_enable_pip [0:12];

    assign R16_MA0_idx_pip[0]   = R16_MA0_idx;
    assign R16_MA1_idx_pip[0]   = R16_MA1_idx;
    assign R16_MA2_idx_pip[0]   = R16_MA2_idx;
    assign R16_MA3_idx_pip[0]   = R16_MA3_idx;
    assign R16_MA4_idx_pip[0]   = R16_MA4_idx;
    assign R16_MA5_idx_pip[0]   = R16_MA5_idx;
    assign R16_MA6_idx_pip[0]   = R16_MA6_idx;
    assign R16_MA7_idx_pip[0]   = R16_MA7_idx;
    assign R16_MA8_idx_pip[0]   = R16_MA8_idx;
    assign R16_MA9_idx_pip[0]   = R16_MA9_idx;
    assign R16_MA10_idx_pip[0]  = R16_MA10_idx;
    assign R16_MA11_idx_pip[0]  = R16_MA11_idx;
    assign R16_MA12_idx_pip[0]  = R16_MA12_idx;
    assign R16_MA13_idx_pip[0]  = R16_MA13_idx;
    assign R16_MA14_idx_pip[0]  = R16_MA14_idx;
    assign R16_MA15_idx_pip[0]  = R16_MA15_idx;

    assign R16_BN0_idx_pip[0]   = R16_BN0_idx;
    assign R16_BN1_idx_pip[0]   = R16_BN1_idx;
    assign R16_BN2_idx_pip[0]   = R16_BN2_idx;
    assign R16_BN3_idx_pip[0]   = R16_BN3_idx;
    assign R16_BN4_idx_pip[0]   = R16_BN4_idx;
    assign R16_BN5_idx_pip[0]   = R16_BN5_idx;
    assign R16_BN6_idx_pip[0]   = R16_BN6_idx;
    assign R16_BN7_idx_pip[0]   = R16_BN7_idx;
    assign R16_BN8_idx_pip[0]   = R16_BN8_idx;
    assign R16_BN9_idx_pip[0]   = R16_BN9_idx;
    assign R16_BN10_idx_pip[0]  = R16_BN10_idx;
    assign R16_BN11_idx_pip[0]  = R16_BN11_idx;
    assign R16_BN12_idx_pip[0]  = R16_BN12_idx;
    assign R16_BN13_idx_pip[0]  = R16_BN13_idx;
    assign R16_BN14_idx_pip[0]  = R16_BN14_idx;
    assign R16_BN15_idx_pip[0]  = R16_BN15_idx;
    
    assign ntt_enable_pip[0] = ntt_enable;

    integer i;
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            R16_MA0_idx_pip[i+1]    <= 'd0;
            R16_MA1_idx_pip[i+1]    <= 'd0;
            R16_MA2_idx_pip[i+1]    <= 'd0;
            R16_MA3_idx_pip[i+1]    <= 'd0;
            R16_MA4_idx_pip[i+1]    <= 'd0;
            R16_MA5_idx_pip[i+1]    <= 'd0;
            R16_MA6_idx_pip[i+1]    <= 'd0;
            R16_MA7_idx_pip[i+1]    <= 'd0;
            R16_MA8_idx_pip[i+1]    <= 'd0;
            R16_MA9_idx_pip[i+1]    <= 'd0;
            R16_MA10_idx_pip[i+1]   <= 'd0;
            R16_MA11_idx_pip[i+1]   <= 'd0;
            R16_MA12_idx_pip[i+1]   <= 'd0;
            R16_MA13_idx_pip[i+1]   <= 'd0;
            R16_MA14_idx_pip[i+1]   <= 'd0;
            R16_MA15_idx_pip[i+1]   <= 'd0;

            R16_BN0_idx_pip[i+1]    <= 'd0;
            R16_BN1_idx_pip[i+1]    <= 'd0;
            R16_BN2_idx_pip[i+1]    <= 'd0;
            R16_BN3_idx_pip[i+1]    <= 'd0;
            R16_BN4_idx_pip[i+1]    <= 'd0;
            R16_BN5_idx_pip[i+1]    <= 'd0;
            R16_BN6_idx_pip[i+1]    <= 'd0;
            R16_BN7_idx_pip[i+1]    <= 'd0;
            R16_BN8_idx_pip[i+1]    <= 'd0;
            R16_BN9_idx_pip[i+1]    <= 'd0;
            R16_BN10_idx_pip[i+1]   <= 'd0;
            R16_BN11_idx_pip[i+1]   <= 'd0;
            R16_BN12_idx_pip[i+1]   <= 'd0;
            R16_BN13_idx_pip[i+1]   <= 'd0;
            R16_BN14_idx_pip[i+1]   <= 'd0;
            R16_BN15_idx_pip[i+1]   <= 'd0;

            ntt_enable_pip[i+1]     <= 'd0;
        end else begin
            for (i = 0; i<12; i++) begin
                R16_MA0_idx_pip[i+1]    <= R16_MA0_idx_pip[i];
                R16_MA1_idx_pip[i+1]    <= R16_MA1_idx_pip[i];
                R16_MA2_idx_pip[i+1]    <= R16_MA2_idx_pip[i];
                R16_MA3_idx_pip[i+1]    <= R16_MA3_idx_pip[i];
                R16_MA4_idx_pip[i+1]    <= R16_MA4_idx_pip[i];
                R16_MA5_idx_pip[i+1]    <= R16_MA5_idx_pip[i];
                R16_MA6_idx_pip[i+1]    <= R16_MA6_idx_pip[i];
                R16_MA7_idx_pip[i+1]    <= R16_MA7_idx_pip[i];
                R16_MA8_idx_pip[i+1]    <= R16_MA8_idx_pip[i];
                R16_MA9_idx_pip[i+1]    <= R16_MA9_idx_pip[i];
                R16_MA10_idx_pip[i+1]   <= R16_MA10_idx_pip[i];
                R16_MA11_idx_pip[i+1]   <= R16_MA11_idx_pip[i];
                R16_MA12_idx_pip[i+1]   <= R16_MA12_idx_pip[i];
                R16_MA13_idx_pip[i+1]   <= R16_MA13_idx_pip[i];
                R16_MA14_idx_pip[i+1]   <= R16_MA14_idx_pip[i];
                R16_MA15_idx_pip[i+1]   <= R16_MA15_idx_pip[i];

                R16_BN0_idx_pip[i+1]    <= R16_BN0_idx_pip[i];
                R16_BN1_idx_pip[i+1]    <= R16_BN1_idx_pip[i];
                R16_BN2_idx_pip[i+1]    <= R16_BN2_idx_pip[i];
                R16_BN3_idx_pip[i+1]    <= R16_BN3_idx_pip[i];
                R16_BN4_idx_pip[i+1]    <= R16_BN4_idx_pip[i];
                R16_BN5_idx_pip[i+1]    <= R16_BN5_idx_pip[i];
                R16_BN6_idx_pip[i+1]    <= R16_BN6_idx_pip[i];
                R16_BN7_idx_pip[i+1]    <= R16_BN7_idx_pip[i];
                R16_BN8_idx_pip[i+1]    <= R16_BN8_idx_pip[i];
                R16_BN9_idx_pip[i+1]    <= R16_BN9_idx_pip[i];
                R16_BN10_idx_pip[i+1]   <= R16_BN10_idx_pip[i];
                R16_BN11_idx_pip[i+1]   <= R16_BN11_idx_pip[i];
                R16_BN12_idx_pip[i+1]   <= R16_BN12_idx_pip[i];
                R16_BN13_idx_pip[i+1]   <= R16_BN13_idx_pip[i];
                R16_BN14_idx_pip[i+1]   <= R16_BN14_idx_pip[i];
                R16_BN15_idx_pip[i+1]   <= R16_BN15_idx_pip[i];

                ntt_enable_pip[i+1]     <= ntt_enable_pip[i];
            end
        end
    end

    assign R16_MA0_idx_pip_out  = R16_MA0_idx_pip   [12];
    assign R16_MA1_idx_pip_out  = R16_MA1_idx_pip   [12];
    assign R16_MA2_idx_pip_out  = R16_MA2_idx_pip   [12];
    assign R16_MA3_idx_pip_out  = R16_MA3_idx_pip   [12];
    assign R16_MA4_idx_pip_out  = R16_MA4_idx_pip   [12];
    assign R16_MA5_idx_pip_out  = R16_MA5_idx_pip   [12];
    assign R16_MA6_idx_pip_out  = R16_MA6_idx_pip   [12];
    assign R16_MA7_idx_pip_out  = R16_MA7_idx_pip   [12];
    assign R16_MA8_idx_pip_out  = R16_MA8_idx_pip   [12];
    assign R16_MA9_idx_pip_out  = R16_MA9_idx_pip   [12];
    assign R16_MA10_idx_pip_out = R16_MA10_idx_pip  [12];
    assign R16_MA11_idx_pip_out = R16_MA11_idx_pip  [12];
    assign R16_MA12_idx_pip_out = R16_MA12_idx_pip  [12];
    assign R16_MA13_idx_pip_out = R16_MA13_idx_pip  [12];
    assign R16_MA14_idx_pip_out = R16_MA14_idx_pip  [12];
    assign R16_MA15_idx_pip_out = R16_MA15_idx_pip  [12];

    assign R16_BN0_idx_pip_out  = R16_BN0_idx_pip   [12];
    assign R16_BN1_idx_pip_out  = R16_BN1_idx_pip   [12];
    assign R16_BN2_idx_pip_out  = R16_BN2_idx_pip   [12];
    assign R16_BN3_idx_pip_out  = R16_BN3_idx_pip   [12];
    assign R16_BN4_idx_pip_out  = R16_BN4_idx_pip   [12];
    assign R16_BN5_idx_pip_out  = R16_BN5_idx_pip   [12];
    assign R16_BN6_idx_pip_out  = R16_BN6_idx_pip   [12];
    assign R16_BN7_idx_pip_out  = R16_BN7_idx_pip   [12];
    assign R16_BN8_idx_pip_out  = R16_BN8_idx_pip   [12];
    assign R16_BN9_idx_pip_out  = R16_BN9_idx_pip   [12];
    assign R16_BN10_idx_pip_out = R16_BN10_idx_pip  [12];
    assign R16_BN11_idx_pip_out = R16_BN11_idx_pip  [12];
    assign R16_BN12_idx_pip_out = R16_BN12_idx_pip  [12];
    assign R16_BN13_idx_pip_out = R16_BN13_idx_pip  [12];
    assign R16_BN14_idx_pip_out = R16_BN14_idx_pip  [12];
    assign R16_BN15_idx_pip_out = R16_BN15_idx_pip  [12];

    assign ntt_done_pip_out      = ntt_enable_pip    [12];
endmodule