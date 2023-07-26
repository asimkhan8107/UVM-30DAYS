`include "environment.sv"
class basic_test extends uvm_test;
  `uvm_component_utils(basic_test)
  
  // env instance
  environment env;
  
  // constructor
  function new(string name = "basic_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  // build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //craete env
    env = environment::type_id::create("env", this);
  endfunction
  
  // end of elaboration phase
  virtual function void end_of_elaboration();
    // print topology
    print();
  endfunction
endclass
