`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/15 20:22:21
// Design Name: 
// Module Name: lab8_1_1
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


module lab8_1_1(
    input clk_in1,
    input clr,
    input Enable,
    output reg Q,
    output locked
    );
    reg [21:0] cnt;
    wire clk_out1;
    clk_wiz_0 CLK ( .clk_in1(clk_in1), .clk_out1(clk_out1),.reset(clr), .locked(locked));
       
    initial
    begin
        cnt=22'b0;
    end

    always @(negedge Enable or posedge clk_out1)
    begin
        if (Enable==0)
            cnt<=cnt;
        else if (cnt==22'd2499999)
            cnt<=0;
        else
            cnt<=(cnt+1);
    end
    
    always @(posedge clk_out1)
    begin
        if(cnt==22'd0)
            Q<=!Q;
        else
            Q<=Q;
    end
    
endmodule
