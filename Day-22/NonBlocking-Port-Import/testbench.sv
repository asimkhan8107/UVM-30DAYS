/*						Non Blocking Port-> Import					*/
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "basic_test.sv"
module tlm_ex;
  // calling testcase
  initial
    begin
      run_test("basic_test");
    end
endmodule