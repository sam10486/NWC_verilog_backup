`include "../include/define.svh"
//`include "ModAdd.sv"


module Order_translate_k2 (
    input clk,
    input rst,

    input [`D_width-1:0] Order_0,
    input [`D_width-1:0] Order_1,

    input r_enable_k2,
    input AGU_done_k2,
    input [`D_width-1:0] l,

    output logic [`MA_width-1:0] MA0_idx_k2,
    output logic [`MA_width-1:0] MA1_idx_k2,

    output logic [`BANK_width-1:0] BN0_idx_k2,
    output logic [`BANK_width-1:0] BN1_idx_k2,

    output logic AGU_done_out_k2,
    output logic BN_MA_out_en_k2,
    output logic [`D_width-1:0] l_AGU_out_k2
);


    logic [`D_width-1:0] Order0_tmp0_pip0,  Order0_tmp1_pip0, Order0_tmp2_pip0, Order0_tmp3_pip0;
    logic [`D_width-1:0] Order0_tmp2_pip1, Order0_tmp3_pip1;
    logic [`D_width-1:0] Order0_tmp3_pip2;
    logic [`D_width-1:0] Order0_tmp_out_pip0, Order0_tmp_out_pip1;
    logic [`D_width-1:0] Order0_pip0, Order0_pip1, Order0_pip2;

    logic [`D_width-1:0] Order1_tmp0_pip0,  Order1_tmp1_pip0, Order1_tmp2_pip0, Order1_tmp3_pip0;
    logic [`D_width-1:0] Order1_tmp2_pip1,  Order1_tmp3_pip1;
    logic [`D_width-1:0] Order1_tmp3_pip2;
    logic [`D_width-1:0] Order1_tmp_out_pip0, Order1_tmp_out_pip1;
    logic [`D_width-1:0] Order1_pip0, Order1_pip1, Order1_pip2;

    logic r_enable_k2_pip0, r_enable_k2_pip1, r_enable_k2_pip2;
    logic AGU_done_k2_pip0, AGU_done_k2_pip1, AGU_done_k2_pip2;

    logic [`D_width-1:0] Order0_tmp_out_stage0, Order0_tmp_out_stage1,  Order0_tmp_out_stage2;
    logic [`D_width-1:0] Order1_tmp_out_stage0, Order1_tmp_out_stage1,  Order1_tmp_out_stage2;

    logic [`D_width-1:0] l_pip0, l_pip1, l_pip2;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order0_tmp0_pip0 <= 'd0;
            Order0_tmp1_pip0 <= 'd0;
            Order0_tmp2_pip0 <= 'd0;
            Order0_tmp3_pip0 <= 'd0;
            Order0_pip0 <=      'd0;

            Order1_tmp0_pip0 <= 'd0;
            Order1_tmp1_pip0 <= 'd0;
            Order1_tmp2_pip0 <= 'd0;
            Order1_tmp3_pip0 <= 'd0;
            Order1_pip0 <=      'd0;

            r_enable_k2_pip0 <= 'd0;
            AGU_done_k2_pip0 <= 'd0;
            l_pip0 <= 'd0;
        end else begin
            Order0_tmp0_pip0 <= Order_0[3:0];
            Order0_tmp1_pip0 <= Order_0[7:4];
            Order0_tmp2_pip0 <= Order_0[11:8];
            Order0_tmp3_pip0 <= Order_0[`degree_width-1:12];
            Order0_pip0 <=      Order_0;

            Order1_tmp0_pip0 <= Order_1[3:0];
            Order1_tmp1_pip0 <= Order_1[7:4];
            Order1_tmp2_pip0 <= Order_1[11:8];
            Order1_tmp3_pip0 <= Order_1[`degree_width-1:12];
            Order1_pip0 <=      Order_1;

            r_enable_k2_pip0 <= r_enable_k2;
            AGU_done_k2_pip0 <= AGU_done_k2;
            l_pip0 <= l;
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

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order0_tmp2_pip1        <= 'd0;
            Order0_tmp3_pip1        <= 'd0;
            Order0_pip1             <= 'd0;
            Order0_tmp_out_pip0     <= 'd0;   

            Order1_tmp2_pip1        <= 'd0;
            Order1_tmp3_pip1        <= 'd0;
            Order1_pip1             <= 'd0;
            Order1_tmp_out_pip0     <= 'd0;

            r_enable_k2_pip1        <= 'd0;
            AGU_done_k2_pip1        <= 'd0;

            l_pip1 <= 'd0;
        end else begin
            Order0_tmp2_pip1        <= Order0_tmp2_pip0;
            Order0_tmp3_pip1        <= Order0_tmp3_pip0;
            Order0_pip1             <= Order0_pip0;
            Order0_tmp_out_pip0     <= Order0_tmp_out_stage0[15:0];       

            Order1_tmp2_pip1        <= Order1_tmp2_pip0;
            Order1_tmp3_pip1        <= Order1_tmp3_pip0;
            Order1_pip1             <= Order1_pip0;
            Order1_tmp_out_pip0     <= Order1_tmp_out_stage0[15:0];   

            r_enable_k2_pip1        <= r_enable_k2_pip0;
            AGU_done_k2_pip1        <= AGU_done_k2_pip0;
            l_pip1 <= l_pip0;
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

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order0_tmp3_pip2    <= 'd0;
            Order0_pip2         <= 'd0;
            Order0_tmp_out_pip1 <= 'd0;

            Order1_tmp3_pip2    <= 'd0;
            Order1_pip2         <= 'd0;
            Order1_tmp_out_pip1 <= 'd0;

            r_enable_k2_pip2 <= 'd0;
            AGU_done_k2_pip2 <= 'd0;
            l_pip2 <= 'd0;
        end else begin
            Order0_tmp3_pip2    <= Order0_tmp3_pip1;
            Order0_pip2         <= Order0_pip1 >> `delta;
            Order0_tmp_out_pip1 <= Order0_tmp_out_stage1[15:0];

            Order1_tmp3_pip2    <= Order1_tmp3_pip1;
            Order1_pip2         <= Order1_pip1 >> `delta;
            Order1_tmp_out_pip1 <= Order1_tmp_out_stage1[15:0];

            r_enable_k2_pip2    <= r_enable_k2_pip1;
            AGU_done_k2_pip2    <= AGU_done_k2_pip1;
            l_pip2 <= l_pip1;
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

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            MA0_idx_k2  <= 'd0;
            BN0_idx_k2  <= 'd0;

            MA1_idx_k2  <= 'd0;
            BN1_idx_k2  <= 'd0;

            AGU_done_out_k2 <= 'd0;
            BN_MA_out_en_k2 <= 'd0;
            l_AGU_out_k2 <= 'd0;
        end else begin
            if (r_enable_k2_pip2) begin
                MA0_idx_k2  <= Order0_pip2[`degree_width-1-`delta:0];
                BN0_idx_k2  <= Order0_tmp_out_stage2[15:0];

                MA1_idx_k2  <= Order1_pip2[`degree_width-1-`delta:0];
                BN1_idx_k2  <= Order1_tmp_out_stage2[15:0];

                AGU_done_out_k2 <= AGU_done_k2_pip2;
                BN_MA_out_en_k2 <= 'd1;
                l_AGU_out_k2 <= l_pip2;
            end else begin
                MA0_idx_k2  <= 'd0;
                BN0_idx_k2  <= 'd0;

                MA1_idx_k2  <= 'd0;
                BN1_idx_k2  <= 'd0;

                AGU_done_out_k2 <= 'd0;
                BN_MA_out_en_k2 <= 'd0;
                l_AGU_out_k2 <= 'd0;
            end
        end
    end


endmodule