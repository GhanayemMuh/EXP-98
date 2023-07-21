`timescale 1ns/100fs

module cneuron_test;

logic clk;
logic [3:0] [7:0] pixels;
logic [7:0] convResult;
logic [31:0] kernel; 

CNeuron I_CNeuron(.clk(clk), .kernel(kernel), .pixels(pixels), .convResult(convResult));

initial begin
clk = 1'b0 ;
@(negedge clk); kernel = 32'hfb0505fb;
@(negedge clk); pixels = {8'h01,8'hff,8'hff,8'h01};
@(negedge clk); pixels = {8'hff,8'h01,8'h01,8'hff};
@(negedge clk); pixels = {8'h01,8'h01,8'h01,8'h01};
@(negedge clk); pixels = {8'hff,8'hff,8'hff,8'hff};

@(negedge clk); kernel = 32'h05fbfb05;
@(negedge clk); pixels = {8'h01,8'hff,8'hff,8'h01};
@(negedge clk); pixels = {8'hff,8'h01,8'h01,8'hff};
@(negedge clk); pixels = {8'h01,8'h01,8'h01,8'h01};
@(negedge clk); pixels = {8'hff,8'hff,8'hff,8'hff};


// Set remaining values for kernel and pixels

#100 $finish; 
end


always begin 
#5 clk = ~clk; 
end


endmodule
