`include "transaction.sv"
`include "component_a.sv"
`include "component_b.sv"

class basic_test extends uvm_test;
  `uvm_component_utils(basic_test)
  
  // Components Instantiation
  component_a cmp_a;
  component_b cmp_b;
  
  // constructor 
  function new(string name = "basic_test",uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  // build phase
  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    cmp_a = component_a::type_id::create("cmp_a", this);
    cmp_b = component_b::type_id::create("cmp_b", this);
  endfunction: build_phase
  
  // end of eloboration phase 
  virtual function void end_of_elaboration();
    // print's the topology
    print();
  endfunction
endclass: basic_test