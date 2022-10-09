`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2022 11:26:59
// Design Name: 
// Module Name: coder
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


module coder(
input logic d_in,
input logic clock,
input logic Clk,
output logic [1:0] reg_sin
);
logic [2:0] clock_count;

initial begin
reg_sin= 2'b00;
clock_count=3'd0;
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
    if (clock_count==1)begin
        if(d_in==0)begin
            reg_sin[0]<=0;
        end else begin
            reg_sin[1:0] <= {~reg_sin[1],1'b1};
        end
    end else if(clock_count==2) begin 
    reg_sin[1:0] = reg_sin[1:0];
    end else begin 
        reg_sin[0]<=0;
    end
end
   
endmodule
