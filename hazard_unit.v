module hazard_unit(
input logic [4:0] register_s_d,register_t_d,
input logic [4:0] register_d_m,register_d_w,
input logic reg_write_m,reg_write_w,branch_d,
input logic wb_source_e,
output logic stall_f,stall_d,flush_e
output logic [1:0] forward_source_0,forward_source_1);
  logic lstall,branch_stall,forward_source__c_0,forward_source__c_1;
always_comb
	begin
	if((register_s_d != 0) && (register_s_d == register_d_m) && (reg_write_m))
		forward_source_0 = 2'b01;
	else if((register_s_d != 0) && (register_s_d == register_d_w) && (reg_write_w))
		forward_source_0 = 2'b10;
	else
		forward_source_0 = 2'b00;
	end
	always_comb
	begin
	if((register_t_d != 0) && (register_t_d == register_d_m) && (reg_write_m))
		forward_source_1 = 2'b01;
	else if((register_t_d != 0) && (register_t_d == register_d_w) && (reg_write_w))
		forward_source_1 = 2'b10;
	else
		forward_source_1 = 2'b00;
	end
	assign forward_source__c_0 = ((register_s_d != 0) && (register_s_d == register_d_m) && reg_write_m);
	assign forward_source__c_1 = ((register_t_d != 0) && (register_t_d == register_d_m) && reg_write_m);
  assign lstall = (((register_s_d == register_t_e) || (register_t_d == register_t_e)) && (wb_source_e));
  assign branch_stall = ((branch_d) && (reg_write_e)&& ((register_s_d == register_d_e) || (register_t_d == register_d_e))) || ((branch_d) && (wb_source_m) && ((register_s_d == register_d_m) || (register_t_d == register_d_m)));
  assign stall_f=stall_d=flush_e= (lstall || branch_stall);
endmodule