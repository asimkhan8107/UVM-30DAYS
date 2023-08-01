class driver extends uvm_driver#(sequence_item);
	`uvm_component_utils(driver)
	
  	virtual vif inter;
	sequence_item s_item;
	
    // constructor
  	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
  
    // build phase 
	function void build_phase(uvm_phase phase);
		if(!uvm_config_db#(virtual vif)::get(this,"","interface",inter))
			`uvm_fatal(get_type_name(),$sformatf("not set at the top"))
	endfunction
  
    // run phase      
	task run_phase(uvm_phase phase);
		s_item=sequence_item::type_id::create("s_item");
		wait(!inter.reset);
		`uvm_info(get_type_name(),$sformatf("s_item.reset=%0d",inter.reset),UVM_NONE)
		forever
		begin
			@(inter.clk,inter.d)
			seq_item_port.get_next_item(s_item);
			`uvm_info(get_type_name(),$sformatf("s_item.d=%0d,reset=%0d,inter.clk=%0d",s_item.d,inter.reset,inter.clk),UVM_NONE)
			@(posedge inter.clk);
			inter.d<=s_item.d;
			`uvm_info(get_type_name(),$sformatf("s_item.d=%0d,reset=%0d,inter.clk=%0d",s_item.d,inter.reset,inter.clk),UVM_NONE)
			seq_item_port.item_done();
		end
	endtask
endclass