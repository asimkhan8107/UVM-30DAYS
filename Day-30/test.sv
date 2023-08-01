class test extends uvm_test;
	`uvm_component_utils(test)
	sequences seq;
	environment env;
	
  	// constructor
  	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
  
  	// build phase
	function void build_phase(uvm_phase phase);
		seq=sequences::type_id::create("seq",this);
		env=environment::type_id::create("env",this);
	endfunction
  
  	// run phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
      	repeat(5)
		begin
		#5;
			seq.start(env.ag1.sr);
			`uvm_info(get_type_name(),$sformatf("hello"),UVM_NONE)
		end
		phase.drop_objection(this);
	endtask
endclass