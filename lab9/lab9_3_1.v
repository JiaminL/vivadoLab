`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/23 15:42:09
// Design Name: 
// Module Name: lab9_3_1
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


module lab9_3_1(
    input clk_in1,
    input Enable,
    input Reset,
    output [7:0] an,
    output [6:0] seg,
    output locked,
    output reg point
    );
    wire clk_out1; 
    wire [3:0] m0;
    wire [3:0] m1;
    wire [3:0] m2;
    wire [3:0] m3;
    wire [3:0] c;
    reg clk_10HZ;
    reg [2:0] address;
    reg [18:0] cnt1; 
    reg [13:0] cnt2;
    reg [3:0] bcdin;
    
    
    clk_wiz_0 CLK_5MHZ( .clk_in1(clk_in1),.clk_out1(clk_out1),.reset(0),.locked(locked));
    bcdto7segment_dataflow BCD (bcdin,address,an,seg);
    c_counter_binary_10 CNT0 (
      .CLK(clk_10HZ),         
      .CE(Enable),            
      .SCLR(Reset),        
      .THRESH0(c[0]),  
      .Q(m0)             
    );
    c_counter_binary_10 CNT1 (
      .CLK(clk_10HZ),          // input wire CLK
      .CE(Enable&c[0]),            // input wire CE
      .SCLR(Reset),        // input wire SCLR
      .THRESH0(c[1]),  // output wire THRESH0
      .Q(m1)              // output wire [3 : 0] Q
    );
    c_counter_binary_6 CNT2 (
      .CLK(clk_10HZ),          // input wire CLK
      .CE(Enable&c[0]&c[1]),            // input wire CE
      .SCLR(Reset),        // input wire SCLR
      .THRESH0(c[2]),  // output wire THRESH0
      .Q(m2)              // output wire [3 : 0] Q
    );
    c_counter_binary_5 CNT3 (
      .CLK(clk_10HZ),          // input wire CLK
      .CE(Enable&c[0]&c[1]&c[2]),            // input wire CE
      .SCLR(Reset),        // input wire SCLR
      .THRESH0(c[3]),  // output wire THRESH0
      .Q(m3)              // output wire [3 : 0] Q
    );
    initial
        begin
            cnt1=0;
            cnt2=0;
            address=0;
        end
    always @(posedge clk_out1)
        begin
            if (cnt1==19'd499999)
                cnt1<=0;
            else
                cnt1<=(cnt1+1);
                    
            if(cnt2==14'd9999)
                cnt2<=0;
            else
                cnt2<=(cnt2+1);
        end

      always @(posedge clk_out1)
            begin
                if(cnt1===19'd250001)
                    clk_10HZ<=1;
                else if(cnt1===23'd0)
                    clk_10HZ<=0;
            end
       always @(posedge clk_out1)
            if(cnt2==14'd0)
                case(address)
                    3'd0:address=3'd1;
                    3'd1:address=3'd2;
                    3'd2:address=3'd3;
                    3'd3:address=3'd0;
                endcase        
        always @(address)
             case(address)
                  3'd0:begin bcdin=m0;point=1;end
                  3'd1:begin bcdin=m1;point=0;end
                  3'd2:begin bcdin=m2;point=1;end
                  3'd3:begin bcdin=m3;point=0;end
              endcase   
endmodule
