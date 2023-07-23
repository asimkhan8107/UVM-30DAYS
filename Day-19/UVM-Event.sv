/*								UVM Event									*/
`include"uvm_macros.svh"
import uvm_pkg::*;

module uvm_events_example;
  // 1. declaring uvm_event event_1
  uvm_event event_1;
  
  initial
    begin
      // 2. creating an event
      event_1 = new();
      
      fork
      	// triggers the event
        begin
          $display("================================================================");
          #50
          $display($time, "\tTriggering the event");
          // 4. Trigger the event
          event_1.trigger;
        end
        
        // wait for event to trigger
        begin
          $display($time,"\twaiting for the event to trigger");
          // 3. waiting for event trigger
          event_1.wait_trigger;
          $display($time, "\tEvent Triggered");
          $display("===============================================================");
        end
      join
    end
endmodule