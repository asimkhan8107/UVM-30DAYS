/*						UVM Environment							*/
`include"mem_agent.sv"
`include"mem_scoreboard.sv"

class mem_model_env extends uvm_env;
  // Agent and Scoreboard instance
  mem_agent mem_agnt;
  mem_scoreboard mem_scb;
  
  `uvm_component_utils(mem_model_env)
  
  // Constructor
  function new(string name, uvm parent)
    super.new(name, parent);
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Creating Component
    mem_agnt = mem_agent::type_id::create("mem_agent",this);
    mem_scb = mem_acoreboard::type_id::create("mem_agent",this);
  endfunction : build_phase
  
  // Connect phase
  function void connect_phase(uvm_phase phase);
    // Connecting monitor and scoreboard port
    mem_agnt.monitor.item_collected_port.connect(mem_scb.item_collected_export);
  endfunction : connect_phase
endclass