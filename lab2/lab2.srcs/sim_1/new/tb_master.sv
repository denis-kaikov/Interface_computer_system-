`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 01:54:37
// Design Name: 
// Module Name: tb_master
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


module tb_master;
logic [7:0] d_in;
logic [6:0] ad;
logic [1:0] slve;
logic act;
logic  reset;
logic clock=1'b0;
logic miso;
logic ss0;
logic ss1;
logic ss2;
logic  mosi;
parameter PERIOD = 10;
initial forever  #(PERIOD/2) clock = ~clock;
logic [7:0]datain = 8'd45;

master dut(.*);

mpu pts(.*);

    initial begin
        
        ad = 7'd114;
        d_in=8'b11001011;
        act = 1'b0;
        #10
        slve = 2'd0;
        reset= 1'b1;
        #5
        reset= 1'b0;
        #10
        slve = 2'd3;
        
        #400
        
        ad = 7'd115;
        d_in=8'b11001011;
        act = 1'b0;
        #10
        slve = 2'd0;
        reset= 1'b1;
        #5
        reset= 1'b0;
        #10
        slve = 2'd3;
        
        #200
        ad = 7'd116;
        d_in=8'b11001011;
        act = 1'b0;
        #100
        slve = 2'd0;
        reset= 1'b1;
        #5
        reset= 1'b0;
        #10
        slve = 2'd3;
        
        #400
        ad = 7'd116;
        d_in=8'b11001011;
        act = 1'b0;
        #100
        slve = 2'd0;
        reset= 1'b1;
        #5
        reset= 1'b0;
        #10
        slve = 2'd3;
//       for (int i = 7; i>=0; i--)begin 
//       @(negedge clock);
//       miso = datain[i];
        
//       end
//       #12
//       datain = 8'd255;
       
       
//        for (int i = 7; i>=0; i--)begin 
//       @(negedge clock);
//       miso = datain[i];
        
//       end
//       #10
//       slve = 2'd3;
    
        //slve = 2'd3;
    end
endmodule
