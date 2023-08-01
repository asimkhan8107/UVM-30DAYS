class agent1 extends uvm_agent;
	`uvm_component_utils(agent1)
  	// driver, monitor and sequencer instantiation 
	driver dr;
	monitor_in min;
	sequencer sr;
  
  	// constructor
	function new(string name="agent1",uvm_component parent);
		super.new(name,parent);
	endfunction
  
  	// build phase
	function void build_phase(uvm_phase phase);
		sr=sequencer::type_id::create("sr",this);
		min=monitor_in::type_id::create("min",this);
		dr=driver::type_id::create("dr",this);
	endfunction
  
  	// connect phase
	function void connect_phase(uvm_phase phase);
		dr.seq_item_port.connect(sr.seq_item_export);
		`uvm_info(get_type_name,$sformatf("agent1") ,UVM_LOW)
	endfunction
endclass