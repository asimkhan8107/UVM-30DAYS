/*				UVM Sequencer				*/
`include "uvm_macros.svh"
import uvm_pkg::*;

class mem_sequencer extends uvm_sequencer#();
  
  // Utility
  `uvm_sequencer_utils(mem_sequencer)
  
  // Constructor
  function new(string name ,uvm_component parent);
    super.new(name, parent);
  endfunction
endclass