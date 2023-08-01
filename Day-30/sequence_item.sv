class sequence_item extends uvm_sequence_item;
	randc bit d;
	bit q;
	bit qb;
	`uvm_object_utils_begin(sequence_item)
      `uvm_field_int(d,UVM_ALL_ON)
      `uvm_field_int(q,UVM_ALL_ON)
      `uvm_field_int(qb,UVM_ALL_ON)
	`uvm_object_utils_end
  	
  	// constructor
    function new(string name="sequence_item");
    	super.new(name);
    endfunction
endclass