/*			UVM HeartBeat			*/
`include "uvm_macros.svh"
import uvm_pkg::*;

uvm_callbacks_objection obje;
`include "basic_test.sv"

module uvm_heartbeat_tb;
  // calling testcase
  initial
    begin
      obje = new("obje");
      run_test("basic_test");
    end
endmodule
  