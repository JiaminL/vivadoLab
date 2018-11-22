`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 00:20:32
// Design Name: 
// Module Name: lab8_1_2
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


module lab8_1_2(
    input clk_in1,
    input [3:0] v,
    output [7:0] an,
    output [6:0] seg,
    output locked
    );
    wire clk_out1;
    wire [3:0] m;
    wire z;
    reg [2:0] address;
    reg [13:0] cnt;
    reg [3:0] bcdin;
    
    bcdto7segment_dataflow BCD (bcdin,address,an,seg);
    lab2_2_1_partA A (v,z,m);
    clk_wiz_0 CLK_5MHZ (.clk_in1(clk_in1),.clk_out1(clk_out1),.locked(locked));
       
    initial
    begin
        address=3'd0;
        cnt=0;
    end
    
    always @(posedge clk_out1)
    begin
        if(cnt==14'd9999)
            cnt<=0;
        else
            cnt<=(cnt+1);
     end
     /*
     always @(posedge clk_out1)
        if(cnt==14'd0)
            address=(address==3'd0)?3'd1:3'd0;
     
     always @(address)
        if(address==0)
            bcdin=m;
        else
            bcdin={1'b0,1'b0,z};
      */
      always @(posedge clk_out1)
        begin
              if(cnt==14'd0)
                  address=(address==3'd0)?3'd1:3'd0;
              if(address==0)
                   bcdin=m;
               else
                   bcdin={1'b0,1'b0,z};
         end
               
endmodule
