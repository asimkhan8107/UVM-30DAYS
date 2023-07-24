/*				UVM Event Callback				*/
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "basic_test.sv"

module tlm_tb;
  initial
    begin
      run_test("basic_test");
    end
endmodule