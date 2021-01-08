module execute_memory_access (clk);

input clk;
              
wire clk;
reg [31:0] instruction,pc_current,branchtarget,op2,aluresult1;
reg isst, isld, isbeq, Isbgt, isret, isimmediate, iswb, isubranch, iscall;
reg [4:0] alusignal;

                   always @(negedge clk)
                   begin
                   # 9.99
                   instruction   <= p.pr2.instruction;
                   pc_current    <= p.pr2.pc_current;
                   branchtarget  <= p.pr2.branchtarget;
                   op2           <= p.pr2.op2;
                   isst          <= p.pr2.isst;
                   isld          <= p.pr2.isld;
                   isbeq         <= p.pr2.isbeq;
                   isbgt         <= p.pr2.isbgt;
                   isret         <= p.pr2.isret;
                   isimmediate   <= p.pr2.isimmediate;
                   iswb          <= p.pr2.iswb;
                   isubranch     <= p.pr2.isubranch;
                   iscall        <= p.pr2.iscall;
                   alusignal     <= p.pr2.alusignal;
                   aluresult1    <= p.aluresult1;
                   end
                   
                   endmodule

