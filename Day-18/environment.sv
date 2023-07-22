class environment extends uvm_env;
  driver driv;
  
  `uvm_component_utils(environment)
  // Constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // driv creation
    driv = driver::type_id::create("driv",this);
  endfunction
  endclass