`timescale 1ns/100fs
`define numAddr 5

module Top_test;

logic clk;
logic rst, learn, classify;
logic [`numAddr-1:0] KMEM_ADD1;
logic [`numAddr-1:0] KMEM_ADD2;
logic [`numAddr-1:0] WMEM_ADD1;
logic [`numAddr-1:0] WMEM_ADD2;
logic [2:0] [7:0] InputImage[2:0];
logic [3:0] [7:0] pixels;
logic [7:0] result;
logic KMEM_WEB1, KMEM_OEB1, KMEM_CSB1;
logic KMEM_WEB2, KMEM_OEB2, KMEM_CSB2;
logic WMEM_WEB1, WMEM_OEB1, WMEM_CSB1;
logic WMEM_WEB2, WMEM_OEB2, WMEM_CSB2;
logic [31:0] KR_DATA_I1, KR_DATA_I2, W1_DATA_I1, W1_DATA_I2, W2_DATA_I1, W2_DATA_I2;

Top Top_U1(.*);

initial begin
 clk = 1'b0 ;
 rst  = 1'b1 ;
 learn  = 1'b0 ;
 classify  = 1'b0 ;
@(negedge clk);
 rst  = 1'b0 ;
 learn  = 1'b1 ;
repeat(2) @(negedge clk);
 learn  = 1'b0 ;
 classify  = 1'b1 ;
#250 $finish;
end

always begin
 #5 clk = ~clk;
end

`include "bin/monitor.sv"
endmodule
