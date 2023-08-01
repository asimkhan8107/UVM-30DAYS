class sequences extends uvm_sequence#(sequence_item);
	`uvm_object_utils(sequences)
	sequence_item s_item;
	
  	function new(string name="sequence");
		super.new(name);
	endfunction
	
 	task body();
      s_item=sequence_item::type_id::create("s_item");
      begin
          `uvm_do(s_item)
      end
	endtask
endclass
