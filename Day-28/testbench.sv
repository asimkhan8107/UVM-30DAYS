/*						Register Model with RAL							*/
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "dma_interface.sv"
`include "dma_test.sv"

module tbench_top;

  //clock and reset signal declaration
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
 
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  //interface instance
  dma_if intf(clk,reset);
  
  //DUT instance
  DMA DUT (
    .clk(intf.clk),
    .reset(intf.reset),
    .addr(intf.addr),
    .wr_en(intf.wr_en),
    .valid(intf.valid),
    .wdata(intf.wdata),
    .rdata(intf.rdata)
   );
  
  //passing the interface handle to lower heirarchy using set method 
  initial begin 
    uvm_config_db#(virtual dma_if)::set(uvm_root::get(),"*","vif",intf);
    //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  //calling test
  initial begin 
    run_test();
  end
  
endmodule