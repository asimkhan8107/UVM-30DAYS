`include "dma_agent_files.sv"

class dma_agent extends uvm_agent;
  // component instance
  dma_driver 	driver;
  dma_sequencer  sequencer;
  dma_monitor	monitor;
  
  `uvm_component_utils(dma_agent)
  
  // constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // build phase
  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      monitor=dma_monitor::type_id::create("monitor",this);
    // creating driver and sequencer only for active agent
    if(get_is_active() == UVM_ACTIVE)
      begin
        driver = dma_driver::type_id::create("driver",this);
        sequencer = dma_sequencer::type_id::create("sequencer",this);
      end
  endfunction
  
  // connect phase
  function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE)
      begin
        driver.seq_item_port.connect(sequencer.seq_item_export);
      end
  endfunction
endclass