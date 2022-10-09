`timescale 1ns / 1ps


module Coder_bench;
logic d_in;
bit clk=1'b1;
bit clock=1'b1;
logic [1:0] reg_sin;
logic [31:0] datain;
logic [2:0] clock_count;

parameter PERIOD = 8;

initial forever  #(PERIOD/8) clock = ~clock;
initial forever  #(PERIOD/2) clk = ~clk;

coder dut(
    .Clk(clk),
    .clock(clock),
    .d_in(d_in),
    .clock_count(clock_count),
    .reg_sin(reg_sin)

);

task coder_task(
    input [32:0]datain,
    output integer data_
);
    begin
        for (int i = 31; i>=0; i--)begin 
        @(posedge clk);
        d_in = datain[i];
        
        end
    end
endtask


initial begin
    
    
    int data_out;
    datain = 32'd8200408;
   
    @(posedge clk);
    #1;
    
    coder_task(datain,data_out);
   
end
endmodule