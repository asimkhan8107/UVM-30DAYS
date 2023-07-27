class component_b extends uvm_component;
  
  transaction trans;
  uvm_nonblocking_get_port#(transaction) trans_in;  

  `uvm_component_utils(component_b)
  
  // Constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_in = new("trans_in", this);
  endfunction : new
  
  // run_phase 
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    if(trans_in.can_get())
      begin
    `uvm_info(get_type_name(),$sformatf(" Before calling port get method"),UVM_LOW)
        void'(trans_in.try_get(trans));
    `uvm_info(get_type_name(),$sformatf(" After  calling port get method"),UVM_LOW)
    `uvm_info(get_type_name(),$sformatf(" Printing trans, \n %s",trans.sprint()),UVM_LOW)
      end
    else
      begin
        `uvm_info(get_type_name(),$sformatf("No entry, not able to get the trans"),UVM_LOW)
      end
    phase.drop_objection(this);
  endtask : run_phase

endclass : component_b