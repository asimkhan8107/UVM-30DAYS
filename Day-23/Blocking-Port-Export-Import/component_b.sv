`include "sub_component_b_a.sv"
class component_b extends uvm_component;
 
  sub_component_b_a sub_comp_b_a;
  
  uvm_blocking_put_export#(transaction) trans_in;
  
  `uvm_component_utils(component_b)
  
  // constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_in = new("trans_in", this);
  endfunction
  
  // build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sub_comp_b_a = sub_component_b_a::type_id::create("sub_comp_b_a",this);
  endfunction
  
  // connect phase
  function void connect_phase(uvm_phase phase);
    trans_in.connect(sub_comp_b_a.trans_in);
  endfunction   
endclass
    