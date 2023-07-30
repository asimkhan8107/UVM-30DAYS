/*				      DMA Design						*/

module DMA #(parameter ADDR_WIDTH = 32,
             parameter DATA_WIDTH = 32)
  			
  ( input clk, 
   input reset,
   
   // control signals
   input [ADDR_WIDTH-1:0] addr,
   input wr_en,
   input valid,
   
   // data signals
   input [DATA_WIDTH-1:0] wdata,
   output [DATA_WIDTH-1:0] rdata
  );
  
  logic [DATA_WIDTH-1:0] t_data;
  
  reg [DATA_WIDTH-1:0] intr;
  reg [DATA_WIDTH-1:0] control;
  reg [DATA_WIDTH-1:0] io_address;
  reg [DATA_WIDTH-1:0] mem_address;
  
  // reset
  always@(posedge clk)
    begin
      if(wr_en & valid)
        begin
          if(addr == 32'h400)
            intr <= wdata;
          else if(addr == 32'h404)
            control <= wdata;
          else if(addr == 32'h408)
            io_address <= wdata;
          else if(addr == 32'h40C)
            mem_address <= wdata;
        end
      else if(!wr_en & valid)
        begin
          if(addr == 32'h400)
            t_data = intr;
          else if(addr == 32'h404)
            t_data = control;
          else if(addr == 32'h408)
            t_data = io_address;
          else if(addr == 32'h40C)
            t_data = mem_address;
        end
    end
endmodule