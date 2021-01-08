module instruction_fetch_operand_fetch (clk);

input clk;

wire clk;
reg [31:0] instruction,pc_current;

                     always @( negedge clk)
                     begin
                     # 9.99
                     instruction  <=  p.instruction;
                     pc_current   <=  p.pc_current;
                     end
                     
                     endmodule
