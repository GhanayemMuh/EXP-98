`timescale 1ns/100fs

module FCNeuron ( input clk,
    input [7:0][7:0] pooledPixelArray, 
    input [63:0] weight, 
	output logic [7:0] result);
 
    logic [7:0] sum;
    integer i;

    always_comb 
     begin
			sum = pooledPixelArray[0]*weight[7:0]   + 
					pooledPixelArray[1]*weight[15:8]  +
					pooledPixelArray[2]*weight[23:16] +
					pooledPixelArray[3]*weight[31:24] +
					pooledPixelArray[4]*weight[39:32] +
					pooledPixelArray[5]*weight[47:40] +
					pooledPixelArray[6]*weight[55:48] +
					pooledPixelArray[7]*weight[63:56];
     end

    always_ff @(posedge clk)
	begin
          result <= sum;
	end
endmodule
