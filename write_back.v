module write_back (iswb, iscall,isld, rd, aluresult1, ldresult,pc_current);   
 
input iswb,iscall,isld;
input [31:0] aluresult1,ldresult,pc_current;
input [3:0] rd;
   
wire iswb,iscall,isld;
wire [31:0] aluresult1,ldresult,pc_current;
wire [3:0] rd;

           always @(*)
           begin
           if (iswb == 1)
           begin  
               
           if (iscall == 1)
           begin
           p.a3 = 4'b1111;
           end
           
           else if ( iscall==0)
           begin
           p.a3 = rd;
           end
          
           if  (isld == 0 && iscall == 0)
           begin
           p.d3 = aluresult1 ;
           end
           else if ( isld == 1 && iscall == 0)
           begin
           p.d3 = ldresult;
           end
           else if (isld == 0 && iscall == 1)
           begin
           p.d3 = pc_current + 4;
           end
           
           end
           end
           endmodule

