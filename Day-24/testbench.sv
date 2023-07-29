/*						TLM Analysis FIFO						*/
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "basic_test.sv"

module tlm_ex;
  initial
    begin
      run_test("basic_test");
    end
endmodule