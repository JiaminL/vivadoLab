`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 14:44:51
// Design Name: 
// Module Name: lab9_1_1_tb
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


module lab9_1_1_tb();
    reg c0;
    reg a;
    reg b;
    wire c1;
    wire sum;
    lab9_1_1 FULL_SUM (.c0(c0),.a(a),.b(b),.c1(c1),.sum(sum));
    
    initial
        #320 $finish;
    
    initial
        begin
            c0=0;a=0;b=0;
            #40;
            c0=0;a=0;b=1;
            #40;
            c0=0;a=1;b=0;
            #40;
            c0=0;a=1;b=1;
            #40;
            c0=1;a=0;b=0;
            #40;
            c0=1;a=0;b=1;
            #40;
            c0=1;a=1;b=0;
            #40;
            c0=1;a=1;b=1;
       end
            
   
endmodule
