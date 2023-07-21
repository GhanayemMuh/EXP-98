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
end

initial begin
repeat(2) @(posedge clk);
KR_DATA_I1 = 32'h01ffff01;
W1_DATA_I1 = 32'h01ffff01;
W1_DATA_I2 = 32'hff0101ff;
W2_DATA_I1 = 32'hff0101ff;
W2_DATA_I2 = 32'h01ffff01;

@(posedge clk);
KR_DATA_I1 = 32'hff0101ff;
W1_DATA_I1 = 32'hffffffff;
W1_DATA_I2 = 32'hff0101ff;
W2_DATA_I1 = 32'h01ffff01;
W2_DATA_I2 = 32'hffffffff;
end

initial begin
// Shape-1: "X"
repeat(4) @(negedge clk);
InputImage[2] = {8'h01,8'hff,8'h01} ;
InputImage[1] = {8'hff,8'h01,8'hff} ;
InputImage[0] = {8'h01,8'hff,8'h01} ;
pixels = {InputImage[2][2],InputImage[2][1],InputImage[1][2],InputImage[1][1]};
@(negedge clk);
pixels = {InputImage[2][1],InputImage[2][0],InputImage[1][1],InputImage[1][0]};
@(negedge clk);
pixels = {InputImage[1][2],InputImage[1][1],InputImage[0][2],InputImage[0][1]};
@(negedge clk);
pixels = {InputImage[1][1],InputImage[1][0],InputImage[0][1],InputImage[0][0]};

// Shape-2: "O"
repeat(4) @(negedge clk);
InputImage[2] = {8'hff,8'h01,8'hff};
InputImage[1] = {8'h01,8'hff,8'h01} ;
InputImage[0] = {8'hff,8'h01,8'hff};
pixels = {InputImage[2][2],InputImage[2][1],InputImage[1][2],InputImage[1][1]};
@(negedge clk);
pixels = {InputImage[2][1],InputImage[2][0],InputImage[1][1],InputImage[1][0]};
@(negedge clk);
pixels = {InputImage[1][2],InputImage[1][1],InputImage[0][2],InputImage[0][1]};
@(negedge clk);
pixels = {InputImage[1][1],InputImage[1][0],InputImage[0][1],InputImage[0][0]};


// Shape-3: "/"
repeat(4) @(negedge clk);
InputImage[2] = {8'hff,8'hff,8'h01};
InputImage[1] = {8'hff,8'h01,8'hff} ;
InputImage[0] = {8'h01,8'hff,8'hff};
pixels = {InputImage[2][2],InputImage[2][1],InputImage[1][2],InputImage[1][1]};
@(negedge clk);
pixels = {InputImage[2][1],InputImage[2][0],InputImage[1][1],InputImage[1][0]};
@(negedge clk);
pixels = {InputImage[1][2],InputImage[1][1],InputImage[0][2],InputImage[0][1]};
@(negedge clk);
pixels = {InputImage[1][1],InputImage[1][0],InputImage[0][1],InputImage[0][0]};

// Shape-4: "\"
repeat(4) @(negedge clk);
InputImage[2] = {8'h01,8'hff,8'hff};
InputImage[1] = {8'hff,8'h01,8'hff} ;
InputImage[0] = {8'hff,8'hff,8'h01};
pixels = {InputImage[2][2],InputImage[2][1],InputImage[1][2],InputImage[1][1]};
@(negedge clk);
pixels = {InputImage[2][1],InputImage[2][0],InputImage[1][1],InputImage[1][0]};
@(negedge clk);
pixels = {InputImage[1][2],InputImage[1][1],InputImage[0][2],InputImage[0][1]};
@(negedge clk);
pixels = {InputImage[1][1],InputImage[1][0],InputImage[0][1],InputImage[0][0]};




#250 $finish;
end

always begin
 #5 clk = ~clk;
end


endmodule
