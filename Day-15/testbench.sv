/*				UVM Testbench TOp 			*/
`include"uvm_macros.svh"
import uvm_pkg::*;

`include "mem_interface.sv"
`include "mem_base_test.sv"
`include "mem_wr_rd_test.sv"

module testbench_top;

  bit clk;
  bit reset;
  
  //clock generation
  always #5 clk = ~clk;
  
  //reset Generation
  initial begin
    reset = 1;
    #5 reset =0;
  end

  //interface instance
  mem_if intf(clk,reset);
  
  //DUT instance
  memory DUT (
    .clk(intf.clk),
    .reset(intf.reset),
    .addr(intf.addr),
    .wr_en(intf.wr_en),
    .rd_en(intf.rd_en),
    .wdata(intf.wdata),
    .rdata(intf.rdata)
   );
  
  
  //passing the interface handle to lower heirarchy using set method 
  initial
    begin 
    uvm_config_db#(virtual mem_if)::set(uvm_root::get(),"*","vif",intf);
    //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  
  //calling test
  initial begin 
    run_test();
  end
  
endmodule