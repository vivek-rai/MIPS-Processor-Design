module if_id_register(
input logic clk,
input logic stall_d,branch_zero,
input logic [31:0] instr,
input logic [31:0] pc_plus_four_in,
output logic [31:0] instr_d,
output logic [31:0] pc_plus_four_d);
always_ff@(posedge clk)
	begin
	if((!stall_d) && (!branch_zero))
	begin
	instr_d <= instr;
	pc_plus_four_d <= pc_plus_four_in;
	end
	else if(branch_zero)
	instr_d <= 0;
	end
endmodule
	