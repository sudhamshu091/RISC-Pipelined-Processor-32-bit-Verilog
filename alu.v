module alu(alusignal, a, b, aluresult, flags );

input [4:0] alusignal;
input signed [31:0] a,b;
output [31:0] aluresult;
output [1:0] flags;

wire [4:0] alusignal;
wire signed [31:0] a,b;
reg [31:0] aluresult;
wire signed [31:0] a_signed;
reg [1:0] flags;

assign a_signed=a;

always @(*)
          begin
          case(alusignal)

5'b00000 : aluresult = a + b ;					// add
5'b00001 : aluresult = a - b ; 					// sub
5'b00010 : aluresult = a * b ; 					// mul
5'b00011 : aluresult = a / b ; 					// div 
5'b00100 : aluresult = a % b ; 					// mod
5'b00101 : begin
                if (a == b)
                begin 
                flags[0] = 1'b1;
                flags[1] = 1'b0;
                end  
                else if (a > b)
                begin
                flags[0] = 1'b0; 
                flags[1] = 1'b1;
                end
                else 
                begin
                flags[0] = 1'b0; 
                flags[1] = 1'b0;
                end
           end                        				// cmp
5'b00110 : aluresult = a & b ; 					// and
5'b00111 : aluresult = a | b ; 					// or
5'b01000 : aluresult = ~a ;    					// not
5'b01001 : aluresult = b ;    					// mov
5'b01010 : aluresult = a << b ;   				// lsl
5'b01011 : aluresult = a >> b ; 				// a unsigned   //lsr
5'b01100 : 
          begin
          aluresult= a_signed >>> b;                     	// a signed     //asr
          end
5'b01101:
          begin
                             					// nop
          
          end
                   
default: begin
          aluresult = 32'd0;
          flags[0] = 1'b0; 
          flags[1] = 1'b0;
         end

endcase
end
endmodule

