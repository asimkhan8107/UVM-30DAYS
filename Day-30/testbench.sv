/*				D Flip Flop Testbench						*/ 
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "package.sv"

module testbench;
	bit clk,reset;
	always #2 clk = ~clk;
	initial
      begin
		reset = 1;
		#5;
		reset = 0;
	  end
  	  // virtual interface
	  vif inter(clk,reset);
		
      // dut instance
  	  dff dut(inter);
	  
      initial
      begin
		uvm_config_db#(virtual vif)::set(null,"*","interface",inter);
 	    $dumpfile("dump.vcd");
	    $dumpvars;
	  end
      
      initial
      begin
		run_test("test");
	  end
endmodule