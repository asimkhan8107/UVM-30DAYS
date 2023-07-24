class component_a extends uvm_component;
  `uvm_component_utils(component_a)
  // event and transaction instance
  uvm_event ev;
  transaction trans;
  
  // constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // run phase
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    #50
    trans = transaction::type_id::create("trans", this);
    
    trans.randomize();
    `uvm_info(get_type_name(), $sformatf("randomized trans, \n%0s",trans.sprint()),UVM_LOW)
    
    // event creation
    ev = uvm_event_pool::get_global("ev_ab");
    
    `uvm_info(get_type_name(), $sformatf("Before Triggering the event"),UVM_LOW)
    ev.trigger(trans);
    `uvm_info(get_type_name(), $sformatf("After Triggering the event"),UVM_LOW)
    phase.drop_objection(this);
  endtask: run_phase
endclass
    
  