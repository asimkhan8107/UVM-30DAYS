class component_a extends uvm_component;
  transaction trans;
  uvm_analysis_port#(transaction) analysis_port;
  
  `uvm_component_utils(component_a)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_port = new("analysis_port", this);
  endfunction
  
  //run phase
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    // creating trans
    trans = transaction::type_id::create("trans",this);
    void'(trans.randomize());
    `uvm_info(get_type_name(),$sformatf("transaction randomized"),UVM_LOW)
    `uvm_info(get_type_name(),$sformatf("printing trans,\n%0s",trans.sprint()),UVM_LOW)
    `uvm_info(get_type_name(),$sformatf("before callling port write method"),UVM_LOW)
    analysis_port.write(trans);
    `uvm_info(get_type_name(),$sformatf("after callling port write method"),UVM_LOW)
    
    phase.drop_objection(this);
  endtask
endclass
    