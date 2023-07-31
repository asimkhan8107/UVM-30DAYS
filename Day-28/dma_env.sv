`include "dma_reg.sv"
`include "dma_reg_sequence.sv"
`include "dma_agent.sv"
`include "dma_adapter.sv"

class dma_model_env extends uvm_env;
  
  // agent instance
  dma_agent      dma_agnt;
  
  // Reg Model and Adapter instance
  dma_reg_model  regmodel;   
  dma_adapter    m_adapter;
  
  `uvm_component_utils(dma_model_env)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build_phase 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_agnt = dma_agent::type_id::create("dma_agnt", this);
    
    // Register model and adapter creation
    regmodel = dma_reg_model::type_id::create("regmodel", this);
    regmodel.build();
    m_adapter = dma_adapter::type_id::create("m_adapter",, get_full_name());
  endfunction : build_phase
  
  // connect_phase
  function void connect_phase(uvm_phase phase);
     
    regmodel.default_map.set_sequencer( .sequencer(dma_agnt.sequencer), .adapter(m_adapter) );
    regmodel.default_map.set_base_addr('h400);        
  endfunction

endclass