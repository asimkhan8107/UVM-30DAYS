/*			i			UVM Event Pool				*/
`include"uvm_macros.svh"
import uvm_pkg::*;

`include "basic_test.sv"

module TLM_tb;
  // calling testcase
  initial
    begin
      run_test("basic_test");
    end
endmodule