`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 05:46:41
// Design Name: 
// Module Name: mpu
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


module mpu(
input logic clock,
input logic mosi,
output logic ss0,
output logic  miso
);
logic [4:0] pct = 5'd17;
logic [7:0] data  [127:0];
logic [6:0] adress  = 7'd0;
logic [6:0] adr = 7'd24;
logic enable  = 1'd0;
logic write  = 1'd0;
logic flag  = 1'd0;

initial begin
ss0 <= 1'b1;
miso <=  1'b0;

end 
   


always@(negedge clock)
begin
    
   data[114]<= 7'd45;
   data[115]<= 7'd5;
   data[116]<= 7'd20;
   data[117]<= 7'd91;
   
   
    
   if(write )begin
    
        if(pct<5'd9 & pct>=5'd1 )miso= data[adress][pct-1];
        else miso = 0;
        
    end
    else miso = 1'd0;
    if (enable | write) begin
        if (pct == 5'd0 )begin
                if (write) begin
                    pct <=5'd0; 
                    write =  1'b0;
                    enable = 1'b0;
                end 
                else begin 
                pct <=5'd8;
                enable = 1'b0;
                write = 1'b1;
                end
                
            end
            else     
            pct = pct - 1'd1;
    end        
    
    
end
always@(posedge clock)
begin
    if(~flag & enable) begin
    flag<=1'd1;
    pct = 5'd16;
    end
    else if (enable) begin
        if((pct<5'd15)& (pct>5'd7) )adress[pct-8]<=mosi;
        
    end        
end

always@(negedge ss0)
begin
    enable <=1'b1;
end

always@(posedge ss0)
begin
    enable <=1'b0;
    write <= 1'b0;
    flag<=1'd0;
end
endmodule
