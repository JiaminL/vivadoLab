`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 13:49:53
// Design Name: 
// Module Name: lab9_1_1
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

module reduction_or #(parameter WIDTH = 2,DELAY = 2)(
    input [WIDTH-1:0] ain, 
    output result
    );
    assign #DELAY result = |ain;
endmodule

module reduction_and #(parameter WIDTH = 2,DELAY = 2)(
    input [WIDTH-1:0] ain, 
    output result
    );
    assign #DELAY result = &ain;
endmodule

module reduction_not #(parameter DELAY = 2)(
    input ain, 
    output result
    );
    assign #DELAY result = ~ain;
endmodule



module lab9_1_1(
    input c0,
    input a,
    input b,
    output c1,
    output sum
    );
    wire s1,m1,m2,m3,m4,n_a,n_b,n_s1,n_c0,l1,l2,l3,l4;
    //and
    reduction_and #(2,3) AND1 ({a,b},m1);
    reduction_and #(2,3) AND2 ({b,c0},m2);
    reduction_and #(2,3) AND3 ({a,c0},m3);
    //not
    reduction_not #(1) NOT1 (a,n_a);
    reduction_not #(1) NOT2 (b,n_b);
    reduction_not #(1) NOT3 (s1,n_s1);
    reduction_not #(1) NOT4 (c0,n_c0);
   //xor
    reduction_and #(2,3) AND4 ({a,n_b},l1);
    reduction_and #(2,3) AND5 ({n_a,b},l2);
    reduction_or #(2,3) XOR1 ({l1,l2},s1);
    reduction_and #(2,3) AND6 ({s1,n_c0},l3);
    reduction_and #(2,3) AND7 ({n_s1,c0},l4);
    reduction_or #(2,3) XOR2 ({l3,l4},sum);
    //or
    reduction_or #(2,3) OR1 ({m1,m2},m4);
    reduction_or #(2,3) OR2 ({m3,m4},c1);
    
endmodule
