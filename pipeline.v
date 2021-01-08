module pipeline (clk);
input clk;
 
wire clk;
wire isld,isst,isbeq,isbgt,isret,isimmediate,iswb,isubranch,iscall,I,isbranchtaken;
wire [31:0] branchpc,pc_current,instruction,immx,op1,op2,branchtarget,aluresult,aluresult1,ldresult,dm1,dm2,d1,d2;
reg [31:0]a,b,am1,am2,dm3,d3,pc;
reg [3:0] a1,a2,a3;
wire [4:0] alusignal;
wire [4:0]opcode;
wire [1:0] flags;
wire [3:0] rd;
integer ind1,i2,i3;
reg rw,reset;


     
     instruction_fetch                    if1(.clk(clk),.isbranchtaken(isbranchtaken),.branchpc(branchpc),.pc_current(pc_current),.instruction(instruction) );
     instruction_fetch_operand_fetch                 pr1( .clk(clk));
     
     operand_fetch                    of1(.instruction(pr1.instruction),.pc_current(pr1.pc_current),.isret(isret),.isst(isst),.opcode(opcode),.I(I),.immx(immx),
                                   .branchtarget(branchtarget),.op1(op1),.op2(op2),.rd(rd));
                                   
     operand_fetch_execute                 pr2 (.clk (clk));                              
     execute                    ex1(.isret(pr2.isret),.isbeq(pr2.isbeq),.isbgt(pr2.isbgt),.isubranch(pr2.isubranch)
                                    ,.isimmediate(pr2.isimmediate),.branchtarget(pr2.branchtarget),
                                    .alusignal(pr2.alusignal),.op1(pr2.op1),.op2(pr2.op2),.immx(pr2.immx),.aluresult1(aluresult1),
                                     .branchpc(branchpc),.isbranchtaken(isbranchtaken));
                                     
     execute_memory_access                 pr3 (.clk(clk));                                
     memory_access                    ma1(.op2(pr3.op2),.aluresult1(pr3.aluresult1),.isld(pr3.isld),.isst(pr3.isst),.ldresult(ldresult));
     
     memory_access_write_back                 pr4 (.clk(clk));
     
     write_back                    wb1(.iswb(pr4.iswb),.iscall(pr4.iscall),.isld(pr4.isld),.rd(pr4.rd),
                                      .aluresult1(pr4.aluresult1),.ldresult(pr4.ldresult),.pc_current(pr4.pc_current));
     control               c1 (.opcode(opcode),.I(I),.isst(isst),.isld(isld),.isbeq(isbeq),.isbgt(isbgt),.isret(isret),.isimmediate(isimmediate),
                                     .iswb(iswb),.isubranch(isubranch),.iscall(iscall),.alusignal(alusignal));
     register_file         rf1 (.a1(a1),.a2(a2),.a3(a3),.d3(d3),.reset(reset),.clk(clk),.iswb(iswb),.d1(d1),.d2(d2) );
     memory                m1  (.am1(am1),.am2(am2),.dm3(dm3),.rw(rw),.dm1(dm1),.dm2(dm2));
     alu                   alu1 (.alusignal(alusignal),.a(a),.b(b),.aluresult(aluresult),.flags(flags));                  
                 
                     
                    
                     
 endmodule  

