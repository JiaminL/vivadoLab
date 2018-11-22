`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/15 23:37:23
// Design Name: 
// Module Name: bcd
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


module bcdto7segment_dataflow(
    input [3:0] x,
    input [2:0] address,
    output reg [7:0] an,
    output reg [6:0] seg
    );
    always @ (*)
        begin
            case(address)
                3'd0:an=8'b11111110;
                3'd1:an=8'b11111101;
                3'd2:an=8'b11111011;
                3'd3:an=8'b11110111;
                3'd4:an=8'b11101111;
                3'd5:an=8'b11011111;
                3'd6:an=8'b10111111;
                3'd7:an=8'b01111111;
            endcase
        end
    
    always @ (*)
    begin
        case(x)
            4'd0:seg=7'b1000000;
            4'd1:seg=7'b1111001;
            4'd2:seg=7'b0100100;
            4'd3:seg=7'b0110000;
            4'd4:seg=7'b0011001;
            4'd5:seg=7'b0010010;
            4'd6:seg=7'b0000010;
            4'd7:seg=7'b1111000;
            4'd8:seg=7'b0000000;
            4'd9:seg=7'b0010000;
            default:seg=7'b1111111;
        endcase
    end
endmodule