//MEM/WB Pipeline register
module mem_wb_register(
input logic clk,
input logic wb_source_m,reg_write_m,
  input logic [31:0] alu_out_m,data_m,
  input logic [4:0] register_d_m,
output logic wb_source_w,reg_write_w,
  output logic [31:0] alu_out_w,data_w,
  output [4:0] register_d_w);
always_ff@(posedge clk)
	begin
	alu_out_w <= alu_out_m;
    data_w <= data_m;
    wb_source_w <= wb_source_m;
    reg_write_w <= reg_write_m;
    register_d_w <= register_d_m;
	end
endmodule
	
