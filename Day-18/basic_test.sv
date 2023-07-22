class basic_test extends uvm_test;
  // environment instance
  environment env;
  
  `uvm_component_utils(basic_test)
  
  // Constructor
  function new(string name = "basic_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  // build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // env creation
    env = environment::type_id::create("env", this);
  endfunction
endclass