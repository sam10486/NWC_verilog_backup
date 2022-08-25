`include "../include/define.svh"
`include "AGU_k2.sv"
`include "Order_translate_k2.sv"

module AGU_top_k2 (
    input clk,
    input rst,
    input AGU_enable_k2,

    output logic [`MA_width-1:0] MA0_idx_k2,
    output logic [`MA_width-1:0] MA1_idx_k2,

    output logic [`BANK_width-1:0] BN0_idx_k2,
    output logic [`BANK_width-1:0] BN1_idx_k2,

    output logic AGU_done_out_k2,
    output logic BN_MA_out_en_k2,
    output logic [2:0] l_AGU_out_k2
);

    logic [`D_width-1:0] AGU_Order_0_k2;
    logic [`D_width-1:0] AGU_Order_1_k2;
    logic AGU_out_en_k2;
    logic AGU_done_k2;
    logic [2:0] AGU_l_out_k2;


    logic [`D_width-1:0] AGU_Order_0_k2_pip0;
    logic [`D_width-1:0] AGU_Order_1_k2_pip0;
    logic AGU_out_en_k2_pip0;
    logic AGU_done_k2_pip0;
    logic [2:0] AGU_l_out_k2_pip0;

   

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            AGU_Order_0_k2_pip0     <= 'd0;
            AGU_Order_1_k2_pip0     <= 'd0;

            AGU_out_en_k2_pip0      <= 'd0;
            AGU_done_k2_pip0        <= 'd0;

            AGU_l_out_k2_pip0       <= 'd0;
        end else begin
            AGU_Order_0_k2_pip0     <= AGU_Order_0_k2;
            AGU_Order_1_k2_pip0     <= AGU_Order_1_k2;

            AGU_out_en_k2_pip0      <= AGU_out_en_k2;
            AGU_done_k2_pip0        <= AGU_done_k2;

            AGU_l_out_k2_pip0       <= AGU_l_out_k2;
        end
    end

    AGU_k2 AGU_k2(
        //input 
        .clk(clk),
        .rst(rst),
        .AGU_enable_k2(AGU_enable_k2),
        //output
        .Order_0_k2     (AGU_Order_0_k2),
        .Order_1_k2     (AGU_Order_1_k2),
        .AGU_out_en_k2  (AGU_out_en_k2),
        .AGU_done_k2    (AGU_done_k2),
        .l_k2           (AGU_l_out_k2)
    );

    Order_translate_k2 Order_translate_k2(
        //input
        .clk(clk),
        .rst(rst),
        .Order_0(AGU_Order_0_k2_pip0),
        .Order_1(AGU_Order_1_k2_pip0),
        .r_enable_k2(AGU_out_en_k2_pip0),
        .AGU_done_k2(AGU_done_k2_pip0),
        .l(AGU_l_out_k2_pip0),

        //output
        .MA0_idx_k2(MA0_idx_k2),
        .MA1_idx_k2(MA1_idx_k2),
        .BN0_idx_k2(BN0_idx_k2),
        .BN1_idx_k2(BN1_idx_k2),
        .AGU_done_out_k2(AGU_done_out_k2),
        .BN_MA_out_en_k2(BN_MA_out_en_k2),
        .l_AGU_out_k2(l_AGU_out_k2)

    );


endmodule