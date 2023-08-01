class agent2 extends uvm_agent;
	`uvm_component_utils(agent2)
  
  	// monitor instance
	monitor_out mout;
  
  	// constructor
	function new(string name="agent2",uvm_component parent);
		super.new(name,parent);
	endfunction
	
  	// build phase
  	function void build_phase(uvm_phase phase);
		mout=monitor_out::type_id::create("mout",this);
		`uvm_info(get_type_name,$sformatf("agent2") ,UVM_LOW)
	endfunction
endclass