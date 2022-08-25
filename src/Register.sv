`include "../include/define.svh"

module Register (
    input clk                           ,
    input rst                           ,
    input TF_ren                        ,
	input TF_wen                        ,
    input [2:0] it_depth_cnt   ,
    input [2:0] w_it_depth_cnt ,

    input [`D_width-1:0] TF_base_b1_out     ,
    input [`D_width-1:0] TF_base_b2_out     ,
    input [`D_width-1:0] TF_base_b3_out     ,
    input [`D_width-1:0] TF_base_b4_out     ,
    input [`D_width-1:0] TF_base_b5_out     ,
    input [`D_width-1:0] TF_base_b6_out     ,
    input [`D_width-1:0] TF_base_b7_out     ,
    input [`D_width-1:0] TF_base_b8_out     ,
    input [`D_width-1:0] TF_base_b9_out     ,
    input [`D_width-1:0] TF_base_b10_out    ,
    input [`D_width-1:0] TF_base_b11_out    ,
    input [`D_width-1:0] TF_base_b12_out    ,
    input [`D_width-1:0] TF_base_b13_out    ,
    input [`D_width-1:0] TF_base_b14_out    ,
    input [`D_width-1:0] TF_base_b15_out    ,

    input [3:0] idx1	,
    input [3:0] idx2	,
    input [3:0] idx3	,
    input [3:0] idx4	,
    input [3:0] idx5	,
    input [3:0] idx6	,
    input [3:0] idx7	,
    input [3:0] idx8	,
    input [3:0] idx9	,
    input [3:0] idx10	,
    input [3:0] idx11	,
    input [3:0] idx12	,
    input [3:0] idx13	,
    input [3:0] idx14	,
    input [3:0] idx15	,

    output logic [`D_width-1:0] Read_TF_base0  ,
    output logic [`D_width-1:0] Read_TF_base1  ,
    output logic [`D_width-1:0] Read_TF_base2  ,
    output logic [`D_width-1:0] Read_TF_base3  ,
    output logic [`D_width-1:0] Read_TF_base4  ,
    output logic [`D_width-1:0] Read_TF_base5  ,
    output logic [`D_width-1:0] Read_TF_base6  ,
    output logic [`D_width-1:0] Read_TF_base7  ,
    output logic [`D_width-1:0] Read_TF_base8  ,
    output logic [`D_width-1:0] Read_TF_base9  ,
    output logic [`D_width-1:0] Read_TF_base10 ,
    output logic [`D_width-1:0] Read_TF_base11 ,
    output logic [`D_width-1:0] Read_TF_base12 ,
    output logic [`D_width-1:0] Read_TF_base13 ,
    output logic [`D_width-1:0] Read_TF_base14 ,

    output logic [`D_width-1:0] Read_TF_const0    ,
    output logic [`D_width-1:0] Read_TF_const1    ,
    output logic [`D_width-1:0] Read_TF_const2    ,
    output logic [`D_width-1:0] Read_TF_const3    ,
    output logic [`D_width-1:0] Read_TF_const4    ,
    output logic [`D_width-1:0] Read_TF_const5    ,
    output logic [`D_width-1:0] Read_TF_const6    ,
    output logic [`D_width-1:0] Read_TF_const7    ,
    output logic [`D_width-1:0] Read_TF_const8    ,
    output logic [`D_width-1:0] Read_TF_const9    ,
    output logic [`D_width-1:0] Read_TF_const10   ,
    output logic [`D_width-1:0] Read_TF_const11   ,
    output logic [`D_width-1:0] Read_TF_const12   ,
    output logic [`D_width-1:0] Read_TF_const13   ,
    output logic [`D_width-1:0] Read_TF_const14   
);


    parameter it_depth = 8;
	parameter TF_bank = 16;
	parameter TF_const_bank = 16;

    logic [`D_width-1:0] TF_base_array[0:7][0:15];  //[0:3+2][0:15-1]
	logic [`D_width-1:0] TF_const_array[0:15];      //[0:14-1]
    

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            TF_base_array[0][0]     <=  `D_width'h3e3a2b0   ; 
            TF_base_array[0][1]     <=  `D_width'h442e7e8   ; 
            TF_base_array[0][2]     <=  `D_width'h1cff90a   ; 
            TF_base_array[0][3]     <=  `D_width'h6f76bcb   ; 
            TF_base_array[0][4]     <=  `D_width'h19bf5d5   ; 
            TF_base_array[0][5]     <=  `D_width'h7dbe285   ; 
            TF_base_array[0][6]     <=  `D_width'h2646f0b   ; 
            TF_base_array[0][7]     <=  `D_width'h108822e   ; 
            TF_base_array[0][8]     <=  `D_width'h9dbc38    ;
            TF_base_array[0][9]     <=  `D_width'h698c44d   ; 
            TF_base_array[0][10]    <=  `D_width'h7f5e353   ; 
            TF_base_array[0][11]    <=  `D_width'h3d22f79   ; 
            TF_base_array[0][12]    <=  `D_width'h259c593   ; 
            TF_base_array[0][13]    <=  `D_width'he25dd5    ;
            TF_base_array[0][14]    <=  `D_width'h9884296   ;

            TF_base_array[1][0]     <=  `D_width'h339af8f   ;
            TF_base_array[1][1]     <=  `D_width'h5a761     ;
            TF_base_array[1][2]     <=  `D_width'h1cf41c6   ;
            TF_base_array[1][3]     <=  `D_width'h1905fdb   ;
            TF_base_array[1][4]     <=  `D_width'h17fc5dd   ;
            TF_base_array[1][5]     <=  `D_width'h120de63   ;
            TF_base_array[1][6]     <=  `D_width'h9ac3146   ;
            TF_base_array[1][7]     <=  `D_width'h372a390   ;
            TF_base_array[1][8]     <=  `D_width'h7aa4c57   ;
            TF_base_array[1][9]     <=  `D_width'h1230ae7   ;
            TF_base_array[1][10]    <=  `D_width'h6617b95   ;
            TF_base_array[1][11]    <=  `D_width'h7cdff82   ;
            TF_base_array[1][12]    <=  `D_width'h68cdd99   ;
            TF_base_array[1][13]    <=  `D_width'h86e7108   ;
            TF_base_array[1][14]    <=  `D_width'h4454f67   ;

            TF_base_array[2][0]     <=  `D_width'h808a836  ;
            TF_base_array[2][1]     <=  `D_width'h4fc14e6  ;
            TF_base_array[2][2]     <=  `D_width'h4899ee9  ;
            TF_base_array[2][3]     <=  `D_width'h8fcf14c  ;
            TF_base_array[2][4]     <=  `D_width'h17d1a3e  ;
            TF_base_array[2][5]     <=  `D_width'h2b9bdb3  ;
            TF_base_array[2][6]     <=  `D_width'h367537e  ;
            TF_base_array[2][7]     <=  `D_width'h280df35  ;
            TF_base_array[2][8]     <=  `D_width'h1debef5  ;
            TF_base_array[2][9]     <=  `D_width'h6cc01f1  ;
            TF_base_array[2][10]    <=  `D_width'h68a1e5c  ;
            TF_base_array[2][11]    <=  `D_width'h7e0af96  ;
            TF_base_array[2][12]    <=  `D_width'h4874eb9  ;
            TF_base_array[2][13]    <=  `D_width'h760187e  ;
            TF_base_array[2][14]    <=  `D_width'h66c411f  ;

            TF_base_array[3][0]     <=  `D_width'h33fe7d2  ;
            TF_base_array[3][1]     <=  `D_width'h122a49   ;
            TF_base_array[3][2]     <=  `D_width'h8f3339a  ;
            TF_base_array[3][3]     <=  `D_width'h66fc73b  ;
            TF_base_array[3][4]     <=  `D_width'h4bc73ea  ;
            TF_base_array[3][5]     <=  `D_width'h88a9d60  ;
            TF_base_array[3][6]     <=  `D_width'h9b086e1  ;
            TF_base_array[3][7]     <=  `D_width'h44f23cb  ;
            TF_base_array[3][8]     <=  `D_width'h963090d  ;
            TF_base_array[3][9]     <=  `D_width'h78486cd  ;
            TF_base_array[3][10]    <=  `D_width'h44ea3e   ;
            TF_base_array[3][11]    <=  `D_width'h93bab2   ;
            TF_base_array[3][12]    <=  `D_width'h55189ed  ;
            TF_base_array[3][13]    <=  `D_width'h6fcdb71  ;
            TF_base_array[3][14]    <=  `D_width'h62fa6b8  ;

            TF_base_array[4][0]     <=  `D_width'h7b37359   ;
            TF_base_array[4][1]     <=  `D_width'h0         ;
            TF_base_array[4][2]     <=  `D_width'h0         ;
            TF_base_array[4][3]     <=  `D_width'h0         ;
            TF_base_array[4][4]     <=  `D_width'h0         ;
            TF_base_array[4][5]     <=  `D_width'h0         ;
            TF_base_array[4][6]     <=  `D_width'h0         ;
            TF_base_array[4][7]     <=  `D_width'h0         ;
            TF_base_array[4][8]     <=  `D_width'h0         ;
            TF_base_array[4][9]     <=  `D_width'h0         ;
            TF_base_array[4][10]    <=  `D_width'h0         ;
            TF_base_array[4][11]    <=  `D_width'h0         ;
            TF_base_array[4][12]    <=  `D_width'h0         ;
            TF_base_array[4][13]    <=  `D_width'h0         ;
            TF_base_array[4][14]    <=  `D_width'h0         ;
        end else begin
            case ({TF_ren, TF_wen})
                2'b10: begin
                    Read_TF_base0  <=  TF_base_array[it_depth_cnt][0]  ;
                    Read_TF_base1  <=  TF_base_array[it_depth_cnt][1]  ;
                    Read_TF_base2  <=  TF_base_array[it_depth_cnt][2]  ;
                    Read_TF_base3  <=  TF_base_array[it_depth_cnt][3]  ;
                    Read_TF_base4  <=  TF_base_array[it_depth_cnt][4]  ;
                    Read_TF_base5  <=  TF_base_array[it_depth_cnt][5]  ;
                    Read_TF_base6  <=  TF_base_array[it_depth_cnt][6]  ;
                    Read_TF_base7  <=  TF_base_array[it_depth_cnt][7]  ;
                    Read_TF_base8  <=  TF_base_array[it_depth_cnt][8]  ;
                    Read_TF_base9  <=  TF_base_array[it_depth_cnt][9]  ;
                    Read_TF_base10 <=  TF_base_array[it_depth_cnt][10] ;
                    Read_TF_base11 <=  TF_base_array[it_depth_cnt][11] ;
                    Read_TF_base12 <=  TF_base_array[it_depth_cnt][12] ;
                    Read_TF_base13 <=  TF_base_array[it_depth_cnt][13] ;
                    Read_TF_base14 <=  TF_base_array[it_depth_cnt][14] ;
                end
                2'b01: begin
                    TF_base_array[w_it_depth_cnt][0]    <=  TF_base_b1_out  ;  
                    TF_base_array[w_it_depth_cnt][1]    <=  TF_base_b2_out  ;  
                    TF_base_array[w_it_depth_cnt][2]    <=  TF_base_b3_out  ;  
                    TF_base_array[w_it_depth_cnt][3]    <=  TF_base_b4_out  ;  
                    TF_base_array[w_it_depth_cnt][4]    <=  TF_base_b5_out  ;  
                    TF_base_array[w_it_depth_cnt][5]    <=  TF_base_b6_out  ;  
                    TF_base_array[w_it_depth_cnt][6]    <=  TF_base_b7_out  ;  
                    TF_base_array[w_it_depth_cnt][7]    <=  TF_base_b8_out  ;  
                    TF_base_array[w_it_depth_cnt][8]    <=  TF_base_b9_out  ;  
                    TF_base_array[w_it_depth_cnt][9]    <=  TF_base_b10_out ;  
                    TF_base_array[w_it_depth_cnt][10]   <=  TF_base_b11_out ;
                    TF_base_array[w_it_depth_cnt][11]   <=  TF_base_b12_out ;
                    TF_base_array[w_it_depth_cnt][12]   <=  TF_base_b13_out ;
                    TF_base_array[w_it_depth_cnt][13]   <=  TF_base_b14_out ;
                    TF_base_array[w_it_depth_cnt][14]   <=  TF_base_b15_out ;
                end
                2'b11: begin
                    Read_TF_base0  <=  TF_base_array[it_depth_cnt][0];
                    Read_TF_base1  <=  TF_base_array[it_depth_cnt][1];
                    Read_TF_base2  <=  TF_base_array[it_depth_cnt][2];
                    Read_TF_base3  <=  TF_base_array[it_depth_cnt][3];
                    Read_TF_base4  <=  TF_base_array[it_depth_cnt][4];
                    Read_TF_base5  <=  TF_base_array[it_depth_cnt][5];
                    Read_TF_base6  <=  TF_base_array[it_depth_cnt][6];
                    Read_TF_base7  <=  TF_base_array[it_depth_cnt][7];
                    Read_TF_base8  <=  TF_base_array[it_depth_cnt][8];
                    Read_TF_base9  <=  TF_base_array[it_depth_cnt][9];
                    Read_TF_base10 <=  TF_base_array[it_depth_cnt][10];
                    Read_TF_base11 <=  TF_base_array[it_depth_cnt][11];
                    Read_TF_base12 <=  TF_base_array[it_depth_cnt][12];
                    Read_TF_base13 <=  TF_base_array[it_depth_cnt][13];
                    Read_TF_base14 <=  TF_base_array[it_depth_cnt][14];

                    TF_base_array[w_it_depth_cnt][0]    <= TF_base_b1_out; 
                    TF_base_array[w_it_depth_cnt][1]    <= TF_base_b2_out; 
                    TF_base_array[w_it_depth_cnt][2]    <= TF_base_b3_out; 
                    TF_base_array[w_it_depth_cnt][3]    <= TF_base_b4_out; 
                    TF_base_array[w_it_depth_cnt][4]    <= TF_base_b5_out; 
                    TF_base_array[w_it_depth_cnt][5]    <= TF_base_b6_out; 
                    TF_base_array[w_it_depth_cnt][6]    <= TF_base_b7_out; 
                    TF_base_array[w_it_depth_cnt][7]    <= TF_base_b8_out; 
                    TF_base_array[w_it_depth_cnt][8]    <= TF_base_b9_out; 
                    TF_base_array[w_it_depth_cnt][9]    <= TF_base_b10_out; 
                    TF_base_array[w_it_depth_cnt][10]   <= TF_base_b11_out;
                    TF_base_array[w_it_depth_cnt][11]   <= TF_base_b12_out;
                    TF_base_array[w_it_depth_cnt][12]   <= TF_base_b13_out;
                    TF_base_array[w_it_depth_cnt][13]   <= TF_base_b14_out;
                    TF_base_array[w_it_depth_cnt][14]   <= TF_base_b15_out;
                end
                default: begin
                    integer i, j;
                    for(i = 0; i < it_depth; i = i + 1) begin
						for(j = 0; j < TF_bank; j = j + 1) begin
							TF_base_array[i][j] <= TF_base_array[i][j];
						end
					end
                end
            endcase
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            TF_const_array[0]   <=  `D_width'h7b37359   ;
            TF_const_array[1]   <=  `D_width'h280df35   ;
            TF_const_array[2]   <=  `D_width'h8fcf14c   ;
            TF_const_array[3]   <=  `D_width'h4fc14e6   ;
            TF_const_array[4]   <=  `D_width'h808a836   ;
            TF_const_array[5]   <=  `D_width'h372a390   ;
            TF_const_array[6]   <=  `D_width'h1905fdb   ;
            TF_const_array[7]   <=  `D_width'h5a761     ; 
            TF_const_array[8]   <=  `D_width'h339af8f   ;
            TF_const_array[9]   <=  `D_width'h108822e   ;
            TF_const_array[10]  <=  `D_width'h6f76bcb   ;
            TF_const_array[11]  <=  `D_width'h442e7e8   ;
            TF_const_array[12]  <=  `D_width'h3e3a2b0   ;
            TF_const_array[13]  <=  `D_width'h1         ;
            TF_const_array[14]  <=  `D_width'h0         ;
            TF_const_array[15]  <=  `D_width'h0         ;
        end else begin
            case ({TF_ren, TF_wen})
                2'b10: begin
                    Read_TF_const0     <= TF_const_array[idx1];
                    Read_TF_const1     <= TF_const_array[idx2];
                    Read_TF_const2     <= TF_const_array[idx3];
                    Read_TF_const3     <= TF_const_array[idx4];
                    Read_TF_const4     <= TF_const_array[idx5];
                    Read_TF_const5     <= TF_const_array[idx6];
                    Read_TF_const6     <= TF_const_array[idx7];
                    Read_TF_const7     <= TF_const_array[idx8];
                    Read_TF_const8     <= TF_const_array[idx9];
                    Read_TF_const9     <= TF_const_array[idx10];
                    Read_TF_const10    <= TF_const_array[idx11];
                    Read_TF_const11    <= TF_const_array[idx12];
                    Read_TF_const12    <= TF_const_array[idx13];
                    Read_TF_const13    <= TF_const_array[idx14];
                    Read_TF_const14    <= TF_const_array[idx15];
                end 
                2'b11: begin
                    Read_TF_const0     <= TF_const_array[idx1];
                    Read_TF_const1     <= TF_const_array[idx2];
                    Read_TF_const2     <= TF_const_array[idx3];
                    Read_TF_const3     <= TF_const_array[idx4];
                    Read_TF_const4     <= TF_const_array[idx5];
                    Read_TF_const5     <= TF_const_array[idx6];
                    Read_TF_const6     <= TF_const_array[idx7];
                    Read_TF_const7     <= TF_const_array[idx8];
                    Read_TF_const8     <= TF_const_array[idx9];
                    Read_TF_const9     <= TF_const_array[idx10];
                    Read_TF_const10    <= TF_const_array[idx11];
                    Read_TF_const11    <= TF_const_array[idx12];
                    Read_TF_const12    <= TF_const_array[idx13];
                    Read_TF_const13    <= TF_const_array[idx14];
                    Read_TF_const14    <= TF_const_array[idx15];
                end
                default: begin
                    integer i;
                    for(i = 0; i < TF_const_bank; i = i + 1) begin
						TF_const_array[i] <= TF_const_array[i];
					end
                end
            endcase
        end
    end
endmodule