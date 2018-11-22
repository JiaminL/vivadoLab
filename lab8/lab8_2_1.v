···Verilog
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 08:37:30
// Design Name: 
// Module Name: lab8_2_1
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


module lab8_2_1(
    input clk_in1,
    input clr,
    input Enable,
    output [7:0] an,
    output [6:0] seg,
    output locked
    );
     wire clk_out1; 
     wire [3:0] m0;
     wire [3:0] m1;
     wire c0;
     wire c1;
     reg clk_1HZ;
     reg [2:0] address;
     reg [21:0] cnt1; 
     reg [13:0] cnt2; 
     reg [3:0] bcdin;
       
    clk_wiz_0 CLK_5MHZ( .clk_in1(clk_in1),.clk_out1(clk_out1),.reset(0),.locked(locked));
    bcdto7segment_dataflow BCD (bcdin,address,an,seg);
    c_counter_binary_0 CNT0 ( .CLK(clk_1HZ), .CE(Enable),.SCLR(clr),.THRESH0(c0), .Q(m0) );
    c_counter_binary_0 CNT1 ( .CLK(clk_1HZ), .CE(c0&Enable),.SCLR(clr),.THRESH0(c1),.Q(m1) );
    
    initial
    begin
        cnt1=0;
        cnt2=0;
        address=0;
    end

    always @(posedge clk_out1)
    begin
        if (cnt1==22'd2499999)
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
         if(cnt2==14'd0)
             address=(address==3'd0)?3'd1:3'd0;
         if(cnt1==22'd2499999)
            clk_1HZ=~clk_1HZ;
    end
    
     always @(address)
         if(address==0)
             bcdin=m0;
         else
             bcdin=m1;
    
endmodule
