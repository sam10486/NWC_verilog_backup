`include "../include/define.svh"
`include "../mem/SRAM_DP_512_rtl.v"

module memory_wrapper (
    input LAST_STAGE,
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
    parameter BN = `BN;
    parameter radix_16 = (1 << `radix_k1);
    parameter radix_2 = (1 << `radix_k2);

    logic   [63:0]  QA [0:BN-1];            //data output
    logic   [63:0]  QB [0:BN-1];            //data output
    logic           CLKA;                   //clk
    logic           CENA [0:BN-1];          //chip select
    logic           WENA [0:BN-1];          //write enable
    logic   [8:0]   AA [0:BN-1];            //input addr
    logic   [63:0]  DA [0:BN-1];            //data in a
    logic           CLKB;                   //clk
    logic           CENB [0:BN-1];          //chip select
    logic           WENB [0:BN-1];          //write enable
    logic   [8:0]   AB [0:BN-1];            //input addr
    logic   [63:0]  DB [0:BN-1];            //data in b
    logic   [2:0]   EMAA;   
    logic   [2:0]   EMAB;

    assign CLKA = clk;
    assign CLKB = clk;
    assign EMAA = 'd0;
    assign EMAB = 'd0;

    logic [64-`D_width-1:0] zero;
    assign zero = 'd0;



    // A port for read, B port for write
    generate
        genvar i;
        for(i = 0; i < 16; i = i + 1) begin : gen_sram
            SRAM_DP_512 sram(
                .QA(QA[i]),
                .QB(QB[i]),
                .CLKA(CLKA),
                .CENA(CENA[i]),
                .WENA(WENA[i]),
                .AA(AA[i]),
                .DA({zero, DA[i]}),
                .CLKB(CLKB),
                .CENB(CENB[i]),
                .WENB(WENB[i]),
                .AB(AB[i]),
                .DB({zero, DB[i]}),
                .EMAA(EMAA),
                .EMAB(EMAB)
            );
        end
    endgenerate
    


endmodule