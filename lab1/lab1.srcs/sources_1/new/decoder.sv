`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2022 02:11:29
// Design Name: 
// Module Name: decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder(
input logic [1:0] reg_sin,
input logic clock,
input logic Clk,
output logic  data
 );

logic [2:0] clock_count;
logic  prev_state;
logic datain; 

initial begin

clock_count=3'd0;
prev_state= 1'b0;
end     
always@(posedge clock)
begin
    if (clock_count>2 & Clk == 1 )begin 
        clock_count=3'd0;
        
    end else begin 
        clock_count=clock_count+1;
        
    end 
end

always@(posedge clock)
begin
    if (clock_count==2 )begin
        if(reg_sin[0]==0 )begin
        datain<=1'b0;    
        end else if(reg_sin[0]==1 & prev_state == ~reg_sin[1] ) begin
        datain<=1'b1;    
        prev_state <= reg_sin[1];
        end
    end 
end
//assign data = datain;
always@(posedge Clk)
begin
data <= datain;
end

endmodule
