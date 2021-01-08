module execute( isret, isbeq, isbgt,isubranch, isimmediate, branchtarget, alusignal, op1, op2, immx, aluresult1, branchpc,isbranchtaken );

input isret,isbeq,isbgt,isubranch,isimmediate;
input [4:0] alusignal;
input [31:0] op1,op2,immx,branchtarget;
output [31:0] aluresult1,branchpc;
output isbranchtaken;
         
wire isret,isbeq,isbgt,isubranch,isimmediate;
wire [4:0] alusignal;
wire [31:0] op1,op2,immx,branchtarget;
reg [31:0] aluresult1,branchpc;
reg isbranchtaken;
reg w1,w2;




           always @(*)
           begin
          
           if ( isret == 1)
           begin
           branchpc = op1;
           end
           else 
           begin
           branchpc = branchtarget;
           end
           
           if (isbeq == 1 && p.flags[0] == 1)
           begin
           w1 = 1;
           end
           else 
           begin
           w1=0;
           end
           
           if (isbgt == 1 && p.flags[1] == 1)
           begin
           w2 = 1 ;
           end
           else
           begin
           w2=0;
           end
           if (isubranch == 1 || w1 == 1 || w2 == 1 )
           begin
           
           isbranchtaken = 1;
           end
           else
           begin
           isbranchtaken = 0;
           end

           p.a = op1;
           if ( isimmediate == 1)
           begin
           p.b = immx;
           end
           else if (isimmediate == 0)
           begin
           p.b = op2;
           end
           
         aluresult1= p.alu1.aluresult;
         end
         endmodule

