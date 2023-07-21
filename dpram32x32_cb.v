//////////////////////////////////////////////////////////////////
//                                                              //
// Copyright (c) 2003 Synopsys, Inc.  All Rights Reserved       //
// This information is provided pursuant to a license agreement //
// that grants limited rights of access/use and requires that   //
// the information be treated as confidential.                  //
//                                                              //
//////////////////////////////////////////////////////////////////

//----------------------Revision History--------------------------------------
// 26-Apr-00   1.0   pavlov         Created.
// 21-Jun-00   1.1   pavlov         Enchacments in behavioral part.
// 07-Jul-00   1.2   pmahe          32-bit expression is connected to 1-bit port 
//                                  "numOfPort" of module PCL_NAME_Port instantiation
//                                  + make module name PCL dependant.
// 20-May-02   1.3   HM             D/E:45912 correct output to perform pre-charge
//                                  on output port as Clock works
// 03-Mar-03   1.4   pavlov         Added read/write, write/write conflicts (DE#57575).
//----------------------------------------------------------------------------

`timescale 1ns/100fs


`define numAddr 5          
`define numOut 32 
`define wordDepth 32

`define verbose 3
`ifdef verbose_0
`undef verbose
`define verbose 0
`endif
`ifdef verbose_1
`undef verbose
`define  verbose 1
`endif
`ifdef verbose_2
`undef verbose
`define verbose 2
`endif
`ifdef verbose_3
`undef verbose
`define verbose 3
`endif

`ifdef POLARIS_CBS
`define mintimestep
`else
`define mintimestep #0.01
`endif

`celldefine
module dpram32x32_cb(A1, A2, CEB1, CEB2, WEB1, WEB2, OEB1, OEB2,
                    CSB1, CSB2,
                    I1, I2, O1, O2);

`ifdef nobanner

`else
initial
begin
  $display("     SYNCHRONOUS DUAL PORT RAM VERILOG BEHAVIOURAL MODEL ");
  $display("");
  $display("                  Synopsys Inc.");
  $display(" ");
  $display(" ");
  $display(" Polaris INFO : Reccommending to use with +ieee +defparam +pulse_x/0");
  $display("                +pulse_r/0 +pathpulse +define+verbose_<X> options   ");
  $display("");
  $display(" Error filtering options description :  ");
  $display(" +define+verbose_0 : X transitions filtered; no messages printed    ");
  $display(" +define+verbose_1 : X transitions filtered; error messages printed");
  $display(" +define+verbose_2 : no X transtions filtering; no messages printed");
  $display(" +define+verbose_3 : default : no X filtering; err messages printed ");
  $display("");
  $display(" Add +define+nobanner in order not to display these header messages ");
  $display(" ");
if (`verbose == 0 || `verbose == 1)
begin
  $display(" ");
  $display(" THIS VERBOSE LEVEL MAY PRODUCE MIS-USAGE OF THE MEMORY BECAUSE :   ");
  $display(" - A TIMING ERROR DOES NOT INVALIDATE THE READ/WRITE OPEARTION AND ");
  $display("   MAY KEEP THE ALREADY AVAILABLE DATA.");
  $display(" - TRANSITION TO/FROM HIGH-Z/LOW-Z MAY SHOW DIFFERENT TIMINGS AS");
  $display("   COMPARED TO AN HIGHER VERBOSE LEVEL ");
  $display(" ");
end
end
`endif
input [`numAddr-1:0] A1;
wire [`numAddr-1:0] A1, a_state1;
buf
    (a_state1[4],A1[4]),
    (a_state1[3],A1[3]),
    (a_state1[2],A1[2]),
    (a_state1[1],A1[1]),
    (a_state1[0],A1[0]);
input CEB1,WEB1, OEB1, CSB1;
buf (ck_state1,CEB1);
buf (web_state1,WEB1);
buf (oeb_state1,OEB1);
buf (csb_state1,CSB1);

input [`numOut-1:0] I1;
output [`numOut-1:0] O1;
wire [`numOut-1:0] I1, O1, i_state1, o_state1;
buf
    (i_state1[31],I1[31]),
    (i_state1[30],I1[30]),
    (i_state1[29],I1[29]),
    (i_state1[28],I1[28]),
    (i_state1[27],I1[27]),
    (i_state1[26],I1[26]),
    (i_state1[25],I1[25]),
    (i_state1[24],I1[24]),
    (i_state1[23],I1[23]),
    (i_state1[22],I1[22]),
    (i_state1[21],I1[21]),
    (i_state1[20],I1[20]),
    (i_state1[19],I1[19]),
    (i_state1[18],I1[18]),
    (i_state1[17],I1[17]),
    (i_state1[16],I1[16]),
    (i_state1[15],I1[15]),
    (i_state1[14],I1[14]),
    (i_state1[13],I1[13]),
    (i_state1[12],I1[12]),
    (i_state1[11],I1[11]),
    (i_state1[10],I1[10]),
    (i_state1[9],I1[9]),
    (i_state1[8],I1[8]),
    (i_state1[7],I1[7]),
    (i_state1[6],I1[6]),
    (i_state1[5],I1[5]),
    (i_state1[4],I1[4]),
    (i_state1[3],I1[3]),
    (i_state1[2],I1[2]),
    (i_state1[1],I1[1]),
    (i_state1[0],I1[0]);
bufif1
       (O1[31],o_state1[31],enable1),
       (O1[30],o_state1[30],enable1),
       (O1[29],o_state1[29],enable1),
       (O1[28],o_state1[28],enable1),
       (O1[27],o_state1[27],enable1),
       (O1[26],o_state1[26],enable1),
       (O1[25],o_state1[25],enable1),
       (O1[24],o_state1[24],enable1),
       (O1[23],o_state1[23],enable1),
       (O1[22],o_state1[22],enable1),
       (O1[21],o_state1[21],enable1),
       (O1[20],o_state1[20],enable1),
       (O1[19],o_state1[19],enable1),
       (O1[18],o_state1[18],enable1),
       (O1[17],o_state1[17],enable1),
       (O1[16],o_state1[16],enable1),
       (O1[15],o_state1[15],enable1),
       (O1[14],o_state1[14],enable1),
       (O1[13],o_state1[13],enable1),
       (O1[12],o_state1[12],enable1),
       (O1[11],o_state1[11],enable1),
       (O1[10],o_state1[10],enable1),
       (O1[9],o_state1[9],enable1),
       (O1[8],o_state1[8],enable1),
       (O1[7],o_state1[7],enable1),
       (O1[6],o_state1[6],enable1),
       (O1[5],o_state1[5],enable1),
       (O1[4],o_state1[4],enable1),
       (O1[3],o_state1[3],enable1),
       (O1[2],o_state1[2],enable1),
       (O1[1],o_state1[1],enable1),
       (O1[0],o_state1[0],enable1);
wire blockIsSelected1;
wire enable_sh1;
wire enable_sh_in1;

reg sh_a_error1;
wire sh_a_error_in1;
assign sh_a_error_in1 = sh_a_error1;
reg sh_ck_error1;
wire sh_ck_error_in1;
assign sh_ck_error_in1 = sh_ck_error1;
reg sh_web_error1;
wire sh_web_error_in1;
assign sh_web_error_in1 = sh_web_error1;
reg sh_ba_error1;
wire sh_ba_error_in1;
assign sh_ba_error_in1 = sh_ba_error1;
wire sh_csb_error_in1;
reg sh_csb_error1;
assign sh_csb_error_in1 = sh_csb_error1;
wire sh_i_error_in1;
reg sh_i_error1;
assign sh_i_error_in1 = sh_i_error1;
assign enable_sh1 = ~csb_state1 && blockIsSelected1;
assign enable_sh_in1 = ~csb_state1 && blockIsSelected1 && ~web_state1;
input [`numAddr-1:0] A2;
wire [`numAddr-1:0] A2, a_state2;
buf
    (a_state2[4],A2[4]),
    (a_state2[3],A2[3]),
    (a_state2[2],A2[2]),
    (a_state2[1],A2[1]),
    (a_state2[0],A2[0]);
input CEB2,WEB2, OEB2, CSB2;
buf (ck_state2,CEB2);
buf (web_state2,WEB2);
buf (oeb_state2,OEB2);
buf (csb_state2,CSB2);

input [`numOut-1:0] I2;
output [`numOut-1:0] O2;
wire [`numOut-1:0] I2, O2, i_state2, o_state2;
buf
    (i_state2[31],I2[31]),
    (i_state2[30],I2[30]),
    (i_state2[29],I2[29]),
    (i_state2[28],I2[28]),
    (i_state2[27],I2[27]),
    (i_state2[26],I2[26]),
    (i_state2[25],I2[25]),
    (i_state2[24],I2[24]),
    (i_state2[23],I2[23]),
    (i_state2[22],I2[22]),
    (i_state2[21],I2[21]),
    (i_state2[20],I2[20]),
    (i_state2[19],I2[19]),
    (i_state2[18],I2[18]),
    (i_state2[17],I2[17]),
    (i_state2[16],I2[16]),
    (i_state2[15],I2[15]),
    (i_state2[14],I2[14]),
    (i_state2[13],I2[13]),
    (i_state2[12],I2[12]),
    (i_state2[11],I2[11]),
    (i_state2[10],I2[10]),
    (i_state2[9],I2[9]),
    (i_state2[8],I2[8]),
    (i_state2[7],I2[7]),
    (i_state2[6],I2[6]),
    (i_state2[5],I2[5]),
    (i_state2[4],I2[4]),
    (i_state2[3],I2[3]),
    (i_state2[2],I2[2]),
    (i_state2[1],I2[1]),
    (i_state2[0],I2[0]);
bufif1
       (O2[31],o_state2[31],enable2),
       (O2[30],o_state2[30],enable2),
       (O2[29],o_state2[29],enable2),
       (O2[28],o_state2[28],enable2),
       (O2[27],o_state2[27],enable2),
       (O2[26],o_state2[26],enable2),
       (O2[25],o_state2[25],enable2),
       (O2[24],o_state2[24],enable2),
       (O2[23],o_state2[23],enable2),
       (O2[22],o_state2[22],enable2),
       (O2[21],o_state2[21],enable2),
       (O2[20],o_state2[20],enable2),
       (O2[19],o_state2[19],enable2),
       (O2[18],o_state2[18],enable2),
       (O2[17],o_state2[17],enable2),
       (O2[16],o_state2[16],enable2),
       (O2[15],o_state2[15],enable2),
       (O2[14],o_state2[14],enable2),
       (O2[13],o_state2[13],enable2),
       (O2[12],o_state2[12],enable2),
       (O2[11],o_state2[11],enable2),
       (O2[10],o_state2[10],enable2),
       (O2[9],o_state2[9],enable2),
       (O2[8],o_state2[8],enable2),
       (O2[7],o_state2[7],enable2),
       (O2[6],o_state2[6],enable2),
       (O2[5],o_state2[5],enable2),
       (O2[4],o_state2[4],enable2),
       (O2[3],o_state2[3],enable2),
       (O2[2],o_state2[2],enable2),
       (O2[1],o_state2[1],enable2),
       (O2[0],o_state2[0],enable2);
wire blockIsSelected2;
wire enable_sh2;
wire enable_sh_in2;

reg sh_a_error2;
wire sh_a_error_in2;
assign sh_a_error_in2 = sh_a_error2;
reg sh_ck_error2;
wire sh_ck_error_in2;
assign sh_ck_error_in2 = sh_ck_error2;
reg sh_web_error2;
wire sh_web_error_in2;
assign sh_web_error_in2 = sh_web_error2;
reg sh_ba_error2;
wire sh_ba_error_in2;
assign sh_ba_error_in2 = sh_ba_error2;
wire sh_csb_error_in2;
reg sh_csb_error2;
assign sh_csb_error_in2 = sh_csb_error2;
wire sh_i_error_in2;
reg sh_i_error2;
assign sh_i_error_in2 = sh_i_error2;
assign enable_sh2 = ~csb_state2 && blockIsSelected2;
assign enable_sh_in2 = ~csb_state2 && blockIsSelected2 && ~web_state2;
wire BA1_int = 1'b1;
wire BA2_int = 1'b1;
wire A1eqA2 = ~(|(a_state1 ^ a_state2));
wire rwc = A1eqA2 & !csb_state1 & !csb_state2 & BA1_int & BA2_int;
wire en_read1write2 = rwc & web_state1 & !web_state2;
wire en_write1read2 = rwc & !web_state1 & web_state2;
wire en_write1write2 = rwc & !web_state1 & !web_state2;

reg read1write2, write1read2, write1write2;

dpram32x32_cb_behave dpram32x32_cb_dualram (read1write2, write1read2, 
                    write1write2, a_state1, ck_state1, web_state1, oeb_state1, csb_state1,
                    i_state1, o_state1, 
                    a_state2, ck_state2, web_state2, oeb_state2, csb_state2,
                    i_state2, o_state2, 
                                        enable1, blockIsSelected1, sh_a_error_in1, 
                    sh_web_error_in1,
                    sh_ba_error_in1, sh_ck_error_in1,
                    sh_csb_error_in1, 
                    enable2, blockIsSelected2, sh_a_error_in2, 
                    sh_web_error_in2,
                    sh_ba_error_in2, sh_ck_error_in2,
                    sh_csb_error_in2, 
                    sh_i_error_in1, sh_i_error_in2
                    );

initial
begin
  read1write2 = 1'b0;
  write1read2 = 1'b0;
  write1write2 = 1'b0;
  sh_a_error1    = 1'b0;
  sh_web_error1   = 1'b0;
  sh_ba_error1  = 1'b0;
  sh_ck_error1   = 1'b0;
  sh_csb_error1  = 1'b0;
  sh_i_error1   = 1'b0;
  sh_a_error2    = 1'b0;
  sh_web_error2   = 1'b0;
  sh_ba_error2  = 1'b0;
  sh_ck_error2   = 1'b0;
  sh_csb_error2  = 1'b0;
  sh_i_error2   = 1'b0;
end

`ifdef POLARIS_CBS

`else
always @(posedge sh_a_error1)    sh_a_error1    <= `mintimestep 1'b0;
always @(posedge sh_web_error1)   sh_web_error1   <= `mintimestep 1'b0;
always @(posedge sh_ba_error1)  sh_ba_error1  <= `mintimestep 1'b0;
always @(posedge sh_ck_error1)   sh_ck_error1   <= `mintimestep 1'b0;
always @(posedge sh_csb_error1)  sh_csb_error1  <= `mintimestep 1'b0;
always @(posedge sh_i_error1)   sh_i_error1   <= `mintimestep 1'b0;
always @(posedge read1write2) read1write2 <= 1'b0;
always @(posedge write1read2) write1read2 <= 1'b0;
always @(posedge write1write2) write1write2 <= 1'b0;
always @(posedge sh_a_error2)    sh_a_error2    <= `mintimestep 1'b0;
always @(posedge sh_web_error2)   sh_web_error2   <= `mintimestep 1'b0;
always @(posedge sh_ba_error2)  sh_ba_error2  <= `mintimestep 1'b0;
always @(posedge sh_ck_error2)   sh_ck_error2   <= `mintimestep 1'b0;
always @(posedge sh_csb_error2)  sh_csb_error2  <= `mintimestep 1'b0;
always @(posedge sh_i_error2)   sh_i_error2   <= `mintimestep 1'b0;
always @(posedge read1write2) read1write2 <= 1'b0;
always @(posedge write1read2) write1read2 <= 1'b0;
always @(posedge write1write2) write1write2 <= 1'b0;
`endif

specify
  specparam DF     = 1.0,
            tACC   = 1.46454*DF, // access time
            tOUTU  = 0.988008*DF, // time to output unknown.
            tCYC   = 1.98443*DF,   // cycle time
            tCLP  = 0.357875*DF,  // minimum clock high time.
            tCLA  = 0.2015*DF,  // minimum clock low time.
            tWS    = 0*DF,   // WEB setup time
            tIS    = 0.034125*DF,   // Data setup time
            tWH    = 0.313*DF,    // WEB hold time
            tAS    = 0*DF,    // Address setup time
            tAH    = 0.407*DF,    // Address hold time
            tIH    = 0.349683*DF,    // Data hold time
            tCSS    = 0.296*DF,    // CSB setup time
            tCH    = 0.048*DF,    // CSB hold time
            tRWC   = 0.946242*DF,        // min.time between R&W operations
            tOEZ   = 0.640125*DF,   // OEB disable time
            tOE   = 0.572125*DF,  // OEB enable time
            tWEBZ    = 0.622125*DF,    // WEB disable time
            tWEB    = 0.509125*DF,   // WEB enable time
            PATHPULSE$CEB1$O1 = 0,
            PATHPULSE$CEB2$O2 = 0,
           PATHPULSE$OEB1$O1 = 0,
           PATHPULSE$OEB2$O2 = 0;
   (CEB1 => O1[0]) = (tOUTU,tACC);
   (OEB1 => O1[0]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[1]) = (tOUTU,tACC);
   (OEB1 => O1[1]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[2]) = (tOUTU,tACC);
   (OEB1 => O1[2]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[3]) = (tOUTU,tACC);
   (OEB1 => O1[3]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[4]) = (tOUTU,tACC);
   (OEB1 => O1[4]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[5]) = (tOUTU,tACC);
   (OEB1 => O1[5]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[6]) = (tOUTU,tACC);
   (OEB1 => O1[6]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[7]) = (tOUTU,tACC);
   (OEB1 => O1[7]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[8]) = (tOUTU,tACC);
   (OEB1 => O1[8]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[9]) = (tOUTU,tACC);
   (OEB1 => O1[9]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[10]) = (tOUTU,tACC);
   (OEB1 => O1[10]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[11]) = (tOUTU,tACC);
   (OEB1 => O1[11]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[12]) = (tOUTU,tACC);
   (OEB1 => O1[12]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[13]) = (tOUTU,tACC);
   (OEB1 => O1[13]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[14]) = (tOUTU,tACC);
   (OEB1 => O1[14]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[15]) = (tOUTU,tACC);
   (OEB1 => O1[15]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[16]) = (tOUTU,tACC);
   (OEB1 => O1[16]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[17]) = (tOUTU,tACC);
   (OEB1 => O1[17]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[18]) = (tOUTU,tACC);
   (OEB1 => O1[18]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[19]) = (tOUTU,tACC);
   (OEB1 => O1[19]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[20]) = (tOUTU,tACC);
   (OEB1 => O1[20]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[21]) = (tOUTU,tACC);
   (OEB1 => O1[21]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[22]) = (tOUTU,tACC);
   (OEB1 => O1[22]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[23]) = (tOUTU,tACC);
   (OEB1 => O1[23]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[24]) = (tOUTU,tACC);
   (OEB1 => O1[24]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[25]) = (tOUTU,tACC);
   (OEB1 => O1[25]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[26]) = (tOUTU,tACC);
   (OEB1 => O1[26]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[27]) = (tOUTU,tACC);
   (OEB1 => O1[27]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[28]) = (tOUTU,tACC);
   (OEB1 => O1[28]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[29]) = (tOUTU,tACC);
   (OEB1 => O1[29]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[30]) = (tOUTU,tACC);
   (OEB1 => O1[30]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB1 => O1[31]) = (tOUTU,tACC);
   (OEB1 => O1[31]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[0]) = (tOUTU,tACC);
   (OEB2 => O2[0]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[1]) = (tOUTU,tACC);
   (OEB2 => O2[1]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[2]) = (tOUTU,tACC);
   (OEB2 => O2[2]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[3]) = (tOUTU,tACC);
   (OEB2 => O2[3]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[4]) = (tOUTU,tACC);
   (OEB2 => O2[4]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[5]) = (tOUTU,tACC);
   (OEB2 => O2[5]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[6]) = (tOUTU,tACC);
   (OEB2 => O2[6]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[7]) = (tOUTU,tACC);
   (OEB2 => O2[7]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[8]) = (tOUTU,tACC);
   (OEB2 => O2[8]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[9]) = (tOUTU,tACC);
   (OEB2 => O2[9]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[10]) = (tOUTU,tACC);
   (OEB2 => O2[10]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[11]) = (tOUTU,tACC);
   (OEB2 => O2[11]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[12]) = (tOUTU,tACC);
   (OEB2 => O2[12]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[13]) = (tOUTU,tACC);
   (OEB2 => O2[13]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[14]) = (tOUTU,tACC);
   (OEB2 => O2[14]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[15]) = (tOUTU,tACC);
   (OEB2 => O2[15]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[16]) = (tOUTU,tACC);
   (OEB2 => O2[16]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[17]) = (tOUTU,tACC);
   (OEB2 => O2[17]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[18]) = (tOUTU,tACC);
   (OEB2 => O2[18]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[19]) = (tOUTU,tACC);
   (OEB2 => O2[19]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[20]) = (tOUTU,tACC);
   (OEB2 => O2[20]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[21]) = (tOUTU,tACC);
   (OEB2 => O2[21]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[22]) = (tOUTU,tACC);
   (OEB2 => O2[22]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[23]) = (tOUTU,tACC);
   (OEB2 => O2[23]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[24]) = (tOUTU,tACC);
   (OEB2 => O2[24]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[25]) = (tOUTU,tACC);
   (OEB2 => O2[25]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[26]) = (tOUTU,tACC);
   (OEB2 => O2[26]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[27]) = (tOUTU,tACC);
   (OEB2 => O2[27]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[28]) = (tOUTU,tACC);
   (OEB2 => O2[28]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[29]) = (tOUTU,tACC);
   (OEB2 => O2[29]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[30]) = (tOUTU,tACC);
   (OEB2 => O2[30]) = (0,0,tOEZ,tOE,tOEZ,tOE);
   (CEB2 => O2[31]) = (tOUTU,tACC);
   (OEB2 => O2[31]) = (0,0,tOEZ,tOE,tOEZ,tOE);

  //--------------- Error checks ----------------------------------//
  
  $recovery(negedge CEB1 &&& en_read1write2, negedge CEB2 &&& en_read1write2, tRWC, read1write2);
  $recovery(negedge CEB1 &&& en_write1read2, negedge CEB2 &&& en_write1read2, tRWC, write1read2);
  $recovery(negedge CEB1 &&& en_write1write2, negedge CEB2 &&& en_write1write2, tRWC, write1write2);  
  $recovery(negedge CEB2 &&& en_read1write2, negedge CEB1 &&& en_read1write2, tRWC, read1write2);
  $recovery(negedge CEB2 &&& en_write1read2, negedge CEB1 &&& en_write1read2, tRWC, write1read2);
  $recovery(negedge CEB2 &&& en_write1write2, negedge CEB1 &&& en_write1write2, tRWC, write1write2);
  
  $setup(negedge A1[0],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $setup(posedge A1[0],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, negedge A1[0], tAH, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, posedge A1[0], tAH, sh_a_error1);    
  $setup(negedge A1[1],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $setup(posedge A1[1],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, negedge A1[1], tAH, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, posedge A1[1], tAH, sh_a_error1);    
  $setup(negedge A1[2],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $setup(posedge A1[2],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, negedge A1[2], tAH, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, posedge A1[2], tAH, sh_a_error1);    
  $setup(negedge A1[3],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $setup(posedge A1[3],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, negedge A1[3], tAH, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, posedge A1[3], tAH, sh_a_error1);    
  $setup(negedge A1[4],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $setup(posedge A1[4],negedge CEB1 &&& enable_sh1, tAS, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, negedge A1[4], tAH, sh_a_error1);  
  $hold(negedge CEB1 &&& enable_sh1, posedge A1[4], tAH, sh_a_error1);    
  $setup(negedge CSB1, negedge CEB1 &&& blockIsSelected1, tCSS, sh_csb_error1);  
  $setup(posedge CSB1, negedge CEB1 &&& blockIsSelected1, tCSS, sh_csb_error1);  
  $hold(negedge CEB1 &&& blockIsSelected1, negedge CSB1, tCH, sh_csb_error1);  
  $hold(negedge CEB1 &&& blockIsSelected1, posedge CSB1, tCH, sh_csb_error1); 
  $setup(negedge WEB1, negedge CEB1 &&& enable_sh1, tWS, sh_web_error1);  
  $setup(posedge WEB1, negedge CEB1 &&& enable_sh1, tWS, sh_web_error1);  
  $hold(negedge CEB1 &&& enable_sh1, negedge WEB1, tWH, sh_web_error1);  
  $hold(negedge CEB1 &&& enable_sh1, posedge WEB1, tWH, sh_web_error1);  
  $setup(negedge I1[0], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[0], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[0], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[0], tIH, sh_i_error1);  
  $setup(negedge I1[1], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[1], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[1], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[1], tIH, sh_i_error1);  
  $setup(negedge I1[2], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[2], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[2], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[2], tIH, sh_i_error1);  
  $setup(negedge I1[3], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[3], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[3], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[3], tIH, sh_i_error1);  
  $setup(negedge I1[4], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[4], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[4], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[4], tIH, sh_i_error1);  
  $setup(negedge I1[5], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[5], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[5], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[5], tIH, sh_i_error1);  
  $setup(negedge I1[6], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[6], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[6], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[6], tIH, sh_i_error1);  
  $setup(negedge I1[7], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[7], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[7], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[7], tIH, sh_i_error1);  
  $setup(negedge I1[8], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[8], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[8], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[8], tIH, sh_i_error1);  
  $setup(negedge I1[9], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[9], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[9], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[9], tIH, sh_i_error1);  
  $setup(negedge I1[10], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[10], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[10], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[10], tIH, sh_i_error1);  
  $setup(negedge I1[11], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[11], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[11], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[11], tIH, sh_i_error1);  
  $setup(negedge I1[12], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[12], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[12], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[12], tIH, sh_i_error1);  
  $setup(negedge I1[13], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[13], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[13], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[13], tIH, sh_i_error1);  
  $setup(negedge I1[14], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[14], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[14], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[14], tIH, sh_i_error1);  
  $setup(negedge I1[15], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[15], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[15], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[15], tIH, sh_i_error1);  
  $setup(negedge I1[16], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[16], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[16], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[16], tIH, sh_i_error1);  
  $setup(negedge I1[17], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[17], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[17], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[17], tIH, sh_i_error1);  
  $setup(negedge I1[18], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[18], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[18], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[18], tIH, sh_i_error1);  
  $setup(negedge I1[19], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[19], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[19], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[19], tIH, sh_i_error1);  
  $setup(negedge I1[20], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[20], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[20], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[20], tIH, sh_i_error1);  
  $setup(negedge I1[21], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[21], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[21], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[21], tIH, sh_i_error1);  
  $setup(negedge I1[22], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[22], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[22], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[22], tIH, sh_i_error1);  
  $setup(negedge I1[23], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[23], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[23], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[23], tIH, sh_i_error1);  
  $setup(negedge I1[24], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[24], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[24], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[24], tIH, sh_i_error1);  
  $setup(negedge I1[25], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[25], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[25], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[25], tIH, sh_i_error1);  
  $setup(negedge I1[26], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[26], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[26], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[26], tIH, sh_i_error1);  
  $setup(negedge I1[27], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[27], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[27], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[27], tIH, sh_i_error1);  
  $setup(negedge I1[28], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[28], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[28], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[28], tIH, sh_i_error1);  
  $setup(negedge I1[29], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[29], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[29], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[29], tIH, sh_i_error1);  
  $setup(negedge I1[30], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[30], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[30], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[30], tIH, sh_i_error1);  
  $setup(negedge I1[31], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $setup(posedge I1[31], negedge CEB1 &&& enable_sh_in1, tIS, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, negedge I1[31], tIH, sh_i_error1);  
  $hold(negedge CEB1 &&& enable_sh_in1, posedge I1[31], tIH, sh_i_error1);  
  $setup(negedge A2[0],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $setup(posedge A2[0],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, negedge A2[0], tAH, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, posedge A2[0], tAH, sh_a_error2);    
  $setup(negedge A2[1],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $setup(posedge A2[1],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, negedge A2[1], tAH, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, posedge A2[1], tAH, sh_a_error2);    
  $setup(negedge A2[2],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $setup(posedge A2[2],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, negedge A2[2], tAH, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, posedge A2[2], tAH, sh_a_error2);    
  $setup(negedge A2[3],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $setup(posedge A2[3],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, negedge A2[3], tAH, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, posedge A2[3], tAH, sh_a_error2);    
  $setup(negedge A2[4],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $setup(posedge A2[4],negedge CEB2 &&& enable_sh2, tAS, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, negedge A2[4], tAH, sh_a_error2);  
  $hold(negedge CEB2 &&& enable_sh2, posedge A2[4], tAH, sh_a_error2);    
  $setup(negedge CSB2, negedge CEB2 &&& blockIsSelected2, tCSS, sh_csb_error2);  
  $setup(posedge CSB2, negedge CEB2 &&& blockIsSelected2, tCSS, sh_csb_error2);  
  $hold(negedge CEB2 &&& blockIsSelected2, negedge CSB2, tCH, sh_csb_error2);  
  $hold(negedge CEB2 &&& blockIsSelected2, posedge CSB2, tCH, sh_csb_error2); 
  $setup(negedge WEB2, negedge CEB2 &&& enable_sh2, tWS, sh_web_error2);  
  $setup(posedge WEB2, negedge CEB2 &&& enable_sh2, tWS, sh_web_error2);  
  $hold(negedge CEB2 &&& enable_sh2, negedge WEB2, tWH, sh_web_error2);  
  $hold(negedge CEB2 &&& enable_sh2, posedge WEB2, tWH, sh_web_error2);  
  $setup(negedge I2[0], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[0], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[0], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[0], tIH, sh_i_error2);  
  $setup(negedge I2[1], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[1], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[1], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[1], tIH, sh_i_error2);  
  $setup(negedge I2[2], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[2], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[2], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[2], tIH, sh_i_error2);  
  $setup(negedge I2[3], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[3], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[3], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[3], tIH, sh_i_error2);  
  $setup(negedge I2[4], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[4], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[4], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[4], tIH, sh_i_error2);  
  $setup(negedge I2[5], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[5], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[5], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[5], tIH, sh_i_error2);  
  $setup(negedge I2[6], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[6], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[6], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[6], tIH, sh_i_error2);  
  $setup(negedge I2[7], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[7], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[7], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[7], tIH, sh_i_error2);  
  $setup(negedge I2[8], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[8], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[8], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[8], tIH, sh_i_error2);  
  $setup(negedge I2[9], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[9], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[9], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[9], tIH, sh_i_error2);  
  $setup(negedge I2[10], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[10], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[10], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[10], tIH, sh_i_error2);  
  $setup(negedge I2[11], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[11], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[11], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[11], tIH, sh_i_error2);  
  $setup(negedge I2[12], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[12], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[12], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[12], tIH, sh_i_error2);  
  $setup(negedge I2[13], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[13], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[13], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[13], tIH, sh_i_error2);  
  $setup(negedge I2[14], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[14], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[14], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[14], tIH, sh_i_error2);  
  $setup(negedge I2[15], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[15], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[15], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[15], tIH, sh_i_error2);  
  $setup(negedge I2[16], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[16], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[16], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[16], tIH, sh_i_error2);  
  $setup(negedge I2[17], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[17], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[17], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[17], tIH, sh_i_error2);  
  $setup(negedge I2[18], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[18], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[18], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[18], tIH, sh_i_error2);  
  $setup(negedge I2[19], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[19], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[19], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[19], tIH, sh_i_error2);  
  $setup(negedge I2[20], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[20], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[20], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[20], tIH, sh_i_error2);  
  $setup(negedge I2[21], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[21], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[21], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[21], tIH, sh_i_error2);  
  $setup(negedge I2[22], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[22], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[22], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[22], tIH, sh_i_error2);  
  $setup(negedge I2[23], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[23], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[23], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[23], tIH, sh_i_error2);  
  $setup(negedge I2[24], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[24], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[24], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[24], tIH, sh_i_error2);  
  $setup(negedge I2[25], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[25], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[25], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[25], tIH, sh_i_error2);  
  $setup(negedge I2[26], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[26], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[26], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[26], tIH, sh_i_error2);  
  $setup(negedge I2[27], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[27], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[27], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[27], tIH, sh_i_error2);  
  $setup(negedge I2[28], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[28], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[28], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[28], tIH, sh_i_error2);  
  $setup(negedge I2[29], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[29], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[29], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[29], tIH, sh_i_error2);  
  $setup(negedge I2[30], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[30], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[30], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[30], tIH, sh_i_error2);  
  $setup(negedge I2[31], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $setup(posedge I2[31], negedge CEB2 &&& enable_sh_in2, tIS, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, negedge I2[31], tIH, sh_i_error2);  
  $hold(negedge CEB2 &&& enable_sh_in2, posedge I2[31], tIH, sh_i_error2);  
  $width(posedge CEB1 &&& enable_sh1, tCLP, 0, sh_ck_error1);
  $width(negedge CEB1 &&& enable_sh1, tCLA, 0, sh_ck_error1);

  $period(negedge CEB1 &&& enable_sh1, tCYC, sh_ck_error1);
  $width(posedge CEB2 &&& enable_sh2, tCLP, 0, sh_ck_error2);
  $width(negedge CEB2 &&& enable_sh2, tCLA, 0, sh_ck_error2);

  $period(negedge CEB2 &&& enable_sh2, tCYC, sh_ck_error2);
endspecify

endmodule
`endcelldefine

module dpram32x32_cb_behave(read1write2, write1read2, write1write2, a_state1, ck_state1, web_state1, oeb_state1, csb_state1,
                    i_state1, o_state1,
                    a_state2, ck_state2, web_state2, oeb_state2, csb_state2,
                    i_state2, o_state2,
                                        enable1, blockIsSelected1, sh_a_error_in1,
                    sh_web_error_in1, sh_ba_error_in1, 
                    sh_ck_error_in1,
                    sh_csb_error_in1, 
                    enable2, blockIsSelected2, sh_a_error_in2,
                    sh_web_error_in2, sh_ba_error_in2, 
                    sh_ck_error_in2,
                    sh_csb_error_in2, 
                    sh_i_error_in1, sh_i_error_in2
                    );

  input read1write2, write1read2, write1write2;
  reg    [`numOut-1:0]  memory[`wordDepth-1:0];
  input  [`numAddr-1:0] a_state1, a_state2;
  input  ck_state1, ck_state2, web_state1, web_state2;
  input  oeb_state1, oeb_state2, csb_state1, csb_state2;
  input  [`numOut-1:0] i_state1, i_state2;
  output enable1, enable2;
  output blockIsSelected1, blockIsSelected2;
  input  sh_a_error_in1, sh_a_error_in2, sh_web_error_in1, sh_web_error_in2;
  input  sh_ba_error_in1, sh_ba_error_in2, sh_ck_error_in1, sh_ck_error_in2;
  input  sh_csb_error_in1, sh_csb_error_in2, sh_i_error_in1, sh_i_error_in2;
  output [`numOut-1:0] o_state1, o_state2;
  wire   WE1, CS1, WE2, CS2;
  wire   [`numAddr-1:0] memAddr1, memAddr2;
  wire   [`numOut-1:0] memIn1, memIn2;
  reg    [`numOut-1:0] memOut1, memOut2;
  wire   WriteConflict, int_clk1, int_clk2;
  integer n;
  dpram32x32_cb_Port Port1(a_state1, ck_state1,  
                web_state1, oeb_state1, 
                csb_state1, 
                i_state1, o_state1,
                enable1, blockIsSelected1,  
                sh_a_error_in1,  
                sh_web_error_in1,  
                sh_ba_error_in1,  
                sh_ck_error_in1,  
                sh_csb_error_in1,  
                sh_i_error_in1,  
                WE1, CS1, memAddr1, memIn1, memOut1, 1'b0, int_clk1);
  
  dpram32x32_cb_Port Port2(a_state2, ck_state2,  
                web_state2, oeb_state2, 
                csb_state2, 
                i_state2, o_state2,
                enable2, blockIsSelected2,  
                sh_a_error_in2,  
                sh_web_error_in2,  
                sh_ba_error_in2,  
                sh_ck_error_in2,  
                sh_csb_error_in2,  
                sh_i_error_in2,  
                WE2, CS2, memAddr2, memIn2, memOut2, 1'b1, int_clk2);
                
  task Warning;
    input [1024:1] msg;
    begin
    if (`verbose == 1 || `verbose == 3)
      begin
        $display("%.1f : %m : %0s",$realtime,msg);
      end
    end
  endtask
  always @(WE1 or memAddr1 or memIn1 or posedge int_clk1 or posedge read1write2 or 
           posedge write1read2 or posedge write1write2)
  begin

    if(WE1 === 'b1 && (CS1 === 'b1 || sh_csb_error_in1)) 
    begin
      if(write1write2 == 1'b1)
      begin
        $display("%.2f : Simultaneous write to the same address.\n", $realtime);
        memory[memAddr1] = `numOut'bx;
      end
      else if(^memAddr1 !== 1'bx) memory[memAddr1] = memIn1;
      else for (n=0; n < `wordDepth; n = n + 1) memory[n] = `numOut'bx;
   end

   if(WE1 === 'b0 && CS1 === 'b1) 
   begin
     if(read1write2 == 1'b1 || write1read2 == 1'b1)
     begin
       $display("%.2f : Simultaneous read/write to the same address.\n", $realtime);
       memOut1 = `numOut'bx;
     end
     else memOut1 = memory[memAddr1];
   end
  end
  always @(WE2 or memAddr2 or memIn2 or posedge int_clk2 or posedge read1write2 or 
           posedge write1read2 or posedge write1write2)
  begin

    if(WE2 === 'b1 && (CS2 === 'b1 || sh_csb_error_in2)) 
    begin
      if(write1write2 == 1'b1)
      begin
        $display("%.2f : Simultaneous write to the same address.\n", $realtime);
        memory[memAddr2] = `numOut'bx;
      end
      else if(^memAddr2 !== 1'bx) memory[memAddr2] = memIn2;
      else for (n=0; n < `wordDepth; n = n + 1) memory[n] = `numOut'bx;
   end

   if(WE2 === 'b0 && CS2 === 'b1) 
   begin
     if(read1write2 == 1'b1 || write1read2 == 1'b1)
     begin
       $display("%.2f : Simultaneous read/write to the same address.\n", $realtime);
       memOut2 = `numOut'bx;
     end
     else memOut2 = memory[memAddr2];
   end
  end
  and(WriteConflict, WE1, WE2, CS1, CS2);
  always @(WriteConflict)
  begin
    if(WriteConflict === 'b1 && memAddr1 === memAddr2)
    begin
     Warning("Write/Write conflict. Writing X.");
     memory[memAddr1] = `mintimestep `numOut'bx;
    end
  end
endmodule
module dpram32x32_cb_Port(a_state, ck_state,  
               web_state, oeb_state, 
               csb_state, 
               i_state,  o_state,
               ena_state,  blockIsSelected,  
               sh_a_error,  
               sh_web_error,  
               sh_ba_error,  
               sh_ck_error,  
               sh_csb_error,  
               sh_i_error,  
               WE, CS, memoryAddr, memoryIn, memoryOut, numOfPort, int_clk);
  
  reg [`numOut-1:0] int_bus;
  input [`numAddr-1:0] a_state;
  wire [`numAddr-1:0] a_state;
  output ena_state;
  reg enable;
  assign ena_state = enable;
  reg int_enable;
  input ck_state, web_state, oeb_state, csb_state, numOfPort;
  input [`numOut-1:0] i_state;
  output [`numOut-1:0] o_state;
  wire [`numOut-1:0] o_state, i_state;
  assign o_state = int_bus;
  output blockIsSelected;
  reg blockIsSel;
  assign blockIsSelected = blockIsSel;
  reg csb_del;
  integer address;
  integer n;
  wire u_error, no_sh_error;
  reg ih_error;
  reg wenb_error;
  input sh_ck_error;
  input sh_a_error;
  input sh_web_error;
  input sh_ba_error;
  input sh_csb_error;
  input sh_i_error;
  output [`numOut-1:0] memoryIn;
  reg [`numOut-1:0] memoryIn;
  output [`numAddr-1:0] memoryAddr;
  reg [`numAddr-1:0] memoryAddr;
  output WE, CS, int_clk;
  reg WE, CS, int_clk;
  input [`numOut-1:0] memoryOut;
  event memoryError;
  nor(no_sh_error, sh_a_error,  
                 sh_web_error,
                  sh_ck_error,  
                 sh_csb_error,  
                  sh_i_error);
  initial
  begin : initialize
    ih_error = 0;
    wenb_error = 0;
    enable = 1'bx;
    int_enable = 1'bx;
    blockIsSel = 1'b1;
    WE ='b0;
    CS = 'b0;
    int_clk = 'b0;
  end
  always @(WE) if(WE === 'b1) WE = `mintimestep 'b0;
  always @(int_clk) if(int_clk === 'b1) int_clk = `mintimestep 'b0;
  always @(memoryError)
  begin
    if ((`verbose == 2 || `verbose == 3) && (web_state !== 1'b1 || sh_web_error))
    begin
      ih_error = 0;
      if (^a_state === 1'bx || ^a_state === 1'bz || sh_a_error || sh_ck_error)
      begin
        wenb_error = 0;
        WE = 'b1;
        memoryAddr = `numOut'bx;
      end
      else
      begin
         memoryAddr = address;
         memoryIn = `numOut'bx;
         WE = 'b1;
      end
      if(web_state === 1'bx) int_bus = `numOut'bx;
    end
    if((`verbose == 2 || `verbose == 3) && (web_state === 1'b1))
    begin
     int_bus = `numOut'bx;
    end
  end

  task Warning;
    input [1024:1] msg;
    begin
    if ((`verbose == 1 || `verbose == 3) && csb_state !== 1'b1 && 
         blockIsSel !== 1'b0)
      begin
        $display("%.1f : %m : %0s",$realtime,msg);
      end
    end
  endtask

//----------------------------- look if block is selected ------------------


  always @(blockIsSel or oeb_state or ck_state or csb_state)
  begin : gen_enable
    if ((oeb_state === 1'bx || oeb_state === 1'bz) && 
         web_state !== 1'b0 && blockIsSel !== 1'b0)  
    begin
      if(numOfPort === 'b0)
        Warning("OEB1 is unknown.");
      else
        Warning("OEB2 is unknown.");
    end
    if ((ck_state === 1'bx || ck_state === 1'bz) && 
         blockIsSel !== 1'b0 && web_state !== 1'b0 && oeb_state !== 1'b1)
    begin
      int_enable = 1'bx;
    end
    else
    begin
      int_enable = blockIsSel & ~oeb_state;
      CS = blockIsSel & ~csb_state;
    end
  end

//--------------------------- In-Active clock edge -------------------------
/*  always @(posedge ck_state)
  begin : check_ck_unk
    if ((ck_state === 1'bx || ck_state === 1'bz) && 
         blockIsSel === 1'b1 && csb_state === 1'b0)
    begin
      if(numOfPort === 'b0)
        Warning("CEB1 is unknown.");
      else
        Warning("CEB2 is unknown.");
    ->  memoryError;
    end
  end
*/
  always @(csb_state) `mintimestep csb_del = csb_state;

//--------------------------- Active clock edge ---------------------------
  always @(negedge ck_state) //ck_delayed if notovi
  begin : ck_active_edge  
    if ((web_state === 1'bx || web_state === 1'bz) && 
         blockIsSel === 1'b1 && oeb_state === 1'b1)
    begin
      if(numOfPort === 'b0)
        Warning("WEB1 is unknown.");
      else
        Warning("WEB2 is unknown.");
      ->  memoryError;
    end
    if ((ck_state === 1'bx || ck_state === 1'bz) && 
         blockIsSel === 1'b1 && csb_state === 1'b0)
    begin
      if(numOfPort === 'b0)
        Warning("CEB1 is unknown.");
      else
        Warning("CEB2 is unknown.");
      ->  memoryError;
    end
    if ((csb_state === 1'bx || csb_state === 1'bz) && ((web_state === 1'b1))) 
    begin
      if(numOfPort === 'b0)
        Warning("CSB1 is unknown.");
      else
        Warning("CSB2 is unknown.");
      ->  memoryError;
    end
    if (a_state >= `wordDepth)
    begin
      if(numOfPort === 'b0)
        Warning("Address1 is out of range - cannot access memory.");
      else
        Warning("Address2 is out of range - cannot access memory.");
    end
    if (^a_state === 1'bx || ^a_state === 1'bz)
    begin
      if(numOfPort === 'b0)
        Warning("Address1 is unknown - cannot access memory.");
      else
        Warning("Address2 is unknown - cannot access memory.");
      ->  memoryError;
      if (`verbose == 2 || `verbose == 3)
      begin
        address = -1;
      end
    end
    else  address = a_state;
    if (blockIsSel === 1'b1 && csb_del === 1'b0)
    begin
      if (web_state === 1'b0) //-------- Write
      begin
        if (^i_state === 1'bx || ^i_state === 1'bz)
        begin
          Warning("Data Input unknown during write");
        end
        if(no_sh_error)
        begin
          memoryAddr = address;
          memoryIn = i_state;
          int_bus = i_state;
          WE = 'b1;
        end
        else
        begin
          memoryAddr = address;
          memoryIn = `numOut'bx;
          WE = 'b1;
          if(sh_i_error) int_bus = `numOut'bx;
          else int_bus = i_state;
        end
      end
      else if (web_state === 1'b1 && no_sh_error) //-------- READ
      begin
        int_bus = 32'b11111111111111111111111111111111;
        memoryAddr = address;
        WE = 'b0;
        int_clk = 'b1;
        #0.988008;
        `mintimestep;
        if(no_sh_error) int_bus = memoryOut;
      end
      else
      begin
        if(numOfPort === 'b0)
          Warning("WEB1 is unknown.");
        else
          Warning("WEB2 is unknown.");
        if (`verbose == 2 || `verbose == 3)
        begin
          int_bus = `numOut'bx;
        end
        -> memoryError;
      end
    end
  end

  always @(int_enable)
  begin : output_data_en
    if (`verbose == 2 || `verbose == 3)
    begin
      enable = int_enable;
    end
    else
    begin
      if (int_enable !== 1'b0) enable = 1'b1;
      else                     enable = int_enable;
    end
  end

`ifdef POLARIS_CBS

`else
  always @(posedge sh_ck_error or posedge sh_csb_error)
  begin : setup_ck_error
    if (web_state !== 1'b0 && (`verbose == 2 || `verbose == 3)) 
    begin
      int_bus = `numOut'bx;
    end
    ->  memoryError;
  end
  
  always @(posedge sh_a_error)
  begin : setup_a_error
    ->  memoryError;
  end
  
  always @(posedge sh_ba_error)
  begin : setup_ba_error
    ->  memoryError;
  end

  always @(posedge sh_web_error)
  begin : setup_h1_error
    ih_error = 1;
    if (`verbose == 2 || `verbose == 3)
    begin
      int_bus = `numOut'bx;
    end
    ->  memoryError;
  end

  always @(posedge sh_i_error)
  begin : setup_ih_error
    ih_error = 1;
    ->  memoryError;
  end

`endif

endmodule

`undef numAddr
`undef numOut
`undef wordDepth
`undef verbose
`undef mintimestep
