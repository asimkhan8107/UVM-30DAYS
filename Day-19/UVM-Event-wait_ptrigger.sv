/* 						UVM Event wait_ptrigger							*/
`include "uvm_macros.svh"
import uvm_pkg::*;

module uvm_events;
  uvm_event event_1 = new();
  
  initial
    begin
      fork
        $display("===========================================================================");
        // triggers the event
        begin
          $display($time, "\tTriggering The Event");
          event_1.trigger;
        end
        
        // wait for event to trigger
        begin
          $display($time, "\tWaiting for the event to trigger");
          event_1.wait_ptrigger;
          $display($time, "\tEvent Triggered");
        end
      join
    end
  
  initial
    begin
      #50
      $display($time, "\tEnding the simulation");
      $display("=============================================================================");
      $finish;
    end
endmodule
          
        