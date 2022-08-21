`include "../include/define.svh"
`include "Register.sv"
//`include "barrett_reduction.sv"

module TF_gen(
	input clk,
	input rst,
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

	logic [`D_width-1:0] TF_base_array[0:it_depth+2][0:TF_bank-1];
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


	logic [`D_width-1:0] Read_TF_base0  ;
	logic [`D_width-1:0] Read_TF_base1  ;
	logic [`D_width-1:0] Read_TF_base2  ;
	logic [`D_width-1:0] Read_TF_base3  ;
	logic [`D_width-1:0] Read_TF_base4  ;
	logic [`D_width-1:0] Read_TF_base5  ;
	logic [`D_width-1:0] Read_TF_base6  ;
	logic [`D_width-1:0] Read_TF_base7  ;
	logic [`D_width-1:0] Read_TF_base8  ;
	logic [`D_width-1:0] Read_TF_base9  ;
	logic [`D_width-1:0] Read_TF_base10 ;
	logic [`D_width-1:0] Read_TF_base11 ;
	logic [`D_width-1:0] Read_TF_base12 ;
	logic [`D_width-1:0] Read_TF_base13 ;
	logic [`D_width-1:0] Read_TF_base14 ;
	
	logic [`D_width-1:0] Read_TF_const0    ;
	logic [`D_width-1:0] Read_TF_const1    ;
	logic [`D_width-1:0] Read_TF_const2    ;
	logic [`D_width-1:0] Read_TF_const3    ;
	logic [`D_width-1:0] Read_TF_const4    ;
	logic [`D_width-1:0] Read_TF_const5    ;
	logic [`D_width-1:0] Read_TF_const6    ;
	logic [`D_width-1:0] Read_TF_const7    ;
	logic [`D_width-1:0] Read_TF_const8    ;
	logic [`D_width-1:0] Read_TF_const9    ;
	logic [`D_width-1:0] Read_TF_const10   ;
	logic [`D_width-1:0] Read_TF_const11   ;
	logic [`D_width-1:0] Read_TF_const12   ;
	logic [`D_width-1:0] Read_TF_const13   ;
	logic [`D_width-1:0] Read_TF_const14   ;

	Register Register(
		//input
		.clk           	(clk),
		.rst           	(rst),
		.TF_ren        	(TF_ren),
		.TF_wen        	(TF_wen),
		.it_depth_cnt   (it_depth_cnt),
		.w_it_depth_cnt (w_it_depth_cnt),

		.TF_base_b1_out  (TF_base_b1_out ),
		.TF_base_b2_out  (TF_base_b2_out ),
		.TF_base_b3_out  (TF_base_b3_out ),
		.TF_base_b4_out  (TF_base_b4_out ),
		.TF_base_b5_out  (TF_base_b5_out ),
		.TF_base_b6_out  (TF_base_b6_out ),
		.TF_base_b7_out  (TF_base_b7_out ),
		.TF_base_b8_out  (TF_base_b8_out ),
		.TF_base_b9_out  (TF_base_b9_out ),
		.TF_base_b10_out (TF_base_b10_out),
		.TF_base_b11_out (TF_base_b11_out),
		.TF_base_b12_out (TF_base_b12_out),
		.TF_base_b13_out (TF_base_b13_out),
		.TF_base_b14_out (TF_base_b14_out),
		.TF_base_b15_out (TF_base_b15_out),

		.idx1	(idx1),
		.idx2	(idx2),
		.idx3	(idx3),
		.idx4	(idx4),
		.idx5	(idx5),
		.idx6	(idx6),
		.idx7	(idx7),
		.idx8	(idx8),
		.idx9	(idx9),
		.idx10	(idx10),
		.idx11	(idx11),
		.idx12	(idx12),
		.idx13	(idx13),
		.idx14	(idx14),
		.idx15	(idx15),
		
		//output
		.Read_TF_base0  (Read_TF_base0 ),
		.Read_TF_base1  (Read_TF_base1 ),
		.Read_TF_base2  (Read_TF_base2 ),
		.Read_TF_base3  (Read_TF_base3 ),
		.Read_TF_base4  (Read_TF_base4 ),
		.Read_TF_base5  (Read_TF_base5 ),
		.Read_TF_base6  (Read_TF_base6 ),
		.Read_TF_base7  (Read_TF_base7 ),
		.Read_TF_base8  (Read_TF_base8 ),
		.Read_TF_base9  (Read_TF_base9 ),
		.Read_TF_base10 (Read_TF_base10),
		.Read_TF_base11 (Read_TF_base11),
		.Read_TF_base12 (Read_TF_base12),
		.Read_TF_base13 (Read_TF_base13),
		.Read_TF_base14 (Read_TF_base14),

		.Read_TF_const0    (Read_TF_const0 ),
		.Read_TF_const1    (Read_TF_const1 ),
		.Read_TF_const2    (Read_TF_const2 ),
		.Read_TF_const3    (Read_TF_const3 ),
		.Read_TF_const4    (Read_TF_const4 ),
		.Read_TF_const5    (Read_TF_const5 ),
		.Read_TF_const6    (Read_TF_const6 ),
		.Read_TF_const7    (Read_TF_const7 ),
		.Read_TF_const8    (Read_TF_const8 ),
		.Read_TF_const9    (Read_TF_const9 ),
		.Read_TF_const10   (Read_TF_const10),
		.Read_TF_const11   (Read_TF_const11),
		.Read_TF_const12   (Read_TF_const12),
		.Read_TF_const13   (Read_TF_const13),
		.Read_TF_const14   (Read_TF_const14)
	);
	
	
	logic [`D_width-1:0] l_pip;
	logic [`D_width-1:0] l_pip1;
	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			l_pip <= `D_width'd0;
			l_pip1 <= `D_width'd0;
		end else begin
			l_pip <= l;
			l_pip1 <= l_pip;
		end
	end 
	
	always_comb begin
		if(TF_ren == 'd1 && TF_wen == 'd0) begin
			if (l_pip1 == 'd2 && w_it_depth_cnt == it_depth_cnt) begin
				TF_base_b1 = 	TF_base_b1_out;
				TF_base_b2 = 	TF_base_b2_out;
				TF_base_b3 = 	TF_base_b3_out;
				TF_base_b4 = 	TF_base_b4_out;
				TF_base_b5 = 	TF_base_b5_out;
				TF_base_b6 = 	TF_base_b6_out;
				TF_base_b7 = 	TF_base_b7_out;
				TF_base_b8 = 	TF_base_b8_out;
				TF_base_b9 = 	TF_base_b9_out;
				TF_base_b10 =	TF_base_b10_out;
				TF_base_b11 =	TF_base_b11_out;
				TF_base_b12 =	TF_base_b12_out;
				TF_base_b13 =	TF_base_b13_out;
				TF_base_b14 =	TF_base_b14_out;
				TF_base_b15 =	TF_base_b15_out;
			end else begin
				TF_base_b1 	= Read_TF_base0 ;
				TF_base_b2 	= Read_TF_base1 ;
				TF_base_b3 	= Read_TF_base2 ;
				TF_base_b4 	= Read_TF_base3 ;
				TF_base_b5 	= Read_TF_base4 ;
				TF_base_b6 	= Read_TF_base5 ;
				TF_base_b7 	= Read_TF_base6 ;
				TF_base_b8 	= Read_TF_base7 ;
				TF_base_b9 	= Read_TF_base8 ;
				TF_base_b10 = Read_TF_base9 ;
				TF_base_b11 = Read_TF_base10;
				TF_base_b12 = Read_TF_base11;
				TF_base_b13 = Read_TF_base12;
				TF_base_b14 = Read_TF_base13;
				TF_base_b15 = Read_TF_base14;
			end
		end else begin
			TF_base_b1 	= Read_TF_base0 ;
			TF_base_b2 	= Read_TF_base1 ;
			TF_base_b3 	= Read_TF_base2 ;
			TF_base_b4 	= Read_TF_base3 ;
			TF_base_b5 	= Read_TF_base4 ;
			TF_base_b6 	= Read_TF_base5 ;
			TF_base_b7 	= Read_TF_base6 ;
			TF_base_b8 	= Read_TF_base7 ;
			TF_base_b9 	= Read_TF_base8 ;
			TF_base_b10 = Read_TF_base9 ;
			TF_base_b11 = Read_TF_base10;
			TF_base_b12 = Read_TF_base11;
			TF_base_b13 = Read_TF_base12;
			TF_base_b14 = Read_TF_base13;
		    TF_base_b15 = Read_TF_base14;
		end
		TF_const_b1 	= Read_TF_const0 ;
		TF_const_b2 	= Read_TF_const1 ;
		TF_const_b3 	= Read_TF_const2 ;
		TF_const_b4 	= Read_TF_const3 ;
		TF_const_b5 	= Read_TF_const4 ;
		TF_const_b6 	= Read_TF_const5 ;
		TF_const_b7 	= Read_TF_const6 ;
		TF_const_b8 	= Read_TF_const7 ;
		TF_const_b9 	= Read_TF_const8 ;
		TF_const_b10 	= Read_TF_const9 ;
		TF_const_b11 	= Read_TF_const10;
		TF_const_b12 	= Read_TF_const11;
		TF_const_b13 	= Read_TF_const12;
		TF_const_b14 	= Read_TF_const13;
		TF_const_b15 	= Read_TF_const14;
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