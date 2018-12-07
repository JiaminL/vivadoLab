`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/07 14:44:01
// Design Name: 
// Module Name: lab10_2_1_tb
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

module lab10_2_1_tb( );
    reg [1:0] ain;
    reg clk;
    reg reset;
    wire yout;
    
    lab10_2_1 A (.ain(ain),.clk(clk),.reset(reset),.yout(yout));
    initial
        #250 $finish;
    
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
            #150 reset=1;
            #10 reset=0;
        end
    
    initial
        begin
            ain=0;
            #40 ain=3;
            #10 ain=2;
            #10 ain=0;
            #20 ain=2;
            #10 ain=0;
            #10 ain=3;
            #10 ain=0;
            #10 ain=1;
            #10 ain=0;
            #10 ain=2;
            #10 ain=3;
            #10 ain=0;
            #30 ain=2;
            #30 ain=0;
        end
            
            
endmodule