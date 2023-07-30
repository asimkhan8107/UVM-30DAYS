`include "dma_agent.sv"
class dma_model_env extends uvm_env;
  // agent and scoreboard instance
  dma_agent dma_agnt;
  
  `uvm_component_utils(dma_model_env)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_agnt = dma_agent::type_id::create("dma_agnt", this);
  endfunction
endclass