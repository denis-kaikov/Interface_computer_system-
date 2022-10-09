`timescale 1ns / 1ps


module Decoder_bench2;

bit clk=1'b1;
bit clock=1'b1;
logic [1:0] reg_sin;
logic  data;





parameter PERIOD = 8;

initial forever  #(PERIOD/8) clock = ~clock;
initial forever  #(PERIOD/2) clk = ~clk;


decoder dec1(
    .Clk(clk),
    .clock(clock),
    .data(data),
    .reg_sin(reg_sin)


);





initial begin
    
    
    
    
   
    @(posedge clk);
    #1;
    reg_sin = 2'b01;
    
    #5;
    @(posedge clk);
     reg_sin = 2'b00;
     
    #10
    @(posedge clk);
     reg_sin = 2'b11; 
     
end
endmodule