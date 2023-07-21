`timescale 1ns/100fs

module Pooling ( input clk, En,
    input [7:0]  convResult, 
	output logic [3:0][7:0] pooledPixels);
 
    integer i;
    logic [2:0] [7:0] convolution;
    logic [3:0] [7:0] pooledReg;

	always_ff @(posedge clk)
	  begin
		     convolution[2] <= convResult;
			 convolution[1] <= convolution[2];
			 convolution[0] <= convolution[1];

			  
          end

	always_ff @(negedge clk)
         begin
         if (En == 1'b1)
          begin
				pooledReg[0] <= ($signed(convolution[0]) > 2) ? 8'h01 : 8'hff;
				pooledReg[1] <= ($signed(convolution[1]) > 2) ? 8'h01 : 8'hff;
				pooledReg[2] <= ($signed(convolution[2]) > 2) ? 8'h01 : 8'hff;
				pooledReg[3] <= ($signed(convResult) > 2) ? 8'h01 : 8'hff;

		  end
	 end
     
     assign pooledPixels = pooledReg;
endmodule
