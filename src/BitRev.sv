`include "../include/define.svh"

module BitRev(
    input [`D_width-1:0] input_idx,
    input BitRev_enable,
    input [2:0] l,
    input clk,
    input rst,

    output logic [`D_width-1:0] BitRev_out
);

    logic [6:0] BitRev_width;



    assign BitRev_width = `radix_k1 * l;

    always_ff @(posedge clk or posedge rst) begin
        integer i;
        if (rst) begin
            for (i = 0; i<`D_width; i=i+1) begin
                BitRev_out[i] <= 'd0;
            end
        end else begin
            if (BitRev_enable) begin
                for (i = 0; i < `D_width; i = i+1) begin
                    if (i < BitRev_width) begin
                        BitRev_out[BitRev_width - 'd1 - i] <= input_idx[i];
                    end
                end
            end else begin
                for (i = 0; i<`D_width; i=i+1) begin
					BitRev_out[i] <= 'd0;
				end
            end
        end
    end


endmodule