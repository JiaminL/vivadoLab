`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/29 20:10:16
// Design Name: 
// Module Name: lab10_1_1
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


module lab10_1_1(//三段式Mealy状态机
    input clk,
    input reset,
    input ain,
    output reg [3:0] count,
    output reg yout
    );
    reg Rstate;
    reg [3:0] nextcount;
    parameter S0=0,S1=1;//0表示正常计数状态，1表示强制清零状态
    initial
        begin
            yout<=1;
            count<=0;
            Rstate<=S0;
        end
    
    always @(posedge clk or posedge reset or negedge reset)	//改变状态
    begin
        if(reset&&count)Rstate<=S1;
        else if(~reset)Rstate<=S0;
        if (reset)
            count<=0;
        else if(clk)
            count<=nextcount;
    end 
                    
               
    always @(Rstate or count or ain)	// 输出只与当前状态与当前输入有关
    begin
        if(Rstate==S0)
            if(count%3==0)
                begin
                    if(count==0&&~ain) yout=1;
                    else if(count!=0&&ain) yout=1;
                    else yout=0;
                end
            else yout=0;
    end
    
    always @(*)	// 生成下一状态
        if(~reset && ain)
             nextcount<=count+1;
        else if(reset)
             nextcount<=0;
        else
             nextcount<=count;
           
    
endmodule


