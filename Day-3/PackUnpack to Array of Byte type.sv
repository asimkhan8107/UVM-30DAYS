/*			Pack/Unpack to Array of BYTE type */
`include "uvm_macros.svh"
import uvm_pkg::*;

class mem_seq_item extends uvm_sequence_item;
  // data and control fields
  rand bit [3:0] addr;
  rand bit		 wr_en;
  rand bit 		 rd_en;
  rand bit [7:0] wdata;
  	   bit [7:0] rdata;
  
  // Utility and field macros
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
  
  // Constraint
  constraint wr_rd_c { wr_en != rd_en; };  
endclass

// Testbench
module seq_item_tb;
  mem_seq_item seq_item_0;
  mem_seq_item seq_item_1;
  byte unsigned byte_packed_data[];
  
  initial
    begin
      // Create Method
      seq_item_0 = mem_seq_item::type_id::create("seq_item_0");
      seq_item_1 = mem_seq_item::type_id::create("seq_item_1");
      
      // =============== PACK ================ //
      seq_item_0.randomize();	// To randomize
      seq_item_0.print();	// To print
      
      // Pack method
      seq_item_0.pack_bytes(byte_packed_data);
      foreach(byte_packed_data[i])
        `uvm_info("PACK",$sformatf("byte_packed_data[%0d]= %0b",i,byte_packed_data[i]), UVM_LOW)
        
      // =============== UNPACK =============== //  
      `uvm_info("UNPACK","Before UnPack", UVM_LOW)
      seq_item_1.print();
      
      // Unpack method
      seq_item_1.unpack_bytes(byte_packed_data);
      `uvm_info("UNPACK", "After UnPAck",UVM_LOW)
      seq_item_1.print();
    end
endmodule
      
  
