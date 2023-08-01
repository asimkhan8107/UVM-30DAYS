module dff(vif.dut inter);
  
  always@(posedge inter.clk or posedge inter.reset)
  begin
	if(inter.reset)
	begin
		inter.q<=1'b0;
	end
	else
	begin
		inter.q<=inter.d;
	end
  end
  
  assign inter.qb=~inter.q;
  
endmodule : dff