`timescale 1ns / 1ps


module Decoder_bench;
logic d_in;
bit clk=1'b1;
bit clock=1'b1;
logic [1:0] reg_sin;

logic [31:0] datain;
logic [32:0] dataout; 


logic  data;




parameter PERIOD = 8;

initial forever  #(PERIOD/8) clock = ~clock;
initial forever  #(PERIOD/2) clk = ~clk;

coder cod(
    .Clk(clk),
    .clock(clock),
    .d_in(d_in),
    .reg_sin(reg_sin)

);

decoder dec(
    .Clk(clk),
    .clock(clock),
    .data(data),
    .reg_sin(reg_sin)

);

task coder_task(
    input [31:0] datain,
    output [32:0] dataout
);
    begin
        for (int i = 31; i>=0; i--)begin 
        @(posedge clk);
        #1;
        
        d_in = datain[i];
        dataout[i+1] =data;
        end
    dataout[0] = data;    
    end
endtask



initial begin
    d_in = 0;
    
    
    datain = 32'd8200408;
   
    @(posedge clk);
    #1;
    coder_task(datain, dataout );
    if (datain[31:0] != dataout[31:0])begin
    $display("erorr transmit");
    end else begin 
    $display("ok");
    end
    
    
end
endmodule