/*				UVM event wait_trigger_data		*/
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "basic_test.sv"

module tlm_tb;
  // calling testcase
  initial
    begin
      run_test("basic_test");
    end
endmodule