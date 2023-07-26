`include "transaction.sv"
`include "component_a.sv"
`include "component_b.sv"

class environment extends uvm_env;
  // component instantiation
  component_a comp_a;
  component_b comp_b;
  
  `uvm_component_utils(environment)
  
  // constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // component instance creation
    comp_a = component_a::type_id::create("comp_a",this);
    comp_b = component_b::type_id::create("comp_b",this);
  endfunction
  
  // connect phase
  function void connect_phase(uvm_phase phase);
    comp_a.trans_out.connect(comp_b.trans_in);
  endfunction
endclass