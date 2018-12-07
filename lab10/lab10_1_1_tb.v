`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/29 22:07:17
// Design Name: 
// Module Name: lab10_1_1_tb
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


module lab10_1_1_tb( );
    reg clk;
    reg reset;
    reg ain;
    wire [3:0] count;
    wire yout;
    
    lab10_1_1 A(.clk(clk),.reset(reset),.ain(ain),.count(count),.yout(yout));
    
    initial
        #600 $finish;
        
    initial
    begin
        clk=0;
        while(1)
            #5 clk=~clk;
    end
    
    initial
    begin
        reset=1;
        #20 reset=0;
        #170 reset=1;
        #42 reset=0;
    end
    
    initial
    begin
        ain=0;
        #40 ain=1;
        #20 ain=0;
        #60 ain=1;
        #40 ain=0;
        #20 ain=1;
        #30 ain=0;
        #40 ain=1;
     end
    
endmodule
