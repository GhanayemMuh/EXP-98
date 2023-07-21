//KMEM1 for kernels - one unit
//KMEM2 for weights - 2 units with same IOs
//As port both do same thing or one is idle, the can get same control signals
//KMEM1 - signals for kernel mem, KMEM2 signals for weights mem
// no of cycles in each state is determined externally
`timescale 1ns/100fs

`define numAddr 5

module NeuralNet_cont (     
	input clk, rst, learn, classify,     
    output logic [`numAddr-1:0] KMEM_ADD1, 
    output logic [`numAddr-1:0] KMEM_ADD2, 
    output logic [`numAddr-1:0] WMEM_ADD1, 
    output logic [`numAddr-1:0] WMEM_ADD2, 
	output logic KMEM_WEB1, KMEM_OEB1, KMEM_CSB1, 
	output logic KMEM_WEB2, KMEM_OEB2, KMEM_CSB2, 
	output logic WMEM_WEB1, WMEM_OEB1, WMEM_CSB1, 
	output logic WMEM_WEB2, WMEM_OEB2, WMEM_CSB2,    
                     output logic En
); 

typedef enum bit[1:0] {Idle_st = 2'b00, Learn_st = 2'b01, Classify_st = 2'b10} STATE; 
STATE CUR_ST; 
STATE NEXT_ST; 
logic [1:0] RCI, RCO ,WCI, WCO;

always_ff @(posedge clk or posedge rst)   
begin    
	if (rst == 1) begin 
		CUR_ST <= Idle_st;    
        RCO <= 2'b0;
        WCO <= 2'b0;
	end
	else begin        
		CUR_ST <= NEXT_ST;   
        RCO <= RCI;
        WCO <= WCI;
	end  
end  

always_comb   
begin     
//fixed default values
    KMEM_OEB1 = 1'b0; KMEM_CSB1 = 1'b0; 
    KMEM_OEB2 = 1'b0; KMEM_CSB2 = 1'b0; 
    WMEM_OEB1 = 1'b0; WMEM_CSB1 = 1'b0; 
    WMEM_OEB2 = 1'b0; WMEM_CSB2 = 1'b0; 
//default values
    KMEM_WEB1 = 1'b1; 
    KMEM_WEB2 = 1'b1;
    KMEM_ADD1 = 5'b0; 
    KMEM_ADD2 = 5'b0; 
    WMEM_WEB1 = 1'b1; 
    WMEM_WEB2 = 1'b1;
    WMEM_ADD1 = 5'b0; 
    WMEM_ADD2 = 5'b0; 
    RCI = 2'b0;
    WCI = 2'b0;
    NEXT_ST = Idle_st;


    case(CUR_ST)       	
	 Idle_st:             
	 begin              
         RCI = 2'b0;
         WCI = 2'b0;
// default - remain in current state :
         NEXT_ST = Idle_st;

         if (learn == 1'b1)
            begin
                NEXT_ST = Learn_st;
            end
            else if (classify == 1'b1)
            begin
                NEXT_ST = Classify_st;
            end
            else
                NEXT_ST = Idle_st;
	 end     

	 Learn_st:          
	 begin
          // K writes to one port 2 cycles
          // It will write for 2 more cycles because of W but to different addresses
          // We do it this way to avoid the need for another state
          KMEM_WEB1 = 1'b0;
          KMEM_WEB2 = 1'b1;
          KMEM_ADD1 = {3'b000,WCO};
          KMEM_ADD2 = {3'b000,WCO}; //set so not unknown but not needed
          // W writes to 2 ports 2 cycles
          WMEM_WEB1 = 1'b0;
          WMEM_WEB2 = 1'b0;
          WMEM_ADD1 = {3'b000,WCO*2};
          WMEM_ADD2 = {3'b000,WCO*2 + 1};
          // default - remain in current state :
          NEXT_ST = Learn_st;
          if (learn == 1'b1)
            begin
                NEXT_ST = Learn_st;
                WCI = WCO + 1;
            end
            else if (classify == 1'b1)
            begin
                NEXT_ST = Classify_st;
                WCI = 2'b0 ;
            end
            else
            begin
                NEXT_ST = Idle_st;
                WCI = 2'b0 ;
            end
	 end

	 Classify_st:
	 begin
	    // read from both ports 
	    // both kernels read and should remain constant - how ? we remain in this state 4 cycles
	    KMEM_WEB1 = 1'b1;
	    KMEM_WEB2 = 1'b1;
		    //KMEM_ADD1 = count_out;
		    //KMEM_ADD2 = count_out+1;
	    // Not elegant but should solve problem
	    KMEM_ADD1 = 5'b0;
	    KMEM_ADD2 = 5'b1;
	    //read from one port - repeat for 4 cycles
	    WMEM_WEB1 = 1'b1;
	    WMEM_WEB2 = 1'b1;  //not necessary
	    WMEM_ADD1 = {3'b000,RCO};
	    WMEM_ADD2 = {3'b000,RCO};  //not necessary
	    // default - remain in current state :
	    NEXT_ST = Classify_st;
	      RCI = RCO + 1;
	    En = (RCO == 1'b0) ? 1 : 0;
				  
	    if (learn == 1'b1)
	      begin
				  NEXT_ST = Learn_st;
				  RCI = 2'b00;
	      end
	    
	      
	    
	    else if (learn == 1'b0 && classify == 1'b0)
	      begin
		NEXT_ST = Idle_st;
		RCI = 2'b00;
	      end
	 end

	endcase
end

 
endmodule
