class environment extends uvm_env;
	`uvm_component_utils(environment)
  
  	// agent instance
	agent1 ag1;
	agent2 ag2;
	scoreboard sb;
  
  	// constructor
	function new(string name="env",uvm_component parent);
		super.new(name,parent);
	endfunction
	
  	// build phase
  	function void build_phase(uvm_phase phase);
		ag1=agent1::type_id::create("agnt1",this);
		ag2=agent2::type_id::create("agnt2",this);
		sb=scoreboard::type_id::create("scb",this);
	endfunction
  
  	// connect phase
	function void connect_phase(uvm_phase phase);
		ag1.min.c1_port.connect(sb.c1_export);
		ag2.mout.c2_port.connect(sb.c2_export);
	endfunction
endclass