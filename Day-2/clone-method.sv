/* 					UVM Clone Method				*/
`include "uvm_macros.svh"
import uvm_pkg ::*;

class mem_seq_item extends uvm_sequence_item;
  
  // Control Information
  rand bit [3:0] addr;
  rand bit 		wr_en;
  rand bit 		rd_en;
  
  // Payload Information
  rand bit [7:0] wdata;
  
  // Alanlysis Information
  bit [7:0] rdata;
  
  // utility and field macros
  `uvm_object_utils_begin(mem_seq_item)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(wr_en, UVM_ALL_ON)
    `uvm_field_int(rd_en, UVM_ALL_ON)
    `uvm_field_int(wdata, UVM_ALL_ON)
  `uvm_object_utils_end
  
  // Constructor
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction
  
  // Constraint to generate only one among read and write
   constraint wr_rd_c { wr_en != rd_en; }; 
endclass

module sv_seq_item_tb;
  // Instance
  mem_seq_item seq_item_0;
  mem_seq_item seq_item_1;
  
  initial
    begin
      // Create method 
      seq_item_0 = mem_seq_item::type_id::create("seq_item_0");
      seq_item_1 = mem_seq_item::type_id::create("seq_item_1");
      
      // randomizing 
      seq_item_0.randomize();
      seq_item_0.print(); 	// To print seq_item_0
      
      // Clone method
      $cast(seq_item_1, seq_item_0.clone()); // create seq_item_1 and copy seq_item_0 to seq_item_1 at once
      
      // Changing the seq_item_1 values will not reflect on seq_item_0 
      seq_item_1.addr = 5;
      seq_item_1.wdata = 'h5D;
      `uvm_info("","Printing seq_item_0", UVM_LOW)
      seq_item_0.print();		// printing the seq_item_0
      `uvm_info("","Printing seq_item_1",UVM_LOW)
      seq_item_1.print(); 	// printing the seq_item_1
   end
endmodule
                
      
  
  