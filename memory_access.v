module memory_access(op2,aluresult1,isld,isst,ldresult);     

input [31:0] op2,aluresult1;
input isld,isst;
output [31:0] ldresult; 
   
wire [31:0] op2,aluresult1;
wire isld,isst;
reg [31:0] ldresult;


           always @(*)
           begin
                                       // waiting for aluresult to come.
           if (isld == 1)
           begin
           p.am1    = aluresult1 ;
           ldresult = p.dm1;
           p.rw     = 0;
          end
          else if ( isst == 1)
          begin
         
           p.rw  = 1;
           p.am2 = aluresult1 ;
           p.dm3 = op2 ;
          end
          
          end
          endmodule 

