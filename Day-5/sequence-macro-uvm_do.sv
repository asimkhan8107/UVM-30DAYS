/*			`uvm_do 		*/
`include "uvm_macros.svh"
import uvm_pkg::*;

class mem_sequence extends uvm_sequence#();
  `uvm_object_utils(mem_sequence)
  
  function new(string name = "mem_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do(req)
  endtask
endclass