`timescale 1ns/100fs

module CNeuron ( input clk,
    input [31:0] kernel, 
    input [3:0] [7:0] pixels, 
	output logic [7:0] convResult);
 
    logic [7:0] sum;
    

    always_comb 
     begin
		 	sum = 0;
		 	for (int i=0 ; i< 4 ; i++)
				begin
					sum = sum + kernel[i*8 +7 -: 8]*pixels[i];
				end
     end

	
	always_ff @(posedge clk)
		begin
			convResult <= sum;
		end
endmodule
