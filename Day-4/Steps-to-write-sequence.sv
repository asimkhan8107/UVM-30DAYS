/* 			Steps to write UVM Sequence 			*/
`include "uvm_macros.svh"
import uvm_pkg::*;

class mem_sequence extends uvm_sequence#(); 
  
  // Utility declaration
  `uvm_object_utils(mem_sequence)
  
  // Constructor
  function new(string name ="mem_sequence");
    super.new(name);
  endfunction

  virtual task body();
    // step-1.create req
    req = mem_sequence::type_id::create("req");

    // step-2. wait for grant
    wait_for_grant();	

    // step-3. randomize the req
    assert(req.randomize());

    // step-4. send request to driver
    send_request(req);

    // step-5 wait for item done from driver
    wait_for_item_done();

    // step-6 get response from driver
    get_response(rsp);
  endtask
endclass
