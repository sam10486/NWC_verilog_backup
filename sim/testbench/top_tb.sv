`include "../include/define.svh"
`include "top.sv"
`define CYCLE 10

module Testbench ();

    logic clk;
    logic rst;
    logic [`D_width-1:0] modulus;
    logic done;


    
    parameter degree = `degree;
    parameter bank_num = 15;
    parameter k1_ite = `k;
    parameter MA = `MA;
    parameter BN = `BN;

    logic [`D_width-1:0] data_in0;
    logic [`D_width-1:0] data_in1;
    logic [`D_width-1:0] data_in2;
    logic [`D_width-1:0] data_in3;
    logic [`D_width-1:0] data_in4;
    logic [`D_width-1:0] data_in5;
    logic [`D_width-1:0] data_in6;
    logic [`D_width-1:0] data_in7;
    logic [`D_width-1:0] data_in8;
    logic [`D_width-1:0] data_in9;
    logic [`D_width-1:0] data_in10;
    logic [`D_width-1:0] data_in11;
    logic [`D_width-1:0] data_in12;
    logic [`D_width-1:0] data_in13;
    logic [`D_width-1:0] data_in14;
    logic [`D_width-1:0] data_in15;

    logic [`D_width-1:0] TF_based_in [0:(k1_ite+1)*bank_num-1]; 
    logic [`D_width-1:0] TF_const_in [0:bank_num-2]; 
    logic [`D_width-1:0] mem_data_in [0:`degree-1];
    logic [`D_width-1:0] mem_data_golden [0:`degree-1]; 

    assign modulus = `D_width'd65537;


    initial begin
        $readmemh("../sim/data_file/top/TF_based_in.txt", TF_based_in);  
        $readmemh("../sim/data_file/top/TF_const_in.txt", TF_const_in);  
        $readmemh("../sim/data_file/top/mem_data_in.txt", mem_data_in);  
        $readmemh("../sim/data_file/top/mem_data_golden.txt", mem_data_golden);  
    end

    top top(
        //input
        .clk(clk),
        .rst(rst),
        .modulus(modulus),
        //output
        .done(done)
    );


    always #(`CYCLE/2) clk = ~clk;

    initial begin
        #0
        clk = 0; 
        rst = 1;
        #`CYCLE rst = 0;
    end

    initial begin
        for (int i=0 ;i<=k1_ite; i=i+1) begin
            #`CYCLE;
            top.TF_gen.TF_base_array[i][0] <= TF_based_in[i*bank_num+0];
            top.TF_gen.TF_base_array[i][1] <= TF_based_in[i*bank_num+1];
            top.TF_gen.TF_base_array[i][2] <= TF_based_in[i*bank_num+2];
            top.TF_gen.TF_base_array[i][3] <= TF_based_in[i*bank_num+3];
            top.TF_gen.TF_base_array[i][4] <= TF_based_in[i*bank_num+4];
            top.TF_gen.TF_base_array[i][5] <= TF_based_in[i*bank_num+5];
            top.TF_gen.TF_base_array[i][6] <= TF_based_in[i*bank_num+6];
            top.TF_gen.TF_base_array[i][7] <= TF_based_in[i*bank_num+7];
            top.TF_gen.TF_base_array[i][8] <= TF_based_in[i*bank_num+8];
            top.TF_gen.TF_base_array[i][9] <= TF_based_in[i*bank_num+9];
            top.TF_gen.TF_base_array[i][10] <= TF_based_in[i*bank_num+10];
            top.TF_gen.TF_base_array[i][11] <= TF_based_in[i*bank_num+11];
            top.TF_gen.TF_base_array[i][12] <= TF_based_in[i*bank_num+12];
            top.TF_gen.TF_base_array[i][13] <= TF_based_in[i*bank_num+13];
            top.TF_gen.TF_base_array[i][14] <= TF_based_in[i*bank_num+14];
        end
        
        for (int j=0; j<1; j=j+1) begin
            top.TF_gen.TF_const_array[0] <= TF_const_in[0];
            top.TF_gen.TF_const_array[1] <= TF_const_in[1];
            top.TF_gen.TF_const_array[2] <= TF_const_in[2];
            top.TF_gen.TF_const_array[3] <= TF_const_in[3];
            top.TF_gen.TF_const_array[4] <= TF_const_in[4];
            top.TF_gen.TF_const_array[5] <= TF_const_in[5];
            top.TF_gen.TF_const_array[6] <= TF_const_in[6];
            top.TF_gen.TF_const_array[7] <= TF_const_in[7];
            top.TF_gen.TF_const_array[8] <= TF_const_in[8];
            top.TF_gen.TF_const_array[9] <= TF_const_in[9];
            top.TF_gen.TF_const_array[10] <= TF_const_in[10];
            top.TF_gen.TF_const_array[11] <= TF_const_in[11];
            top.TF_gen.TF_const_array[12] <= TF_const_in[12];
            top.TF_gen.TF_const_array[13] <= TF_const_in[13];
        end

        for (int k = 0; k<MA; k=k+1) begin
            #`CYCLE;
            top.memory_top.memory_rtl.memory_array[0][k] <= mem_data_in[k*BN + 0];
            top.memory_top.memory_rtl.memory_array[1][k] <= mem_data_in[k*BN + 1];
            top.memory_top.memory_rtl.memory_array[2][k] <= mem_data_in[k*BN + 2];
            top.memory_top.memory_rtl.memory_array[3][k] <= mem_data_in[k*BN + 3];
            top.memory_top.memory_rtl.memory_array[4][k] <= mem_data_in[k*BN + 4];
            top.memory_top.memory_rtl.memory_array[5][k] <= mem_data_in[k*BN + 5];
            top.memory_top.memory_rtl.memory_array[6][k] <= mem_data_in[k*BN + 6];
            top.memory_top.memory_rtl.memory_array[7][k] <= mem_data_in[k*BN + 7];
            top.memory_top.memory_rtl.memory_array[8][k] <= mem_data_in[k*BN + 8];
            top.memory_top.memory_rtl.memory_array[9][k] <= mem_data_in[k*BN + 9];
            top.memory_top.memory_rtl.memory_array[10][k] <= mem_data_in[k*BN + 10];
            top.memory_top.memory_rtl.memory_array[11][k] <= mem_data_in[k*BN + 11];
            top.memory_top.memory_rtl.memory_array[12][k] <= mem_data_in[k*BN + 12];
            top.memory_top.memory_rtl.memory_array[13][k] <= mem_data_in[k*BN + 13];
            top.memory_top.memory_rtl.memory_array[14][k] <= mem_data_in[k*BN + 14];
            top.memory_top.memory_rtl.memory_array[15][k] <= mem_data_in[k*BN + 15];
        end
    end


    initial begin
        $fsdbDumpfile("top_tb.fsdb");
        $fsdbDumpvars;
        $fsdbDumpvars("+struct", "+mda", top);
        $fsdbDumpvars("+struct", "+mda", Testbench);
        #(`CYCLE*`MAX)
        $finish;
    end

endmodule