/*								UVM Barrier 							*/
`include "uvm_macros.svh"
import uvm_pkg::*;

module uvm_barrier_example;
  uvm_barrier ba;
  initial
    begin
      ba = new("ba", 3);
      fork 
        begin
          // Process 1
          $display($time, "\tInside the process a");
          #50
          $display($time, "\tprocess a completed");
          $display($time, "\tprocess a waiting for barrier");
          ba.wait_for();
          $display($time,"\tprocess a after wait for");
        end
        begin
          // Process 2
          $display($time, "\tInside the process b");
          #50
          $display($time, "\tprocess b completed");
          $display($time, "\tprocess b waiting for barrier");
          ba.wait_for();
          $display($time,"\tprocess b after wait for");
        end
        begin
          // Process 3
          $display($time, "\tInside the process c");
          #70
          $display($time, "\tprocess c completed");
          $display($time, "\tprocess c waiting for barrier");
          ba.wait_for();
          $display($time,"\tprocess c after wait for");
        end
        begin
          // Process 4
          $display($time, "\tInside the process a");
          #30
          $display($time, "\tprocess d completed");
          $display($time, "\tprocess d waiting for barrier");
          ba.wait_for();
          $display($time,"\tprocess d after wait for");
        end  
      join
    end
endmodule