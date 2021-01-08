module control ( opcode, I, isst, isld, isbeq, isbgt,isret,isimmediate, iswb,isubranch,iscall,alusignal );

output isst,isld,isbeq,isret,isimmediate,iswb,isubranch,iscall,isbgt;
input [4:0] opcode;                 
input I;
output [4:0] alusignal;
                 
reg isst,isld,isbeq,isret,isimmediate,iswb,isubranch,iscall,isbgt;
wire [4:0] opcode;                 
wire I;
reg [4:0] alusignal;


           always @(*)
           begin
           
           if (I == 1)
           begin
           isimmediate = 1;
           end
           else 
           begin
           isimmediate = 0;
           end         
case(opcode)
5'b00000:                               //Arithmetic Operations
      begin                                         
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
      end
5'b00001: 
      begin
      if (I==1 && p.immx[31])
      begin
      alusignal = 5'b00000;
      end
      else
      begin
      alusignal = opcode;
      end
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
      end

5'b00010: begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
       end

5'b00011: 
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
end

5'b00100: 
begin
       alusignal = opcode;
       iswb      = 1; 
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
end

5'b00101:
begin 
       alusignal = opcode;
       iswb      = 0;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
end

5'b00110:
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
 end
 
5'b00111:
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
 end
 
5'b01000:
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
 end
 
5'b01001: 
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
end

5'b01010:
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
 end
5'b01011:
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
 end
 
5'b01100: 
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
end
               
5'b01101:
begin
       alusignal = opcode;
       iswb      = 1;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       isbeq     = 0;
       isbgt     = 0;
 end
  
                                  //Branch Operations
5'b01110:
      begin
      alusignal = 5'b00000;
      isld      = 1;
      iswb      = 1;
      isst      = 0;
      isret     = 0;
      isubranch = 0;
      iscall    = 0;
      isbeq     = 0;
      isbgt     = 0;
       end
5'b01111:
      begin
      alusignal = 5'b00000;
      isst      = 1;
      iswb      = 0;
      isld      = 0;
      isret     = 0;
      isubranch = 0;
      iscall    = 0;
      isbeq     = 0;
      isbgt     = 0;
      end
5'b10000:begin
       alusignal = 5'b01101;
       isbeq     = 1;
       iswb      = 0;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       end
5'b10001: 
begin
       alusignal = 5'b01101;
       isbgt     = 1 ;
       iswb      = 0;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       isubranch = 0;
       iscall    = 0;
       end
5'b10010: 
begin
       alusignal = 5'b01101;
       isubranch = 1;
       iswb      = 0;
       isst      = 0;
       isld      = 0;
       isret     = 0;
       iscall    = 0;
       end
5'b10011:
      begin
      alusignal = 5'b01101;
      isubranch = 1;
      iscall    = 1;
      iswb      = 1;
      isst      = 0;
      isld      = 0;
      isret     = 0;
                
      end
5'b10100:           
      begin
      alusignal = 5'b01101;
      isubranch = 1;
      isret     = 1;
      iswb      = 0;
      isst      = 0;
      isld      = 0;
      iscall    = 0;          
      end  
      
      endcase
      
      end
      endmodule


