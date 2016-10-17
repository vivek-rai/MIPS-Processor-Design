//ID/EX Pipeline register
module id_ex_register(
input logic clk,
input logic flush_e,
  input logic [31:0] read_data_1_d,read_data_2_d,
  input logic [6:0] alu_op_d,
input logic source_1_sel_d,wb_source_d,reg_dst_d,mem_rd_en_d,mem_wr_en_d,reg_write_d,
  input logic [4:0] register_s_d,register_t_d,register_d_d,
  output logic [6:0] alu_op_e,
  output logic [31:0] read_data_1_e,read_data_2_e,
output logic source_1_sel_e,wb_source_e,reg_dst_e,mem_rd_en_e,mem_wr_en_e,reg_write_e,
  output [4:0] register_s_e,register_t_e,register_d_e);
always_ff@(posedge clk)
	begin
      if(!flush_e)
	begin
	read_data_1_e <= read_data_1_d;
	read_data_2_e <= read_data_2_d;
    alu_op_e <= alu_op_d;
    source_1_sel_e <= source_1_sel_d;
    wb_source_e <= wb_source_d;
    reg_dst_e <= reg_dst_d;
    mem_rd_en_e <= mem_rd_en_d;
    mem_wr_en_e <= mem_wr_en_d;
    reg_write_e <= reg_write_d;
    register_s_e <= register_s_d;
    register_t_e <= register_t_d;
    register_d_e <= register_d_d;
    end
      else
        begin
    read_data_1_e <= 0;
	read_data_2_e <= 0;
    alu_op_e <= 0;
    source_1_sel_e <= 0;
    wb_source_e <= 0;
    reg_dst_e <= 0;
    mem_rd_en_e <= 0;
    mem_wr_en_e <= 0;
    reg_write_e <= 0;
    register_s_e <= 0;
    register_t_e <= 0;
    register_d_e <= 0;
        end
	end
endmodule
	
