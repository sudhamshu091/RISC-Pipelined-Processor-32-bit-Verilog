module operand_fetch_execute (clk);

input clk;
              
wire clk;
reg [31:0] instruction,pc_current,branchtarget,op2,op1,immx;
reg isst, isld, isbeq, isbgt, isret, isimmediate, iswb, isubranch, iscall;
reg [4:0] alusignal;

                   always @(negedge clk )
                   begin
                   # 9.99
                   instruction   <= p.pr1.instruction;
                   pc_current    <= p.pr1.pc_current;
                   branchtarget  = p.branchtarget;
                   op1           = p.op1;
                   op2           = p.op2;
                   isst          = p.isst;
                   isld          = p.isld;
                   isbeq         = p.isbeq;
                   isbgt         = p.isbgt;
                   isret         = p.isret;
                   isimmediate   = p.isimmediate;
                   iswb          = p.iswb;
                   isubranch     = p.isubranch;
                   iscall        = p.iscall;
                   alusignal     = p.alusignal;
                   immx          = p.immx;
                   
                   end
                   
                   endmodule

