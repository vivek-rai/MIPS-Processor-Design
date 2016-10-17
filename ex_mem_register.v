//EX/MEM Pipeline register
module ex_mem_register(
input logic clk,
input logic wb_source_e,mem_rd_en_e,mem_wr_en_e,reg_write_e,
input logic [31:0] alu_out_e,write_data_e
input logic [4:0] register_d_e,
output logic wb_source_m,mem_rd_en_m,mem_wr_en_m,reg_write_m,
output logic [31:0] alu_out_m,write_data_m,
output [4:0] register_d_m);
always_ff@(posedge clk)
	begin
	alu_out_m <= alu_out_e;
    write_data_m <= write_data_e;
    wb_source_m <= wb_source_e;
    mem_rd_en_m <= mem_rd_en_e;
    mem_wr_en_m <= mem_wr_en_e;
    reg_write_m <= reg_write_e;
    register_d_m <= register_d_e;
	end
endmodule
	
