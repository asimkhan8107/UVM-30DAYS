module adder(input clk, reset, 
             input [7:0] in1, in2, 
             output reg [8:0] out
            );
  
  always@(posedge clk, posedge reset)
    begin 
    	if(reset)
          out <= 0;
    	else 	
          out <= in1 + in2;
  	end
endmodule
