class seqcr extends uvm_sequencer#(seq_item);
  `uvm_component_utils(seqcr)
  
  function new(string name = "seqcr", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
endclass