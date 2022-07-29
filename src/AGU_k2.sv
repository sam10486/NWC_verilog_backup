`include "../include/define.svh"
`include "BitRev.sv"

module AGU_k2 (
    input clk,
    input rst,
    input AGU_enable_k2,


    output logic [`D_width-1:0] Order_0_k2,
    output logic [`D_width-1:0] Order_1_k2,
    output logic AGU_out_en_k2,
    output logic AGU_done_k2,
    
    output logic [`D_width-1:0] l_k2
);

   
    parameter radix_k1 = `radix_k1;
    parameter radix_k2 = `radix_k2;

    logic [`D_width-1:0] j;
    logic [`D_width-1:0] BitRev_out_j;
    logic [`D_width-1:0] tmp1, tmp1_pip;
    logic [`D_width-1:0] m0_pip, m1_pip;
    logic [`D_width-1:0] k;
    assign k = `k;
    logic [`D_width-1:0] j_upper_k2; 
    assign j_upper_k2 = (1 << (radix_k1 * k) );
    
    assign l_k2 = `Last_l;


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            j <= 'd0;
            AGU_done_k2 <= 'd0;
        end else begin
            if (AGU_enable_k2) begin
                if (j < j_upper_k2) begin
                    j <= j + 'd1;
                    AGU_done_k2 <= 'd0;
                end else begin
                    j <= 'd0;
                    AGU_done_k2 <= 'd1;
                end
            end else begin
                j <= 'd0;
                AGU_done_k2 <= 'd0;
            end
        end
    end

    BitRev BitRev1(
        .input_idx(j),
        .BitRev_enable(AGU_enable_k2),
        .l(k),
        .clk(clk),
        .rst(rst),

        .BitRev_out(BitRev_out_j)
    );

    always_comb begin
        if (AGU_enable_k2) begin
            tmp1 = (1 << radix_k2);
        end else begin
            tmp1 = 'd0;
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            tmp1_pip <= 'd0;
            AGU_out_en_k2 <= 'd0;

            m0_pip <= 'd0;
            m1_pip <= 'd0;
        end else begin
            tmp1_pip <= tmp1;
            AGU_out_en_k2 <= AGU_enable_k2;

            m0_pip <= 'd0;
            m1_pip <= 'd1;
        end
    end

    always_comb begin
        Order_0_k2 = (BitRev_out_j * tmp1_pip) + m0_pip;
        Order_1_k2 = (BitRev_out_j * tmp1_pip) + m1_pip;
    end


endmodule