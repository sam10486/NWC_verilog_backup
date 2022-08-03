`include "../include/define.svh"
`include "barrett_reduction.sv"

module TF_gen(
	input clk,
	input rst,
	input TF_init_base,
	input TF_ren,
	input TF_wen,
	input [`D_width-1:0] it_depth_cnt,
	input [`D_width-1:0] TF_base_in0,
	input [`D_width-1:0] TF_base_in1,
	input [`D_width-1:0] TF_base_in2,
	input [`D_width-1:0] TF_base_in3,
	input [`D_width-1:0] TF_base_in4,
	input [`D_width-1:0] TF_base_in5,
	input [`D_width-1:0] TF_base_in6,
	input [`D_width-1:0] TF_base_in7,
	input [`D_width-1:0] TF_base_in8,
	input [`D_width-1:0] TF_base_in9,
	input [`D_width-1:0] TF_base_in10,
	input [`D_width-1:0] TF_base_in11,
	input [`D_width-1:0] TF_base_in12,
	input [`D_width-1:0] TF_base_in13,
	input [`D_width-1:0] TF_base_in14,
	

	input  TF_init_const,
	input [`D_width-1:0] TF_const_in0,
	input [`D_width-1:0] TF_const_in1,
	input [`D_width-1:0] TF_const_in2,
	input [`D_width-1:0] TF_const_in3,
	input [`D_width-1:0] TF_const_in4,
	input [`D_width-1:0] TF_const_in5,
	input [`D_width-1:0] TF_const_in6,
	input [`D_width-1:0] TF_const_in7,
	input [`D_width-1:0] TF_const_in8,
	input [`D_width-1:0] TF_const_in9,
	input [`D_width-1:0] TF_const_in10,
	input [`D_width-1:0] TF_const_in11,
	input [`D_width-1:0] TF_const_in12,
	input [`D_width-1:0] TF_const_in13,
	input [`D_width-1:0] modulus,
	input [`D_width-1:0] l,

	input [`D_width-1:0] idx1	, 
	input [`D_width-1:0] idx2	, 
	input [`D_width-1:0] idx3	,
	input [`D_width-1:0] idx4	,
	input [`D_width-1:0] idx5	,
	input [`D_width-1:0] idx6	,
	input [`D_width-1:0] idx7	,
	input [`D_width-1:0] idx8	,
	input [`D_width-1:0] idx9	,
	input [`D_width-1:0] idx10	,
	input [`D_width-1:0] idx11	,
	input [`D_width-1:0] idx12	,
	input [`D_width-1:0] idx13	,
	input [`D_width-1:0] idx14	,
	input [`D_width-1:0] idx15	,

	output logic [`D_width-1:0] TF_base_b1_select,
	
	output logic [`D_width-1:0] TF_base_b1,
	output logic [`D_width-1:0] TF_base_b2,
	output logic [`D_width-1:0] TF_base_b3,
	output logic [`D_width-1:0] TF_base_b4,
	output logic [`D_width-1:0] TF_base_b5,
	output logic [`D_width-1:0] TF_base_b6,
	output logic [`D_width-1:0] TF_base_b7,
	output logic [`D_width-1:0] TF_base_b8,
	output logic [`D_width-1:0] TF_base_b9,
	output logic [`D_width-1:0] TF_base_b10,
	output logic [`D_width-1:0] TF_base_b11,
	output logic [`D_width-1:0] TF_base_b12,
	output logic [`D_width-1:0] TF_base_b13,
	output logic [`D_width-1:0] TF_base_b14,
	output logic [`D_width-1:0] TF_base_b15

);

	parameter it_depth = 3;
	parameter TF_bank = 15;
	parameter TF_const_bank = 15;

	logic [`D_width-1:0] TF_base_array[0:it_depth+4][0:TF_bank-1];
	logic [`D_width-1:0] TF_const_array[0:TF_const_bank-1];
	

	logic [`D_width-1:0] TF_const_b1;
	logic [`D_width-1:0] TF_const_b2;
	logic [`D_width-1:0] TF_const_b3;
	logic [`D_width-1:0] TF_const_b4;
	logic [`D_width-1:0] TF_const_b5;
	logic [`D_width-1:0] TF_const_b6;
	logic [`D_width-1:0] TF_const_b7;
	logic [`D_width-1:0] TF_const_b8;
	logic [`D_width-1:0] TF_const_b9;
	logic [`D_width-1:0] TF_const_b10;
	logic [`D_width-1:0] TF_const_b11;
	logic [`D_width-1:0] TF_const_b12;
	logic [`D_width-1:0] TF_const_b13;
	logic [`D_width-1:0] TF_const_b14;
	logic [`D_width-1:0] TF_const_b15;
	
	logic [`D_width-1:0] TF_base_b1_out; 
	logic [`D_width-1:0] TF_base_b2_out; 
	logic [`D_width-1:0] TF_base_b3_out; 
	logic [`D_width-1:0] TF_base_b4_out; 
	logic [`D_width-1:0] TF_base_b5_out; 
	logic [`D_width-1:0] TF_base_b6_out; 
	logic [`D_width-1:0] TF_base_b7_out; 
	logic [`D_width-1:0] TF_base_b8_out; 
	logic [`D_width-1:0] TF_base_b9_out; 
	logic [`D_width-1:0] TF_base_b10_out;
	logic [`D_width-1:0] TF_base_b11_out;
	logic [`D_width-1:0] TF_base_b12_out;
	logic [`D_width-1:0] TF_base_b13_out;
	logic [`D_width-1:0] TF_base_b14_out;
	logic [`D_width-1:0] TF_base_b15_out; 

	logic [`D_width-1:0] w_it_depth_cnt;

	logic [`D_width-1:0] test;
	assign test = TF_base_array[4][0];



	always_ff@(posedge clk or posedge rst) begin
		if(rst) begin
			for(int i=0; i<it_depth; i++) begin
				for(int j=0; j<TF_bank; j++) begin
					TF_base_array[i][j] <= 'd0;
				end
			end
		end 
	end 
	
	
	always_ff@(posedge clk or posedge rst) begin
		if(rst) begin
			for(int i=0; i<TF_const_bank; i++) begin
				TF_const_array[i] <= 'd0;
			end
		end
	end

	logic [`D_width-1:0] test_TF;
	assign test_TF = TF_base_array[3][4];
	
	always_ff@(posedge clk) begin
		case({TF_init_base, TF_init_const, TF_ren, TF_wen})
			'b1000: begin
				TF_base_array[it_depth_cnt][0] <= TF_base_in0;
				TF_base_array[it_depth_cnt][1] <= TF_base_in1;
				TF_base_array[it_depth_cnt][2] <= TF_base_in2;
				TF_base_array[it_depth_cnt][3] <= TF_base_in3;
				TF_base_array[it_depth_cnt][4] <= TF_base_in4;
				TF_base_array[it_depth_cnt][5] <= TF_base_in5;
				TF_base_array[it_depth_cnt][6] <= TF_base_in6;
				TF_base_array[it_depth_cnt][7] <= TF_base_in7;
				TF_base_array[it_depth_cnt][8] <= TF_base_in8;
				TF_base_array[it_depth_cnt][9] <= TF_base_in9;
				TF_base_array[it_depth_cnt][10] <= TF_base_in10;
				TF_base_array[it_depth_cnt][11] <= TF_base_in11;
				TF_base_array[it_depth_cnt][12] <= TF_base_in12;
				TF_base_array[it_depth_cnt][13] <= TF_base_in13;
				TF_base_array[it_depth_cnt][14] <= TF_base_in14;
			end
			'b0100: begin
				TF_const_array[0] <= TF_const_in0;
				TF_const_array[1] <= TF_const_in1;
				TF_const_array[2] <= TF_const_in2;
				TF_const_array[3] <= TF_const_in3;
				TF_const_array[4] <= TF_const_in4;
				TF_const_array[5] <= TF_const_in5;
				TF_const_array[6] <= TF_const_in6;
				TF_const_array[7] <= TF_const_in7;
				TF_const_array[8] <= TF_const_in8;
				TF_const_array[9] <= TF_const_in9;
				TF_const_array[10] <= TF_const_in10;
				TF_const_array[11] <= TF_const_in11;
				TF_const_array[12] <= TF_const_in12;
				TF_const_array[13] <= TF_const_in13;
			end
			'b0010: begin
				TF_base_b1 <= TF_base_array[it_depth_cnt][0];
				TF_base_b2 <= TF_base_array[it_depth_cnt][1];
				TF_base_b3 <= TF_base_array[it_depth_cnt][2];
				TF_base_b4 <= TF_base_array[it_depth_cnt][3];
				TF_base_b5 <= TF_base_array[it_depth_cnt][4];
				TF_base_b6 <= TF_base_array[it_depth_cnt][5];
				TF_base_b7 <= TF_base_array[it_depth_cnt][6];
				TF_base_b8 <= TF_base_array[it_depth_cnt][7];
				TF_base_b9 <= TF_base_array[it_depth_cnt][8];
				TF_base_b10 <= TF_base_array[it_depth_cnt][9];
				TF_base_b11 <= TF_base_array[it_depth_cnt][10];
				TF_base_b12 <= TF_base_array[it_depth_cnt][11];
				TF_base_b13 <= TF_base_array[it_depth_cnt][12];
				TF_base_b14 <= TF_base_array[it_depth_cnt][13];
				TF_base_b15 <= TF_base_array[it_depth_cnt][14];
				
				TF_const_b1 <= TF_const_array[idx1];
				TF_const_b2 <= TF_const_array[idx2];
				TF_const_b3 <= TF_const_array[idx3];
				TF_const_b4 <= TF_const_array[idx4];
				TF_const_b5 <= TF_const_array[idx5];
				TF_const_b6 <= TF_const_array[idx6];
				TF_const_b7 <= TF_const_array[idx7];
				TF_const_b8 <= TF_const_array[idx8];
				TF_const_b9 <= TF_const_array[idx9];
				TF_const_b10 <= TF_const_array[idx10];
				TF_const_b11 <= TF_const_array[idx11];
				TF_const_b12 <= TF_const_array[idx12];
				TF_const_b13 <= TF_const_array[idx13];
				TF_const_b14 <= TF_const_array[idx14];
				TF_const_b15 <= TF_const_array[idx15];
				
			end
			'b0001: begin
				TF_base_array[w_it_depth_cnt][0] <= TF_base_b1_out; 
				TF_base_array[w_it_depth_cnt][1] <= TF_base_b2_out; 
				TF_base_array[w_it_depth_cnt][2] <= TF_base_b3_out; 
				TF_base_array[w_it_depth_cnt][3] <= TF_base_b4_out; 
				TF_base_array[w_it_depth_cnt][4] <= TF_base_b5_out; 
				TF_base_array[w_it_depth_cnt][5] <= TF_base_b6_out; 
				TF_base_array[w_it_depth_cnt][6] <= TF_base_b7_out; 
				TF_base_array[w_it_depth_cnt][7] <= TF_base_b8_out; 
				TF_base_array[w_it_depth_cnt][8] <= TF_base_b9_out; 
				TF_base_array[w_it_depth_cnt][9] <= TF_base_b10_out; 
				TF_base_array[w_it_depth_cnt][10] <= TF_base_b11_out;
				TF_base_array[w_it_depth_cnt][11] <= TF_base_b12_out;
				TF_base_array[w_it_depth_cnt][12] <= TF_base_b13_out;
				TF_base_array[w_it_depth_cnt][13] <= TF_base_b14_out;
				TF_base_array[w_it_depth_cnt][14] <= TF_base_b15_out;	
			end
			'b0011: begin
				if (l == 'd2 && w_it_depth_cnt == it_depth_cnt) begin
					TF_base_b1 <= 	TF_base_b1_out;
					TF_base_b2 <= 	TF_base_b2_out;
					TF_base_b3 <= 	TF_base_b3_out;
					TF_base_b4 <= 	TF_base_b4_out;
					TF_base_b5 <= 	TF_base_b5_out;
					TF_base_b6 <= 	TF_base_b6_out;
					TF_base_b7 <= 	TF_base_b7_out;
					TF_base_b8 <= 	TF_base_b8_out;
					TF_base_b9 <= 	TF_base_b9_out;
					TF_base_b10 <=	TF_base_b10_out;
					TF_base_b11 <=	TF_base_b11_out;
					TF_base_b12 <=	TF_base_b12_out;
					TF_base_b13 <=	TF_base_b13_out;
					TF_base_b14 <=	TF_base_b14_out;
					TF_base_b15 <=	TF_base_b15_out;

				end else begin
					TF_base_b1 <= TF_base_array[it_depth_cnt][0];
					TF_base_b2 <= TF_base_array[it_depth_cnt][1];
					TF_base_b3 <= TF_base_array[it_depth_cnt][2];
					TF_base_b4 <= TF_base_array[it_depth_cnt][3];
					TF_base_b5 <= TF_base_array[it_depth_cnt][4];
					TF_base_b6 <= TF_base_array[it_depth_cnt][5];
					TF_base_b7 <= TF_base_array[it_depth_cnt][6];
					TF_base_b8 <= TF_base_array[it_depth_cnt][7];
					TF_base_b9 <= TF_base_array[it_depth_cnt][8];
					TF_base_b10 <= TF_base_array[it_depth_cnt][9];
					TF_base_b11 <= TF_base_array[it_depth_cnt][10];
					TF_base_b12 <= TF_base_array[it_depth_cnt][11];
					TF_base_b13 <= TF_base_array[it_depth_cnt][12];
					TF_base_b14 <= TF_base_array[it_depth_cnt][13];
					TF_base_b15 <= TF_base_array[it_depth_cnt][14];
				end
				
				
				TF_const_b1 <= TF_const_array[idx1];
				TF_const_b2 <= TF_const_array[idx2];
				TF_const_b3 <= TF_const_array[idx3];
				TF_const_b4 <= TF_const_array[idx4];
				TF_const_b5 <= TF_const_array[idx5];
				TF_const_b6 <= TF_const_array[idx6];
				TF_const_b7 <= TF_const_array[idx7];
				TF_const_b8 <= TF_const_array[idx8];
				TF_const_b9 <= TF_const_array[idx9];
				TF_const_b10 <= TF_const_array[idx10];
				TF_const_b11 <= TF_const_array[idx11];
				TF_const_b12 <= TF_const_array[idx12];
				TF_const_b13 <= TF_const_array[idx13];
				TF_const_b14 <= TF_const_array[idx14];
				TF_const_b15 <= TF_const_array[idx15];

				TF_base_array[w_it_depth_cnt][0] <= TF_base_b1_out; 
				TF_base_array[w_it_depth_cnt][1] <= TF_base_b2_out; 
				TF_base_array[w_it_depth_cnt][2] <= TF_base_b3_out; 
				TF_base_array[w_it_depth_cnt][3] <= TF_base_b4_out; 
				TF_base_array[w_it_depth_cnt][4] <= TF_base_b5_out; 
				TF_base_array[w_it_depth_cnt][5] <= TF_base_b6_out; 
				TF_base_array[w_it_depth_cnt][6] <= TF_base_b7_out; 
				TF_base_array[w_it_depth_cnt][7] <= TF_base_b8_out; 
				TF_base_array[w_it_depth_cnt][8] <= TF_base_b9_out; 
				TF_base_array[w_it_depth_cnt][9] <= TF_base_b10_out; 
				TF_base_array[w_it_depth_cnt][10] <= TF_base_b11_out;
				TF_base_array[w_it_depth_cnt][11] <= TF_base_b12_out;
				TF_base_array[w_it_depth_cnt][12] <= TF_base_b13_out;
				TF_base_array[w_it_depth_cnt][13] <= TF_base_b14_out;
				TF_base_array[w_it_depth_cnt][14] <= TF_base_b15_out;	
			end
			default: begin
				TF_base_b1 	<= 'd0	;
				TF_base_b2 	<= 'd0	;
				TF_base_b3 	<= 'd0	;
				TF_base_b4 	<= 'd0	;
				TF_base_b5 	<= 'd0	;
				TF_base_b6 	<= 'd0	;
				TF_base_b7 	<= 'd0	;
				TF_base_b8 	<= 'd0	;
				TF_base_b9 	<= 'd0	;
				TF_base_b10 <= 'd0	;
				TF_base_b11 <= 'd0	;
				TF_base_b12 <= 'd0	;
				TF_base_b13 <= 'd0	;
				TF_base_b14 <= 'd0	;
				TF_base_b15 <= 'd0	;

				TF_const_b1 	<= 'd0;
				TF_const_b2 	<= 'd0;
				TF_const_b3 	<= 'd0;
				TF_const_b4 	<= 'd0;
				TF_const_b5 	<= 'd0;
				TF_const_b6 	<= 'd0;
				TF_const_b7 	<= 'd0;
				TF_const_b8 	<= 'd0;
				TF_const_b9 	<= 'd0;
				TF_const_b10 	<= 'd0;
				TF_const_b11 	<= 'd0;
				TF_const_b12 	<= 'd0;
				TF_const_b13 	<= 'd0;
				TF_const_b14 	<= 'd0;
				TF_const_b15 	<= 'd0;
			end
		endcase
	end

	//----------depth buf-----------------
	logic [`D_width-1:0] it_depth_cnt_pip [0:1];
	integer i;
	assign w_it_depth_cnt = it_depth_cnt;
	//-------------------------------

	//-----------
	assign TF_base_b1_select = (l == 'd4 && TF_wen) ? TF_base_b1_out : TF_base_b1;
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b1(
        .a(TF_base_b1_select),
        .b(TF_const_b1),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b1_out)
    );
	
	///---------------------
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b2(
        .a(TF_base_b2),
        .b(TF_const_b2),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b2_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b3(
        .a(TF_base_b3),
        .b(TF_const_b3),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b3_out)
    );
	//------------
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b4(
        .a(TF_base_b4),
        .b(TF_const_b4),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b4_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b5(
        .a(TF_base_b5),
        .b(TF_const_b5),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b5_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b6(
        .a(TF_base_b6),
        .b(TF_const_b6),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b6_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b7(
        .a(TF_base_b7),
        .b(TF_const_b7),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b7_out)
    );
	
	//---------------
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b8(
        .a(TF_base_b8),
        .b(TF_const_b8),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b8_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b9(
        .a(TF_base_b9),
        .b(TF_const_b9),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b9_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b10(
        .a(TF_base_b10),
        .b(TF_const_b10),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b10_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b11(
        .a(TF_base_b11),
        .b(TF_const_b11),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b11_out)
    );
	
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b12(
        .a(TF_base_b12),
        .b(TF_const_b12),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b12_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b13(
        .a(TF_base_b13),
        .b(TF_const_b13),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b13_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b14(
        .a(TF_base_b14),
        .b(TF_const_b14),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b14_out)
    );
	
	barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction_b15(
        .a(TF_base_b15),
        .b(TF_const_b15),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(TF_base_b15_out)
    );
	

endmodule