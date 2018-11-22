`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 15:09:02
// Design Name: 
// Module Name: lab8_2_1_tb
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


module lab8_2_1_tb();
    reg clk_in;
    wire[3:0] Q0;
    wire[3:0] Q1;
    wire T0;
    wire T1;
    
    initial
        #10000 $finish;
    
    initial
        begin
            clk_in=0;
            while(1)
                #5 clk_in=~clk_in;
        end
        
    c_counter_binary_0 CNT0 ( .CLK(clk_in), .CE(1),.THRESH0(T0), .Q(Q0) );
    c_counter_binary_0 CNT1 ( .CLK(clk_in), .CE(T0),.THRESH0(T1),.Q(Q1) );
  
endmodule
