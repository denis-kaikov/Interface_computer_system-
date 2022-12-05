`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 00:11:17
// Design Name: 
// Module Name: master
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


module master(
input logic [7:0] d_in,
input logic [6:0] ad,
input logic [1:0] slve,
input logic act,
input logic  reset,
input logic clock,
input logic miso,
output logic ss0,
output logic ss1,
output logic ss2,
output logic  mosi
);
logic [4:0] pct = 5'd17;
logic [7:0] data  = 8'd0;
logic [6:0] adress  = 7'd0;
logic enable  = 1'd0;
logic flag  = 1'd0;
logic action  = 1'd0;
initial begin
ss0 <= 1'b1;
ss1 <= 1'b1;
ss2 <= 1'b1;

mosi <=  1'b0;
end 
   


always@(negedge clock or posedge reset)
begin
    if(reset)begin
        enable <= 1'd1;
        pct = 5'd17;
        flag=1'b0;
        action = act;
    end
    
   else if(enable)begin
        if(pct==5'd17)begin 
            data=action==1 ? d_in : 8'd0;
            adress=ad;
            case (slve)
                2'd0: ss0 <= 1'b0;
                2'd1: ss1 <= 1'b0;     
                2'd2: ss2 <= 1'b0;    
           default:  ss0 <= 1'b1;
        endcase   
        end
        else if(pct==5'd16)mosi=act;
        else if(pct>5'd8)mosi= adress[pct-9];
        else begin 
            if (act==1) begin
                mosi <= data[pct-1];
            end
            else mosi <= miso;
        end
        if (pct == 5'd0)begin
            if (action==0 & ~ss0)begin 
                pct <=5'd8;
                action = 1'd1;
            end
            else begin 
                pct <=5'd0;
                enable = 1'b0;
                mosi <= 1'b0;
            end
            
        end
        else     
        pct = pct - 1'd1;
    end
    
    else if ((slve==2'd3))begin 
        ss0 <= 1'b1;
        ss1 <= 1'b1;
        ss2 <= 1'b1;
        
    end
    else begin
        if (pct==5'd0) begin 
        enable = 1'b1;
        pct <=5'd8;
        end
        
        
        
        
    end
end
always@(posedge clock)
begin
    if(action & (pct<5'd8) & ~flag )begin 
        data[pct]<=miso;
        if (pct==5'd0 & ~flag)flag = 1'd1; 
        end
end
endmodule
