`uvm_analysis_imp_decl(_a)
`uvm_analysis_imp_decl(_b)
class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard)
	sequence_item s_item_a[$],s_item_b[$]; //input monitor_a,output monitor_b
	sequence_item s_item_c,s_item_d;//input a,output b
	uvm_analysis_imp_a #(sequence_item,scoreboard) c1_export;
	uvm_analysis_imp_b #(sequence_item,scoreboard) c2_export;
	
  	// constructor
  	function new(string name,uvm_component parent);
		super.new(name,parent);
		c1_export=new("analysis_imp_1",this);
		c2_export=new("analysis_imp_2",this);
		`uvm_info(get_type_name,$sformatf("c1_export=%0d,c2_export=%0d",c1_export,c2_export),UVM_LOW)
	endfunction
  	
 	function void write_a(sequence_item s_item);
		s_item_a.push_back(s_item);
		`uvm_info(get_type_name,$sformatf("write_a s_item=%0d",s_item),UVM_LOW)
	endfunction

  	function void write_b(sequence_item s_item);
		s_item_b.push_back(s_item);
		`uvm_info(get_type_name,$sformatf("write_b s_item=%0d",s_item),UVM_LOW)
	endfunction
  
  	// run phase
	task run_phase(uvm_phase phase);
	forever
	begin
		wait(s_item_a.size()>0 && s_item_b.size()>0);
		s_item_c=s_item_a.pop_front();
		s_item_c.print();
		s_item_d=s_item_b.pop_front();
		s_item_d.print();
		if((s_item_c.q==s_item_d.q && s_item_c.qb==s_item_d.qb))
		begin
			$display("------------------------------------------------------------");
			`uvm_info(get_type_name, $sformatf("pass qREF=%0b, 	qDUT=%0b,qbREF=%0b,qbDUT=%0b",s_item_c.q,s_item_d.q,s_item_c.qb,s_item_d.qb),UVM_LOW)
			$display("------------------------------------------------------------");
		end
		else
		begin
			$display("------------------------------------------------------------");
			`uvm_error(get_type_name, $sformatf("pass qREF=%0b, qDUT=%0b, qbREF=%0b,qbDUT=%0b",s_item_c.q,s_item_d.q,s_item_c.qb,s_item_d.qb))
			$display("------------------------------------------------------------");
		end
	end
	endtask
endclass