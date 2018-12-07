`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 12:23:18
// Design Name: 
// Module Name: lab10_2_1
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


module lab10_2_1(
    input [1:0] ain,
    input clk,
    input reset,
    output reg yout
//    output reg [2:0] state,
//    output reg D
    );
    reg [2:0] state;
    reg [2:0] nextstate;
    parameter S0=0, S1=1, S2=2 ,S3=3, S4=4, S5=5, S6=6;
    reg D;
    initial
        begin
            state=S0;
            yout=0;
        end
        
    always @(posedge clk or posedge reset)	// 更新状态
    begin
        D=yout;
        if (reset)
            state <= S0;
        else
            state <= nextstate;
    end
    
    always @(state)	// 输出只与当前状态有关
        begin
            case(state)
                S0: yout <= 0;
                S1: yout <= 1;
                S2: yout <=~ D;
                default: yout <= D;
            endcase
        end
        
    always @(ain , state)	// 下一状态
    begin
        case(ain)
            2'b01:nextstate = S3;
            2'b11:nextstate = S4;
            2'b10:nextstate = S5;
            2'b00:case(state)
                        S3:nextstate = S0;
                        S4:nextstate = S1;
                        S5:nextstate = S2;
                        default:nextstate = S6;
                   endcase
        endcase
    end
endmodule
