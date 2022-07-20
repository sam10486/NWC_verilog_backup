`include "../include/define.svh"
`include "ModAdd.sv"

module Order_translate(
    input clk,
    input rst,
    input [`D_width-1:0] Order_0, 
    input [`D_width-1:0] Order_1, 
    input [`D_width-1:0] Order_2, 
    input [`D_width-1:0] Order_3, 
    input [`D_width-1:0] Order_4, 
    input [`D_width-1:0] Order_5, 
    input [`D_width-1:0] Order_6, 
    input [`D_width-1:0] Order_7, 
    input [`D_width-1:0] Order_8, 
    input [`D_width-1:0] Order_9, 
    input [`D_width-1:0] Order_10, 
    input [`D_width-1:0] Order_11, 
    input [`D_width-1:0] Order_12, 
    input [`D_width-1:0] Order_13, 
    input [`D_width-1:0] Order_14, 
    input [`D_width-1:0] Order_15, 
    input r_enable,
    input AGU_done,

    output logic [`D_width-1:0] MA0_idx,
    output logic [`D_width-1:0] BN0_idx,
    
    output logic [`D_width-1:0] MA1_idx,
    output logic [`D_width-1:0] BN1_idx,

    output logic [`D_width-1:0] MA2_idx,
    output logic [`D_width-1:0] BN2_idx,

    output logic [`D_width-1:0] MA3_idx,
    output logic [`D_width-1:0] BN3_idx,

    output logic [`D_width-1:0] MA4_idx,
    output logic [`D_width-1:0] BN4_idx,

    output logic [`D_width-1:0] MA5_idx,
    output logic [`D_width-1:0] BN5_idx,

    output logic [`D_width-1:0] MA6_idx,
    output logic [`D_width-1:0] BN6_idx,

    output logic [`D_width-1:0] MA7_idx,
    output logic [`D_width-1:0] BN7_idx,

    output logic [`D_width-1:0] MA8_idx,
    output logic [`D_width-1:0] BN8_idx,

    output logic [`D_width-1:0] MA9_idx,
    output logic [`D_width-1:0] BN9_idx,

    output logic [`D_width-1:0] MA10_idx,
    output logic [`D_width-1:0] BN10_idx,

    output logic [`D_width-1:0] MA11_idx,
    output logic [`D_width-1:0] BN11_idx,

    output logic [`D_width-1:0] MA12_idx,
    output logic [`D_width-1:0] BN12_idx,

    output logic [`D_width-1:0] MA13_idx,
    output logic [`D_width-1:0] BN13_idx,

    output logic [`D_width-1:0] MA14_idx,
    output logic [`D_width-1:0] BN14_idx,
    
    output logic [`D_width-1:0] MA15_idx,
    output logic [`D_width-1:0] BN15_idx,

    output logic AGU_done_out,
    output logic BN_MA_out_en
);

    logic [`D_width-1:0] Order0_tmp0_pip0, Order0_tmp1_pip0, Order0_tmp2_pip0, Order0_tmp3_pip0;
    logic [`D_width-1:0] Order0_tmp2_pip1, Order0_tmp3_pip1;
    logic [`D_width-1:0] Order0_tmp3_pip2;
    logic [`D_width-1:0] Order0_tmp_out_pip0, Order0_tmp_out_pip1;
    logic [`D_width-1:0] Order0_pip0, Order0_pip1, Order0_pip2, Order0_pip3;

    logic [`D_width-1:0] Order1_tmp0_pip0, Order1_tmp1_pip0, Order1_tmp2_pip0, Order1_tmp3_pip0;
    logic [`D_width-1:0] Order1_tmp2_pip1, Order1_tmp3_pip1;
    logic [`D_width-1:0] Order1_tmp3_pip2;
    logic [`D_width-1:0] Order1_tmp_out_pip0, Order1_tmp_out_pip1;
    logic [`D_width-1:0] Order1_pip0, Order1_pip1, Order1_pip2, Order1_pip3;

    logic [`D_width-1:0] Order2_tmp0_pip0, Order2_tmp1_pip0, Order2_tmp2_pip0, Order2_tmp3_pip0;
    logic [`D_width-1:0] Order2_tmp2_pip1, Order2_tmp3_pip1;
    logic [`D_width-1:0] Order2_tmp3_pip2;
    logic [`D_width-1:0] Order2_tmp_out_pip0, Order2_tmp_out_pip1;
    logic [`D_width-1:0] Order2_pip0, Order2_pip1, Order2_pip2, Order2_pip3;

    logic [`D_width-1:0] Order3_tmp0_pip0, Order3_tmp1_pip0, Order3_tmp2_pip0, Order3_tmp3_pip0;
    logic [`D_width-1:0] Order3_tmp2_pip1, Order3_tmp3_pip1;
    logic [`D_width-1:0] Order3_tmp3_pip2;
    logic [`D_width-1:0] Order3_tmp_out_pip0, Order3_tmp_out_pip1;
    logic [`D_width-1:0] Order3_pip0, Order3_pip1, Order3_pip2, Order3_pip3;

    logic [`D_width-1:0] Order4_tmp0_pip0, Order4_tmp1_pip0, Order4_tmp2_pip0, Order4_tmp3_pip0;
    logic [`D_width-1:0] Order4_tmp2_pip1, Order4_tmp3_pip1;
    logic [`D_width-1:0] Order4_tmp3_pip2;
    logic [`D_width-1:0] Order4_tmp_out_pip0, Order4_tmp_out_pip1;
    logic [`D_width-1:0] Order4_pip0, Order4_pip1, Order4_pip2, Order4_pip3;

    logic [`D_width-1:0] Order5_tmp0_pip0, Order5_tmp1_pip0, Order5_tmp2_pip0, Order5_tmp3_pip0;
    logic [`D_width-1:0] Order5_tmp2_pip1, Order5_tmp3_pip1;
    logic [`D_width-1:0] Order5_tmp3_pip2;
    logic [`D_width-1:0] Order5_tmp_out_pip0, Order5_tmp_out_pip1;
    logic [`D_width-1:0] Order5_pip0, Order5_pip1, Order5_pip2, Order5_pip3;

    logic [`D_width-1:0] Order6_tmp0_pip0, Order6_tmp1_pip0, Order6_tmp2_pip0, Order6_tmp3_pip0;
    logic [`D_width-1:0] Order6_tmp2_pip1, Order6_tmp3_pip1;
    logic [`D_width-1:0] Order6_tmp3_pip2;
    logic [`D_width-1:0] Order6_tmp_out_pip0, Order6_tmp_out_pip1;
    logic [`D_width-1:0] Order6_pip0, Order6_pip1, Order6_pip2, Order6_pip3;

    logic [`D_width-1:0] Order7_tmp0_pip0, Order7_tmp1_pip0, Order7_tmp2_pip0, Order7_tmp3_pip0;
    logic [`D_width-1:0] Order7_tmp2_pip1, Order7_tmp3_pip1;
    logic [`D_width-1:0] Order7_tmp3_pip2;
    logic [`D_width-1:0] Order7_tmp_out_pip0, Order7_tmp_out_pip1;
    logic [`D_width-1:0] Order7_pip0, Order7_pip1, Order7_pip2, Order7_pip3;

    logic [`D_width-1:0] Order8_tmp0_pip0, Order8_tmp1_pip0, Order8_tmp2_pip0, Order8_tmp3_pip0;
    logic [`D_width-1:0] Order8_tmp2_pip1, Order8_tmp3_pip1;
    logic [`D_width-1:0] Order8_tmp3_pip2;
    logic [`D_width-1:0] Order8_tmp_out_pip0, Order8_tmp_out_pip1;
    logic [`D_width-1:0] Order8_pip0, Order8_pip1, Order8_pip2, Order8_pip3;

    logic [`D_width-1:0] Order9_tmp0_pip0, Order9_tmp1_pip0, Order9_tmp2_pip0, Order9_tmp3_pip0;
    logic [`D_width-1:0] Order9_tmp2_pip1, Order9_tmp3_pip1;
    logic [`D_width-1:0] Order9_tmp3_pip2;
    logic [`D_width-1:0] Order9_tmp_out_pip0, Order9_tmp_out_pip1;
    logic [`D_width-1:0] Order9_pip0, Order9_pip1, Order9_pip2, Order9_pip3;

    logic [`D_width-1:0] Order10_tmp0_pip0, Order10_tmp1_pip0, Order10_tmp2_pip0, Order10_tmp3_pip0;
    logic [`D_width-1:0] Order10_tmp2_pip1, Order10_tmp3_pip1;
    logic [`D_width-1:0] Order10_tmp3_pip2;
    logic [`D_width-1:0] Order10_tmp_out_pip0, Order10_tmp_out_pip1;
    logic [`D_width-1:0] Order10_pip0, Order10_pip1, Order10_pip2, Order10_pip3;

    logic [`D_width-1:0] Order11_tmp0_pip0, Order11_tmp1_pip0, Order11_tmp2_pip0, Order11_tmp3_pip0;
    logic [`D_width-1:0] Order11_tmp2_pip1, Order11_tmp3_pip1;
    logic [`D_width-1:0] Order11_tmp3_pip2;
    logic [`D_width-1:0] Order11_tmp_out_pip0, Order11_tmp_out_pip1;
    logic [`D_width-1:0] Order11_pip0, Order11_pip1, Order11_pip2, Order11_pip3;

    logic [`D_width-1:0] Order12_tmp0_pip0, Order12_tmp1_pip0, Order12_tmp2_pip0, Order12_tmp3_pip0;
    logic [`D_width-1:0] Order12_tmp2_pip1, Order12_tmp3_pip1;
    logic [`D_width-1:0] Order12_tmp3_pip2;
    logic [`D_width-1:0] Order12_tmp_out_pip0, Order12_tmp_out_pip1;
    logic [`D_width-1:0] Order12_pip0, Order12_pip1, Order12_pip2, Order12_pip3;

    logic [`D_width-1:0] Order13_tmp0_pip0, Order13_tmp1_pip0, Order13_tmp2_pip0, Order13_tmp3_pip0;
    logic [`D_width-1:0] Order13_tmp2_pip1, Order13_tmp3_pip1;
    logic [`D_width-1:0] Order13_tmp3_pip2;
    logic [`D_width-1:0] Order13_tmp_out_pip0, Order13_tmp_out_pip1;
    logic [`D_width-1:0] Order13_pip0, Order13_pip1, Order13_pip2, Order13_pip3;

    logic [`D_width-1:0] Order14_tmp0_pip0, Order14_tmp1_pip0, Order14_tmp2_pip0, Order14_tmp3_pip0;
    logic [`D_width-1:0] Order14_tmp2_pip1, Order14_tmp3_pip1;
    logic [`D_width-1:0] Order14_tmp3_pip2;
    logic [`D_width-1:0] Order14_tmp_out_pip0, Order14_tmp_out_pip1;
    logic [`D_width-1:0] Order14_pip0, Order14_pip1, Order14_pip2, Order14_pip3;

    logic [`D_width-1:0] Order15_tmp0_pip0, Order15_tmp1_pip0, Order15_tmp2_pip0, Order15_tmp3_pip0;
    logic [`D_width-1:0] Order15_tmp2_pip1, Order15_tmp3_pip1;
    logic [`D_width-1:0] Order15_tmp3_pip2;
    logic [`D_width-1:0] Order15_tmp_out_pip0, Order15_tmp_out_pip1;
    logic [`D_width-1:0] Order15_pip0, Order15_pip1, Order15_pip2, Order15_pip3;

    logic r_enable_pip0, r_enable_pip1, r_enable_pip2;
    logic AGU_done_pip0, AGU_done_pip1, AGU_done_pip2;

    logic [`D_width-1:0] Order0_tmp_out_stage0, Order0_tmp_out_stage1, Order0_tmp_out_stage2;
    logic [`D_width-1:0] Order1_tmp_out_stage0, Order1_tmp_out_stage1, Order1_tmp_out_stage2;
    logic [`D_width-1:0] Order2_tmp_out_stage0, Order2_tmp_out_stage1, Order2_tmp_out_stage2;
    logic [`D_width-1:0] Order3_tmp_out_stage0, Order3_tmp_out_stage1, Order3_tmp_out_stage2;
    logic [`D_width-1:0] Order4_tmp_out_stage0, Order4_tmp_out_stage1, Order4_tmp_out_stage2;
    logic [`D_width-1:0] Order5_tmp_out_stage0, Order5_tmp_out_stage1, Order5_tmp_out_stage2;
    logic [`D_width-1:0] Order6_tmp_out_stage0, Order6_tmp_out_stage1, Order6_tmp_out_stage2;
    logic [`D_width-1:0] Order7_tmp_out_stage0, Order7_tmp_out_stage1, Order7_tmp_out_stage2;
    logic [`D_width-1:0] Order8_tmp_out_stage0, Order8_tmp_out_stage1, Order8_tmp_out_stage2;
    logic [`D_width-1:0] Order9_tmp_out_stage0, Order9_tmp_out_stage1, Order9_tmp_out_stage2;
    logic [`D_width-1:0] Order10_tmp_out_stage0, Order10_tmp_out_stage1, Order10_tmp_out_stage2;
    logic [`D_width-1:0] Order11_tmp_out_stage0, Order11_tmp_out_stage1, Order11_tmp_out_stage2;
    logic [`D_width-1:0] Order12_tmp_out_stage0, Order12_tmp_out_stage1, Order12_tmp_out_stage2;
    logic [`D_width-1:0] Order13_tmp_out_stage0, Order13_tmp_out_stage1, Order13_tmp_out_stage2;
    logic [`D_width-1:0] Order14_tmp_out_stage0, Order14_tmp_out_stage1, Order14_tmp_out_stage2;
    logic [`D_width-1:0] Order15_tmp_out_stage0, Order15_tmp_out_stage1, Order15_tmp_out_stage2;

    parameter difference_width = `D_width - `degree_width;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order0_tmp0_pip0 <= 'd0;
            Order0_tmp1_pip0 <= 'd0;
            Order0_tmp2_pip0 <= 'd0;
            Order0_tmp3_pip0 <= 'd0;
            Order0_pip0 <= 'd0;

            Order1_tmp0_pip0 <= 'd0;
            Order1_tmp1_pip0 <= 'd0;
            Order1_tmp2_pip0 <= 'd0;
            Order1_tmp3_pip0 <= 'd0;
            Order1_pip0 <= 'd0;

            Order2_tmp0_pip0 <= 'd0;
            Order2_tmp1_pip0 <= 'd0;
            Order2_tmp2_pip0 <= 'd0;
            Order2_tmp3_pip0 <= 'd0;
            Order2_pip0 <= 'd0;

            Order3_tmp0_pip0 <= 'd0;
            Order3_tmp1_pip0 <= 'd0;
            Order3_tmp2_pip0 <= 'd0;
            Order3_tmp3_pip0 <= 'd0;
            Order3_pip0 <= 'd0;

            Order4_tmp0_pip0 <= 'd0;
            Order4_tmp1_pip0 <= 'd0;
            Order4_tmp2_pip0 <= 'd0;
            Order4_tmp3_pip0 <= 'd0;
            Order4_pip0 <= 'd0;

            Order5_tmp0_pip0 <= 'd0;
            Order5_tmp1_pip0 <= 'd0;
            Order5_tmp2_pip0 <= 'd0;
            Order5_tmp3_pip0 <= 'd0;
            Order5_pip0 <= 'd0;

            Order6_tmp0_pip0 <= 'd0;
            Order6_tmp1_pip0 <= 'd0;
            Order6_tmp2_pip0 <= 'd0;
            Order6_tmp3_pip0 <= 'd0;
            Order6_pip0 <= 'd0;

            Order7_tmp0_pip0 <= 'd0;
            Order7_tmp1_pip0 <= 'd0;
            Order7_tmp2_pip0 <= 'd0;
            Order7_tmp3_pip0 <= 'd0;
            Order7_pip0 <= 'd0;

            Order8_tmp0_pip0 <= 'd0;
            Order8_tmp1_pip0 <= 'd0;
            Order8_tmp2_pip0 <= 'd0;
            Order8_tmp3_pip0 <= 'd0;
            Order8_pip0 <= 'd0;

            Order9_tmp0_pip0 <= 'd0;
            Order9_tmp1_pip0 <= 'd0;
            Order9_tmp2_pip0 <= 'd0;
            Order9_tmp3_pip0 <= 'd0;
            Order9_pip0 <= 'd0;

            Order10_tmp0_pip0 <= 'd0;
            Order10_tmp1_pip0 <= 'd0;
            Order10_tmp2_pip0 <= 'd0;
            Order10_tmp3_pip0 <= 'd0;
            Order10_pip0 <= 'd0;

            Order11_tmp0_pip0 <= 'd0;
            Order11_tmp1_pip0 <= 'd0;
            Order11_tmp2_pip0 <= 'd0;
            Order11_tmp3_pip0 <= 'd0;
            Order11_pip0 <= 'd0;

            Order12_tmp0_pip0 <= 'd0;
            Order12_tmp1_pip0 <= 'd0;
            Order12_tmp2_pip0 <= 'd0;
            Order12_tmp3_pip0 <= 'd0;
            Order12_pip0 <= 'd0;

            Order13_tmp0_pip0 <= 'd0;
            Order13_tmp1_pip0 <= 'd0;
            Order13_tmp2_pip0 <= 'd0;
            Order13_tmp3_pip0 <= 'd0;
            Order13_pip0 <= 'd0;

            Order14_tmp0_pip0 <= 'd0;
            Order14_tmp1_pip0 <= 'd0;
            Order14_tmp2_pip0 <= 'd0;
            Order14_tmp3_pip0 <= 'd0;
            Order14_pip0 <= 'd0;

            Order15_tmp0_pip0 <= 'd0;
            Order15_tmp1_pip0 <= 'd0;
            Order15_tmp2_pip0 <= 'd0;
            Order15_tmp3_pip0 <= 'd0;
            Order15_pip0 <= 'd0;

            r_enable_pip0 <= 'd0;
            AGU_done_pip0 <= 'd0;
        end else begin
            Order0_tmp0_pip0 <= Order_0[3:0];
            Order0_tmp1_pip0 <= Order_0[7:4];
            Order0_tmp2_pip0 <= Order_0[11:8];
            Order0_tmp3_pip0 <= Order_0[`degree_width-1:12];
            Order0_pip0 <= Order_0;

            Order1_tmp0_pip0 <= Order_1[3:0];
            Order1_tmp1_pip0 <= Order_1[7:4];
            Order1_tmp2_pip0 <= Order_1[11:8];
            Order1_tmp3_pip0 <= Order_1[`degree_width-1:12];
            Order1_pip0 <= Order_1;

            Order2_tmp0_pip0 <= Order_2[3:0];
            Order2_tmp1_pip0 <= Order_2[7:4];
            Order2_tmp2_pip0 <= Order_2[11:8];
            Order2_tmp3_pip0 <= Order_2[`degree_width-1:12];
            Order2_pip0 <= Order_2;

            Order3_tmp0_pip0 <= Order_3[3:0];
            Order3_tmp1_pip0 <= Order_3[7:4];
            Order3_tmp2_pip0 <= Order_3[11:8];
            Order3_tmp3_pip0 <= Order_3[`degree_width-1:12];
            Order3_pip0 <= Order_3;

            Order4_tmp0_pip0 <= Order_4[3:0];
            Order4_tmp1_pip0 <= Order_4[7:4];
            Order4_tmp2_pip0 <= Order_4[11:8];
            Order4_tmp3_pip0 <= Order_4[`degree_width-1:12];
            Order4_pip0 <= Order_4;

            Order5_tmp0_pip0 <= Order_5[3:0];
            Order5_tmp1_pip0 <= Order_5[7:4];
            Order5_tmp2_pip0 <= Order_5[11:8];
            Order5_tmp3_pip0 <= Order_5[`degree_width-1:12];
            Order5_pip0 <= Order_5;

            Order6_tmp0_pip0 <= Order_6[3:0];
            Order6_tmp1_pip0 <= Order_6[7:4];
            Order6_tmp2_pip0 <= Order_6[11:8];
            Order6_tmp3_pip0 <= Order_6[`degree_width-1:12];
            Order6_pip0 <= Order_6;

            Order7_tmp0_pip0 <= Order_7[3:0];
            Order7_tmp1_pip0 <= Order_7[7:4];
            Order7_tmp2_pip0 <= Order_7[11:8];
            Order7_tmp3_pip0 <= Order_7[`degree_width-1:12];
            Order7_pip0 <= Order_7;

            Order8_tmp0_pip0 <= Order_8[3:0];
            Order8_tmp1_pip0 <= Order_8[7:4];
            Order8_tmp2_pip0 <= Order_8[11:8];
            Order8_tmp3_pip0 <= Order_8[`degree_width-1:12];
            Order8_pip0 <= Order_8;

            Order9_tmp0_pip0 <= Order_9[3:0];
            Order9_tmp1_pip0 <= Order_9[7:4];
            Order9_tmp2_pip0 <= Order_9[11:8];
            Order9_tmp3_pip0 <= Order_9[`degree_width-1:12];
            Order9_pip0 <= Order_9;

            Order10_tmp0_pip0 <= Order_10[3:0];
            Order10_tmp1_pip0 <= Order_10[7:4];
            Order10_tmp2_pip0 <= Order_10[11:8];
            Order10_tmp3_pip0 <= Order_10[`degree_width-1:12];
            Order10_pip0 <= Order_10;

            Order11_tmp0_pip0 <= Order_11[3:0];
            Order11_tmp1_pip0 <= Order_11[7:4];
            Order11_tmp2_pip0 <= Order_11[11:8];
            Order11_tmp3_pip0 <= Order_11[`degree_width-1:12];
            Order11_pip0 <= Order_11;

            Order12_tmp0_pip0 <= Order_12[3:0];
            Order12_tmp1_pip0 <= Order_12[7:4];
            Order12_tmp2_pip0 <= Order_12[11:8];
            Order12_tmp3_pip0 <= Order_12[`degree_width-1:12];
            Order12_pip0 <= Order_12;

            Order13_tmp0_pip0 <= Order_13[3:0];
            Order13_tmp1_pip0 <= Order_13[7:4];
            Order13_tmp2_pip0 <= Order_13[11:8];
            Order13_tmp3_pip0 <= Order_13[`degree_width-1:12];
            Order13_pip0 <= Order_13;

            Order14_tmp0_pip0 <= Order_14[3:0];
            Order14_tmp1_pip0 <= Order_14[7:4];
            Order14_tmp2_pip0 <= Order_14[11:8];
            Order14_tmp3_pip0 <= Order_14[`degree_width-1:12];
            Order14_pip0 <= Order_14;

            Order15_tmp0_pip0 <= Order_15[3:0];
            Order15_tmp1_pip0 <= Order_15[7:4];
            Order15_tmp2_pip0 <= Order_15[11:8];
            Order15_tmp3_pip0 <= Order_15[`degree_width-1:12];
            Order15_pip0 <= Order_15;

            r_enable_pip0 <= r_enable;
            AGU_done_pip0 <= AGU_done;
        end
    end
    ModAdd add0_0(
        .in_1({Order0_tmp0_pip0 }),
        .in_2({Order0_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_tmp_out_stage0)
    );

    ModAdd add0_1(
        .in_1({Order1_tmp0_pip0 }),
        .in_2({Order1_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_tmp_out_stage0)
    );

    ModAdd add0_2(
        .in_1({Order2_tmp0_pip0 }),
        .in_2({Order2_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order2_tmp_out_stage0)
    );

    ModAdd add0_3(
        .in_1({Order3_tmp0_pip0 }),
        .in_2({Order3_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order3_tmp_out_stage0)
    );

    ModAdd add0_4(
        .in_1({Order4_tmp0_pip0 }),
        .in_2({Order4_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order4_tmp_out_stage0)
    );

    ModAdd add0_5(
        .in_1({Order5_tmp0_pip0 }),
        .in_2({Order5_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order5_tmp_out_stage0)
    );

    ModAdd add0_6(
        .in_1({Order6_tmp0_pip0 }),
        .in_2({Order6_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order6_tmp_out_stage0)
    );

    ModAdd add0_7(
        .in_1({Order7_tmp0_pip0 }),
        .in_2({Order7_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order7_tmp_out_stage0)
    );

    ModAdd add0_8(
        .in_1({Order8_tmp0_pip0 }),
        .in_2({Order8_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order8_tmp_out_stage0)
    );

    ModAdd add0_9(
        .in_1({Order9_tmp0_pip0 }),
        .in_2({Order9_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order9_tmp_out_stage0)
    );

    ModAdd add0_10(
        .in_1({Order10_tmp0_pip0 }),
        .in_2({Order10_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order10_tmp_out_stage0)
    );

    ModAdd add0_11(
        .in_1({Order11_tmp0_pip0 }),
        .in_2({Order11_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order11_tmp_out_stage0)
    );

    ModAdd add0_12(
        .in_1({Order12_tmp0_pip0 }),
        .in_2({Order12_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order12_tmp_out_stage0)
    );

    ModAdd add0_13(
        .in_1({Order13_tmp0_pip0 }),
        .in_2({Order13_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order13_tmp_out_stage0)
    );

    ModAdd add0_14(
        .in_1({Order14_tmp0_pip0 }),
        .in_2({Order14_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order14_tmp_out_stage0)
    );

    ModAdd add0_15(
        .in_1({Order15_tmp0_pip0 }),
        .in_2({Order15_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order15_tmp_out_stage0)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order0_tmp2_pip1 <= 'd0;
            Order0_tmp3_pip1 <= 'd0;
            Order0_pip1 <= 'd0;
            Order0_tmp_out_pip0 <= 'd0;

            Order1_tmp2_pip1 <= 'd0;
            Order1_tmp3_pip1 <= 'd0;
            Order1_pip1 <= 'd0;
            Order1_tmp_out_pip0 <= 'd0;

            Order2_tmp2_pip1 <= 'd0;
            Order2_tmp3_pip1 <= 'd0;
            Order2_pip1 <= 'd0;
            Order2_tmp_out_pip0 <= 'd0;

            Order3_tmp2_pip1 <= 'd0;
            Order3_tmp3_pip1 <= 'd0;
            Order3_pip1 <= 'd0;
            Order3_tmp_out_pip0 <= 'd0;

            Order4_tmp2_pip1 <= 'd0;
            Order4_tmp3_pip1 <= 'd0;
            Order4_pip1 <= 'd0;
            Order4_tmp_out_pip0 <= 'd0;

            Order5_tmp2_pip1 <= 'd0;
            Order5_tmp3_pip1 <= 'd0;
            Order5_pip1 <= 'd0;
            Order5_tmp_out_pip0 <= 'd0;

            Order6_tmp2_pip1 <= 'd0;
            Order6_tmp3_pip1 <= 'd0;
            Order6_pip1 <= 'd0;
            Order6_tmp_out_pip0 <= 'd0;

            Order7_tmp2_pip1 <= 'd0;
            Order7_tmp3_pip1 <= 'd0;
            Order7_pip1 <= 'd0;
            Order7_tmp_out_pip0 <= 'd0;

            Order8_tmp2_pip1 <= 'd0;
            Order8_tmp3_pip1 <= 'd0;
            Order8_pip1 <= 'd0;
            Order8_tmp_out_pip0 <= 'd0;

            Order9_tmp2_pip1 <= 'd0;
            Order9_tmp3_pip1 <= 'd0;
            Order9_pip1 <= 'd0;
            Order9_tmp_out_pip0 <= 'd0;

            Order10_tmp2_pip1 <= 'd0;
            Order10_tmp3_pip1 <= 'd0;
            Order10_pip1 <= 'd0;
            Order10_tmp_out_pip0 <= 'd0;

            Order11_tmp2_pip1 <= 'd0;
            Order11_tmp3_pip1 <= 'd0;
            Order11_pip1 <= 'd0;
            Order11_tmp_out_pip0 <= 'd0;

            Order12_tmp2_pip1 <= 'd0;
            Order12_tmp3_pip1 <= 'd0;
            Order12_pip1 <= 'd0;
            Order12_tmp_out_pip0 <= 'd0;

            Order13_tmp2_pip1 <= 'd0;
            Order13_tmp3_pip1 <= 'd0;
            Order13_pip1 <= 'd0;
            Order13_tmp_out_pip0 <= 'd0;

            Order14_tmp2_pip1 <= 'd0;
            Order14_tmp3_pip1 <= 'd0;
            Order14_pip1 <= 'd0;
            Order14_tmp_out_pip0 <= 'd0;

            Order15_tmp2_pip1 <= 'd0;
            Order15_tmp3_pip1 <= 'd0;
            Order15_pip1 <= 'd0;
            Order15_tmp_out_pip0 <= 'd0;

            r_enable_pip1 <= 'd0;
            AGU_done_pip1 <= 'd0;
        end else begin
            Order0_tmp2_pip1 <= Order0_tmp2_pip0;
            Order0_tmp3_pip1 <= Order0_tmp3_pip0;
            Order0_pip1 <= Order0_pip0;
            Order0_tmp_out_pip0 <= Order0_tmp_out_stage0[15:0];

            Order1_tmp2_pip1 <= Order1_tmp2_pip0;
            Order1_tmp3_pip1 <= Order1_tmp3_pip0;
            Order1_pip1 <= Order1_pip0;
            Order1_tmp_out_pip0 <= Order1_tmp_out_stage0[15:0];

            Order2_tmp2_pip1 <= Order2_tmp2_pip0;
            Order2_tmp3_pip1 <= Order2_tmp3_pip0;
            Order2_pip1 <= Order2_pip0;
            Order2_tmp_out_pip0 <= Order2_tmp_out_stage0[15:0];

            Order3_tmp2_pip1 <= Order3_tmp2_pip0;
            Order3_tmp3_pip1 <= Order3_tmp3_pip0;
            Order3_pip1 <= Order3_pip0;
            Order3_tmp_out_pip0 <= Order3_tmp_out_stage0[15:0];

            Order4_tmp2_pip1 <= Order4_tmp2_pip0;
            Order4_tmp3_pip1 <= Order4_tmp3_pip0;
            Order4_pip1 <= Order4_pip0;
            Order4_tmp_out_pip0 <= Order4_tmp_out_stage0[15:0];

            Order5_tmp2_pip1 <= Order5_tmp2_pip0;
            Order5_tmp3_pip1 <= Order5_tmp3_pip0;
            Order5_pip1 <= Order5_pip0;
            Order5_tmp_out_pip0 <= Order5_tmp_out_stage0[15:0];

            Order6_tmp2_pip1 <= Order6_tmp2_pip0;
            Order6_tmp3_pip1 <= Order6_tmp3_pip0;
            Order6_pip1 <= Order6_pip0;
            Order6_tmp_out_pip0 <= Order6_tmp_out_stage0[15:0];

            Order7_tmp2_pip1 <= Order7_tmp2_pip0;
            Order7_tmp3_pip1 <= Order7_tmp3_pip0;
            Order7_pip1 <= Order7_pip0;
            Order7_tmp_out_pip0 <= Order7_tmp_out_stage0[15:0];

            Order8_tmp2_pip1 <= Order8_tmp2_pip0;
            Order8_tmp3_pip1 <= Order8_tmp3_pip0;
            Order8_pip1 <= Order8_pip0;
            Order8_tmp_out_pip0 <= Order8_tmp_out_stage0[15:0];

            Order9_tmp2_pip1 <= Order9_tmp2_pip0;
            Order9_tmp3_pip1 <= Order9_tmp3_pip0;
            Order9_pip1 <= Order9_pip0;
            Order9_tmp_out_pip0 <= Order9_tmp_out_stage0[15:0];

            Order10_tmp2_pip1 <= Order10_tmp2_pip0;
            Order10_tmp3_pip1 <= Order10_tmp3_pip0;
            Order10_pip1 <= Order10_pip0;
            Order10_tmp_out_pip0 <= Order10_tmp_out_stage0[15:0];

            Order11_tmp2_pip1 <= Order11_tmp2_pip0;
            Order11_tmp3_pip1 <= Order11_tmp3_pip0;
            Order11_pip1 <= Order11_pip0;
            Order11_tmp_out_pip0 <= Order11_tmp_out_stage0[15:0];

            Order12_tmp2_pip1 <= Order12_tmp2_pip0;
            Order12_tmp3_pip1 <= Order12_tmp3_pip0;
            Order12_pip1 <= Order12_pip0;
            Order12_tmp_out_pip0 <= Order12_tmp_out_stage0[15:0];

            Order13_tmp2_pip1 <= Order13_tmp2_pip0;
            Order13_tmp3_pip1 <= Order13_tmp3_pip0;
            Order13_pip1 <= Order13_pip0;
            Order13_tmp_out_pip0 <= Order13_tmp_out_stage0[15:0];

            Order14_tmp2_pip1 <= Order14_tmp2_pip0;
            Order14_tmp3_pip1 <= Order14_tmp3_pip0;
            Order14_pip1 <= Order14_pip0;
            Order14_tmp_out_pip0 <= Order14_tmp_out_stage0[15:0];

            Order15_tmp2_pip1 <= Order15_tmp2_pip0;
            Order15_tmp3_pip1 <= Order15_tmp3_pip0;
            Order15_pip1 <= Order15_pip0;
            Order15_tmp_out_pip0 <= Order15_tmp_out_stage0[15:0];

            r_enable_pip1 <= r_enable_pip0;
            AGU_done_pip1 <= AGU_done_pip0;
        end
    end

    ModAdd add1_0(
        .in_1({Order0_tmp_out_pip0}),
        .in_2({Order0_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_tmp_out_stage1)
    );

    ModAdd add1_1(
        .in_1({Order1_tmp_out_pip0}),
        .in_2({Order1_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_tmp_out_stage1)
    );

    ModAdd add1_2(
        .in_1({Order2_tmp_out_pip0}),
        .in_2({Order2_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order2_tmp_out_stage1)
    );

    ModAdd add1_3(
        .in_1({Order3_tmp_out_pip0}),
        .in_2({Order3_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order3_tmp_out_stage1)
    );

    ModAdd add1_4(
        .in_1({Order4_tmp_out_pip0}),
        .in_2({Order4_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order4_tmp_out_stage1)
    );

    ModAdd add1_5(
        .in_1({Order5_tmp_out_pip0}),
        .in_2({Order5_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order5_tmp_out_stage1)
    );

    ModAdd add1_6(
        .in_1({Order6_tmp_out_pip0}),
        .in_2({Order6_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order6_tmp_out_stage1)
    );

    ModAdd add1_7(
        .in_1({Order7_tmp_out_pip0}),
        .in_2({Order7_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order7_tmp_out_stage1)
    );

    ModAdd add1_8(
        .in_1({Order8_tmp_out_pip0}),
        .in_2({Order8_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order8_tmp_out_stage1)
    );

    ModAdd add1_9(
        .in_1({Order9_tmp_out_pip0}),
        .in_2({Order9_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order9_tmp_out_stage1)
    );

    ModAdd add1_10(
        .in_1({Order10_tmp_out_pip0}),
        .in_2({Order10_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order10_tmp_out_stage1)
    );

    ModAdd add1_11(
        .in_1({Order11_tmp_out_pip0}),
        .in_2({Order11_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order11_tmp_out_stage1)
    );

    ModAdd add1_12(
        .in_1({Order12_tmp_out_pip0}),
        .in_2({Order12_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order12_tmp_out_stage1)
    );

    ModAdd add1_13(
        .in_1({Order13_tmp_out_pip0}),
        .in_2({Order13_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order13_tmp_out_stage1)
    );

    ModAdd add1_14(
        .in_1({Order14_tmp_out_pip0}),
        .in_2({Order14_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order14_tmp_out_stage1)
    );

    ModAdd add1_15(
        .in_1({Order15_tmp_out_pip0}),
        .in_2({Order15_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order15_tmp_out_stage1)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order0_tmp3_pip2 <= 'd0;
            Order0_pip2 <= 'd0;
            Order0_tmp_out_pip1 <= 'd0;

            Order1_tmp3_pip2 <= 'd0;
            Order1_pip2 <= 'd0;
            Order1_tmp_out_pip1 <= 'd0;

            Order2_tmp3_pip2 <= 'd0;
            Order2_pip2 <= 'd0;
            Order2_tmp_out_pip1 <= 'd0;

            Order3_tmp3_pip2 <= 'd0;
            Order3_pip2 <= 'd0;
            Order3_tmp_out_pip1 <= 'd0;

            Order4_tmp3_pip2 <= 'd0;
            Order4_pip2 <= 'd0;
            Order4_tmp_out_pip1 <= 'd0;

            Order5_tmp3_pip2 <= 'd0;
            Order5_pip2 <= 'd0;
            Order5_tmp_out_pip1 <= 'd0;

            Order6_tmp3_pip2 <= 'd0;
            Order6_pip2 <= 'd0;
            Order6_tmp_out_pip1 <= 'd0;

            Order7_tmp3_pip2 <= 'd0;
            Order7_pip2 <= 'd0;
            Order7_tmp_out_pip1 <= 'd0;

            Order8_tmp3_pip2 <= 'd0;
            Order8_pip2 <= 'd0;
            Order8_tmp_out_pip1 <= 'd0;

            Order9_tmp3_pip2 <= 'd0;
            Order9_pip2 <= 'd0;
            Order9_tmp_out_pip1 <= 'd0;

            Order10_tmp3_pip2 <= 'd0;
            Order10_pip2 <= 'd0;
            Order10_tmp_out_pip1 <= 'd0;

            Order11_tmp3_pip2 <= 'd0;
            Order11_pip2 <= 'd0;
            Order11_tmp_out_pip1 <= 'd0;

            Order12_tmp3_pip2 <= 'd0;
            Order12_pip2 <= 'd0;
            Order12_tmp_out_pip1 <= 'd0;

            Order13_tmp3_pip2 <= 'd0;
            Order13_pip2 <= 'd0;
            Order13_tmp_out_pip1 <= 'd0;

            Order14_tmp3_pip2 <= 'd0;
            Order14_pip2 <= 'd0;
            Order14_tmp_out_pip1 <= 'd0;

            Order15_tmp3_pip2 <= 'd0;
            Order15_pip2 <= 'd0;
            Order15_tmp_out_pip1 <= 'd0;

            r_enable_pip2 <= 'd0;
            AGU_done_pip2 <= 'd0;
        end else begin
            Order0_tmp3_pip2    <= Order0_tmp3_pip1;
            Order0_pip2         <= Order0_pip1 >> `delta;
            Order0_tmp_out_pip1 <= Order0_tmp_out_stage1[15:0];

            Order1_tmp3_pip2    <= Order1_tmp3_pip1;
            Order1_pip2         <= Order1_pip1 >> `delta;
            Order1_tmp_out_pip1 <= Order1_tmp_out_stage1[15:0];

            Order2_tmp3_pip2    <= Order2_tmp3_pip1;
            Order2_pip2         <= Order2_pip1 >> `delta;
            Order2_tmp_out_pip1 <= Order2_tmp_out_stage1[15:0];

            Order3_tmp3_pip2    <= Order3_tmp3_pip1;
            Order3_pip2         <= Order3_pip1 >> `delta;
            Order3_tmp_out_pip1 <= Order3_tmp_out_stage1[15:0];

            Order4_tmp3_pip2    <= Order4_tmp3_pip1;
            Order4_pip2         <= Order4_pip1 >> `delta;
            Order4_tmp_out_pip1 <= Order4_tmp_out_stage1[15:0];

            Order5_tmp3_pip2    <= Order5_tmp3_pip1;
            Order5_pip2         <= Order5_pip1 >> `delta;
            Order5_tmp_out_pip1 <= Order5_tmp_out_stage1[15:0];

            Order6_tmp3_pip2    <= Order6_tmp3_pip1;
            Order6_pip2         <= Order6_pip1 >> `delta;
            Order6_tmp_out_pip1 <= Order6_tmp_out_stage1[15:0];

            Order7_tmp3_pip2    <= Order7_tmp3_pip1;
            Order7_pip2         <= Order7_pip1 >> `delta;
            Order7_tmp_out_pip1 <= Order7_tmp_out_stage1[15:0];

            Order8_tmp3_pip2    <= Order8_tmp3_pip1;
            Order8_pip2         <= Order8_pip1 >> `delta;
            Order8_tmp_out_pip1 <= Order8_tmp_out_stage1[15:0];

            Order9_tmp3_pip2    <= Order9_tmp3_pip1;
            Order9_pip2         <= Order9_pip1 >> `delta;
            Order9_tmp_out_pip1 <= Order9_tmp_out_stage1[15:0];

            Order10_tmp3_pip2    <= Order10_tmp3_pip1;
            Order10_pip2         <= Order10_pip1 >> `delta;
            Order10_tmp_out_pip1 <= Order10_tmp_out_stage1[15:0];

            Order11_tmp3_pip2    <= Order11_tmp3_pip1;
            Order11_pip2         <= Order11_pip1 >> `delta;
            Order11_tmp_out_pip1 <= Order11_tmp_out_stage1[15:0];

            Order12_tmp3_pip2    <= Order12_tmp3_pip1;
            Order12_pip2         <= Order12_pip1 >> `delta;
            Order12_tmp_out_pip1 <= Order12_tmp_out_stage1[15:0];

            Order13_tmp3_pip2    <= Order13_tmp3_pip1;
            Order13_pip2         <= Order13_pip1 >> `delta;
            Order13_tmp_out_pip1 <= Order13_tmp_out_stage1[15:0];

            Order14_tmp3_pip2    <= Order14_tmp3_pip1;
            Order14_pip2         <= Order14_pip1 >> `delta;
            Order14_tmp_out_pip1 <= Order14_tmp_out_stage1[15:0];

            Order15_tmp3_pip2    <= Order15_tmp3_pip1;
            Order15_pip2         <= Order15_pip1 >> `delta;
            Order15_tmp_out_pip1 <= Order15_tmp_out_stage1[15:0];

            r_enable_pip2 <= r_enable_pip1;
            AGU_done_pip2 <= AGU_done_pip1;
        end
    end
    ModAdd add2_0(
        .in_1({ Order0_tmp_out_pip1 }),
        .in_2({ Order0_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order0_tmp_out_stage2)
    );

    ModAdd add2_1(
        .in_1({ Order1_tmp_out_pip1 }),
        .in_2({ Order1_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order1_tmp_out_stage2)
    );

    ModAdd add2_2(
        .in_1({ Order2_tmp_out_pip1 }),
        .in_2({ Order2_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order2_tmp_out_stage2)
    );

    ModAdd add2_3(
        .in_1({ Order3_tmp_out_pip1 }),
        .in_2({ Order3_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order3_tmp_out_stage2)
    );

    ModAdd add2_4(
        .in_1({ Order4_tmp_out_pip1 }),
        .in_2({ Order4_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order4_tmp_out_stage2)
    );

    ModAdd add2_5(
        .in_1({ Order5_tmp_out_pip1 }),
        .in_2({ Order5_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order5_tmp_out_stage2)
    );

    ModAdd add2_6(
        .in_1({ Order6_tmp_out_pip1 }),
        .in_2({ Order6_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order6_tmp_out_stage2)
    );

    ModAdd add2_7(
        .in_1({ Order7_tmp_out_pip1 }),
        .in_2({ Order7_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order7_tmp_out_stage2)
    );

    ModAdd add2_8(
        .in_1({ Order8_tmp_out_pip1 }),
        .in_2({ Order8_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order8_tmp_out_stage2)
    );

    ModAdd add2_9(
        .in_1({ Order9_tmp_out_pip1 }),
        .in_2({ Order9_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order9_tmp_out_stage2)
    );

    ModAdd add2_10(
        .in_1({ Order10_tmp_out_pip1 }),
        .in_2({ Order10_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order10_tmp_out_stage2)
    );

    ModAdd add2_11(
        .in_1({ Order11_tmp_out_pip1 }),
        .in_2({ Order11_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order11_tmp_out_stage2)
    );

    ModAdd add2_12(
        .in_1({ Order12_tmp_out_pip1 }),
        .in_2({ Order12_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order12_tmp_out_stage2)
    );

    ModAdd add2_13(
        .in_1({ Order13_tmp_out_pip1 }),
        .in_2({ Order13_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order13_tmp_out_stage2)
    );

    ModAdd add2_14(
        .in_1({ Order14_tmp_out_pip1 }),
        .in_2({ Order14_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order14_tmp_out_stage2)
    );

    ModAdd add2_15(
        .in_1({ Order15_tmp_out_pip1 }),
        .in_2({ Order15_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order15_tmp_out_stage2)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            MA0_idx <= 'd0;
            BN0_idx <= 'd0;

            MA1_idx <= 'd0;
            BN1_idx <= 'd0;

            MA2_idx <= 'd0;
            BN2_idx <= 'd0;

            MA3_idx <= 'd0;
            BN3_idx <= 'd0;

            MA4_idx <= 'd0;
            BN4_idx <= 'd0;

            MA5_idx <= 'd0;
            BN5_idx <= 'd0;

            MA6_idx <= 'd0;
            BN6_idx <= 'd0;

            MA7_idx <= 'd0;
            BN7_idx <= 'd0;

            MA8_idx <= 'd0;
            BN8_idx <= 'd0;

            MA9_idx <= 'd0;
            BN9_idx <= 'd0;

            MA10_idx <= 'd0;
            BN10_idx <= 'd0;

            MA11_idx <= 'd0;
            BN11_idx <= 'd0;

            MA12_idx <= 'd0;
            BN12_idx <= 'd0;

            MA13_idx <= 'd0;
            BN13_idx <= 'd0;

            MA14_idx <= 'd0;
            BN14_idx <= 'd0;

            MA15_idx <= 'd0;
            BN15_idx <= 'd0;

            AGU_done_out <= 'd0;
            BN_MA_out_en <= 'd0;
        end else begin
            if (r_enable_pip2) begin
                MA0_idx <= Order0_pip2[`degree_width-1-`delta:0];
                BN0_idx <= Order0_tmp_out_stage2[15:0];

                MA1_idx <= Order1_pip2[`degree_width-1-`delta:0];
                BN1_idx <= Order1_tmp_out_stage2[15:0];

                MA2_idx <= Order2_pip2[`degree_width-1-`delta:0];
                BN2_idx <= Order2_tmp_out_stage2[15:0];

                MA3_idx <= Order3_pip2[`degree_width-1-`delta:0];
                BN3_idx <= Order3_tmp_out_stage2[15:0];

                MA4_idx <= Order4_pip2[`degree_width-1-`delta:0];
                BN4_idx <= Order4_tmp_out_stage2[15:0];

                MA5_idx <= Order5_pip2[`degree_width-1-`delta:0];
                BN5_idx <= Order5_tmp_out_stage2[15:0];

                MA6_idx <= Order6_pip2[`degree_width-1-`delta:0];
                BN6_idx <= Order6_tmp_out_stage2[15:0];

                MA7_idx <= Order7_pip2[`degree_width-1-`delta:0];
                BN7_idx <= Order7_tmp_out_stage2[15:0];

                MA8_idx <= Order8_pip2[`degree_width-1-`delta:0];
                BN8_idx <= Order8_tmp_out_stage2[15:0];

                MA9_idx <= Order9_pip2[`degree_width-1-`delta:0];
                BN9_idx <= Order9_tmp_out_stage2[15:0];

                MA10_idx <= Order10_pip2[`degree_width-1-`delta:0];
                BN10_idx <= Order10_tmp_out_stage2[15:0];

                MA11_idx <= Order11_pip2[`degree_width-1-`delta:0];
                BN11_idx <= Order11_tmp_out_stage2[15:0];

                MA12_idx <= Order12_pip2[`degree_width-1-`delta:0];
                BN12_idx <= Order12_tmp_out_stage2[15:0];

                MA13_idx <= Order13_pip2[`degree_width-1-`delta:0];
                BN13_idx <= Order13_tmp_out_stage2[15:0];

                MA14_idx <= Order14_pip2[`degree_width-1-`delta:0];
                BN14_idx <= Order14_tmp_out_stage2[15:0];

                MA15_idx <= Order15_pip2[`degree_width-1-`delta:0];
                BN15_idx <= Order15_tmp_out_stage2[15:0];
                
                AGU_done_out <= AGU_done_pip2;
                BN_MA_out_en <= 'd1;
            end else begin
                MA0_idx = 'd0;
                BN0_idx = 'd0;

                MA1_idx = 'd0;
                BN1_idx = 'd0;

                MA2_idx = 'd0;
                BN2_idx = 'd0;

                MA3_idx = 'd0;
                BN3_idx = 'd0;

                MA4_idx = 'd0;
                BN4_idx = 'd0;

                MA5_idx = 'd0;
                BN5_idx = 'd0;

                MA6_idx = 'd0;
                BN6_idx = 'd0;

                MA7_idx = 'd0;
                BN7_idx = 'd0;

                MA8_idx = 'd0;
                BN8_idx = 'd0;

                MA9_idx = 'd0;
                BN9_idx = 'd0;

                MA10_idx = 'd0;
                BN10_idx = 'd0;

                MA11_idx = 'd0;
                BN11_idx = 'd0;

                MA12_idx = 'd0;
                BN12_idx = 'd0;

                MA13_idx = 'd0;
                BN13_idx = 'd0;

                MA14_idx = 'd0;
                BN14_idx = 'd0;

                MA15_idx = 'd0;
                BN15_idx = 'd0;

                AGU_done_out <= AGU_done_pip2;
                BN_MA_out_en <= 'd0;
            end
        end
    end

endmodule