class component_b extends uvm_component;
  `uvm_component_utils(component_b)
  uvm_event ev;
  
  // Construction
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // run phase
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    // ev craetion
    ev = uvm_event_pool::get_global("ev_ab");
    `uvm_info(get_type_name(), $sformatf("waiting for the event trigger"),UVM_LOW)
    ev.wait_trigger();
    `uvm_info(get_type_name(), $sformatf("event got triggered"),UVM_LOW)
    phase.drop_objection(this);
  endtask:run_phase
endclass