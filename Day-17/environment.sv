`include "component_a.sv"
`include "component_b.sv"

class environment extends uvm_env;
  // Components Instantiation
  component_a cmp_a;
  component_b cmp_b;
  
  uvm_heartbeat heart_beat;
  uvm_event hb_event;
  
  `uvm_component_utils(environment)
  
  // Constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cmp_a = component_a::type_id::create("cmp_a", this);
    cmp_b = component_b::type_id::create("cmp_b", this);
    heart_beat = new("heart_beat", this, obje);
    hb_event = new("hb_event");
  endfunction : build_phase
  
  // connect phase
  function void connect_phase(uvm_phase phase);
    uvm_component hb[$];
    heart_beat.set_mode(UVM_ALL_ACTIVE);
    heart_beat.set_heartbeat(hb_event, hb);
    heart_beat.add(cmp_a);
    heart_beat.add(cmp_b);
  endfunction : connect_phase
  
  // run phase
  virtual task run_phase(uvm_phase phase);
    heart_beat.start(hb_event);
    repeat(20) 
      begin
        #60
        hb_event.trigger();
        `uvm_info(get_type_name(), $sformatf(" [ Env ] Triggering hb_event"),UVM_LOW)
      end
  endtask : run_phase
endclass