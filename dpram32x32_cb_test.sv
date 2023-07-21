`timescale 1ns/100fs

`define numAddr 5
`define numOut 32
`define wordDepth 32

module dpram32x32_cb_test;

logic [`numAddr-1:0] A1;
logic [`numAddr-1:0] A2;
logic CEB1,WEB1, OEB1, CSB1, CEB2,WEB2, OEB2, CSB2;
logic [`numOut-1:0] I1,I2;
logic [`numOut-1:0] O1,O2;

dpram32x32_cb RAM_U1(.*);

initial begin
//initialize CEB1 and CEB2
CEB1 = 1'b0;
CEB2 = 1'b0;
OEB1 = 1'b1;
OEB2 = 1'b1;
CSB1 = 1'b1;
CSB2 = 1'b1;
WEB2 = 1'b1;
A2 = 1'b0;

#5

@(posedge CEB1);
//code for SRAM signals
A1 = 5'h0F;
I1 = 32'h7B;
WEB1 = 1'b0;
WEB2 = 1'b0;

@(posedge CEB1);
//code for SRAM signals
A1 = 5'h0A;
I1 = 32'h67;

@(posedge CEB1);
A1 = 5'h0F;
WEB1 = 1'b1;

@(posedge CEB1);
A1 = 5'h0A;
WEB1 = 1'b1;

#30 $finish;
end


always begin
//CEB1 code
#5 CEB1 = ~CEB1; 
end

always begin
//CEB2 code  
#5 CEB2 = ~CEB2;
end


endmodule
