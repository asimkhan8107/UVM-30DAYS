class sub_component_b_a extends uvm_component;
  transaction trans;
  uvm_blocking_put_imp#(transaction, sub_component_b_a) trans_in;
  
  `uvm_component_utils(sub_component_b_a);
  
  // constructor
  function new(string name, uvm_component parent);
  super.new(name, parent);
    trans_in = new("trans_in",this);
  endfunction
  
  // Imp port put method
   virtual task put(transaction trans);
   
    `uvm_info(get_type_name(),$sformatf("Received trans on IMP port"),UVM_LOW)
    `uvm_info(get_type_name(),$sformatf("printing trans,\n%0s",trans.sprint()),UVM_LOW)
    
  endtask
endclass