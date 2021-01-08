module memory_access_write_back (clk);
input clk;          
wire clk;
reg [31:0] instruction,pc_current,branchtarget,aluresult1,ldresult;
reg isst, isld, isbeq, isbgt, isret, isimmediate, iswb, isubranch, iscall;
reg [4:0] alusignal;
reg [3:0] rd;

                   always @(negedge clk)
                   begin
                   # 9.99
                   aluresult1     <= p.pr3.aluresult1;
                   instruction   <= p.pr3.instruction;
                   pc_current    <= p.pr3.pc_current;
                   branchtarget  <= p.pr3.branchtarget;
                   isst          <= p.pr3.isst;
                   isld          <= p.pr3.isld;
                   isbeq         <= p.pr3.isbeq;
                   isbgt         <= p.pr3.isbgt;
                   isret         <= p.pr3.isret;
                   isimmediate   <= p.pr3.isimmediate;
                   iswb          <= p.pr3.iswb;
                   isubranch     <= p.pr3.isubranch;
                   iscall        <= p.pr3.iscall;
                   alusignal     <= p.pr3.alusignal;
                   rd            <= p.pr3.instruction[25:22];
                   ldresult       = p.ldresult;
                   end
                   
                   endmodule

