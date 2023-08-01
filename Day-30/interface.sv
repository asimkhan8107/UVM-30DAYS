interface vif(input logic clk,reset);
	logic d;
	logic q;
	logic qb;
	
  	// modport dut
  	modport dut(input clk,reset,d, output q,qb);
  
  	// modport testbench
	modport tb(input clk,reset,clocking cb);
	
    // clocking block  
    clocking cb@(posedge clk);
      default input #2 output #1;
      output d;
      input q;
      input qb;
	endclocking
endinterface