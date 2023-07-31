/*						Adder verification						*/
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "base_test.sv"

module tb_top;
  bit clk;
  bit reset;
  always #2 clk = ~clk;
  
  initial begin
    //clk = 0;
    reset = 1;
    #5; 
    reset = 0;
  end
  add_if vif(clk, reset);
  
  adder DUT(.clk(vif.clk),.reset(vif.reset),.in1(vif.ip1),.in2(vif.ip2),.out(vif.out));
  
  initial begin
    // set interface in config_db
    uvm_config_db#(virtual add_if)::set(uvm_root::get(), "*", "vif", vif);
    
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  initial begin
    run_test("base_test");
  end
endmodule