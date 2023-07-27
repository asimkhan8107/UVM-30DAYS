class transaction extends uvm_sequence_item;
  rand bit [3:0] addr;
  rand bit 		 wr_rd;
  rand bit [7:0] wdata;
  
  // Utility and field macros
  `uvm_object_utils_begin(transaction)
    `uvm_field_int(addr,UVM_ALL_ON)
    `uvm_field_int(wr_rd,UVM_ALL_ON)
    `uvm_field_int(wdata,UVM_ALL_ON)
  `uvm_object_utils_end
  
  //constructor
  function new(string name = "transaction");
    super.new(name);
  endfunction
endclass
