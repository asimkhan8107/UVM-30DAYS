class component_a extends uvm_component;
  transaction trans;
  uvm_nonblocking_put_port#(transaction) trans_out;
  
  `uvm_component_utils(component_a)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_out = new("trans_out", this);
  endfunction
  
  //run phase
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    // creating trans
    trans = transaction::type_id::create("trans",this);
    void'(trans.randomize());
    `uvm_info(get_type_name(),$sformatf("transaction randomized"),UVM_LOW)
    trans_out.put(trans);
    `uvm_info(get_type_name(),$sformatf("printing trans,\n%0s",trans.sprint()),UVM_LOW)
    
    `uvm_info(get_type_name(),$sformatf("before calling port method"),UVM_LOW)
    trans_out.put(trans);
    `uvm_info(get_type_name(),$sformatf("after calling port method"),UVM_LOW)
    phase.drop_objection(this);
  endtask
endclass
    