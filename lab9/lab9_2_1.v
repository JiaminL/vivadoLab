`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 15:14:03
// Design Name: 
// Module Name: lab9_2_1
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

(* use_dsp48 = "no" *)
module lab9_2_1 #(parameter COUNT_SIZE=512)(
    input clk_in1,
    input Enable,
    input Reset,
    input Up,
    output reg [7:0] cnt,
    output locked
    );
    reg clk_1HZ;
    reg [21:0] cnt1; 
    wire clk_out;
    initial
        begin
            cnt1=0;
            cnt=0;
        end
    clk_wiz_0 CLk(
        .clk_in1(clk_in1),
        .clk_out1(clk_out1),
        .reset(0),
        .locked(locked));
    always @(posedge clk_out1)
        begin
           if (cnt1==22'd2499999)
                cnt1<=0;
           else
                cnt1<=(cnt1+1);
        end
    always @(posedge clk_out1)
        if(cnt1==22'd2499999)
           clk_1HZ=~clk_1HZ;
    always @(posedge clk_1HZ,posedge Reset)
        if(Reset)
            cnt<=0;
        else if(Enable)
            if(Up)
                if(cnt==COUNT_SIZE-1)
                    cnt<=0;
                else
                    cnt <= cnt+1;
            else
                if(cnt==0)
                    cnt<=COUNT_SIZE-1;
                else
                    cnt <= cnt-1;    
endmodule
