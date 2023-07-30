/*			Register Access Without RAL Model           */
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "dma_sfr_defines.sv"
`include "dma_interface.sv"
`include "dma_tests.sv"

module testbench;
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
  
  initial
    begin
      reset = 1;
      #5 reset = 0;
    end
  
  // interface instance
  dma_if intf(clk,reset);
  
  // DUT instance
  DMA dut (.clk(intf.clk),
           .reset(intf.reset),
           .addr(intf.addr),
           .wr_en(intf.wr_en),
           .valid(intf.valid),
           .wdata(intf.wdata),
           .rdata(intf.rdata)
          );
  
  // passing the interface handle to lower heirarchy using set method
  initial
    begin
      uvm_config_db#(virtual dma_if)::set(uvm_root::get(),"*","vif",intf);
    end  
  // calling test
  initial
    begin
    	run_test();
    end
      
  // wave dump
//   initial
//     begin
//       $dumpfile("dump.vcd");
//       $dumpvar;
//     end
    
endmodule
      
  