`include "environment.sv"

class basic_test extends uvm_test;
  `uvm_component_utils(basic_test)
  // environment instance
  environment env;
  
  // Constructor
  function new(string name = "basic_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  // build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Create env
    env = environment::type_id::create("env", this);
  endfunction : build_phase
  
  // end_of_elaboration phase
  virtual function void end_of_elaboration();
    // print the topology
    print();
  endfunction : end_of_elaboration
endclass