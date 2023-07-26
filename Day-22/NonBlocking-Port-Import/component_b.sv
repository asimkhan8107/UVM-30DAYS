class component_b extends uvm_component;
  transaction trans;
  uvm_nonblocking_put_imp#(transaction,component_b) trans_in;
  
  `uvm_component_utils(component_b)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_in = new("trans_in", this);
  endfunction
  
  //imp port try_put method
  virtual task put(transaction trans);
   
    `uvm_info(get_type_name(),$sformatf("Inside try_put method"),UVM_LOW)
    `uvm_info(get_type_name(),$sformatf("Received trans on IMP port"),UVM_LOW)
    `uvm_info(get_type_name(),$sformatf("printing trans,\n%0s",trans.sprint()),UVM_LOW)
    
  endtask
endclass
    