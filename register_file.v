module register_file(a1,a2,a3,d3,reset,clk,iswb,d1,d2);

input [3:0] a1,a2,a3;
input [31:0] d3;
input reset,clk;
output [31:0] d1,d2;
input iswb;

wire [3:0] a1,a2,a3;
wire [31:0] d3;
wire reset,clk;
reg [31:0] d1,d2;
reg [31:0] r [15:0];
reg [15:0]ind;
wire iswb;

                   always @(reset)
                   begin
                   if (reset==1)
                   begin
                   for (ind=0;ind<16;ind=ind+1)
                   begin
                   if (ind!=14)
                   r[ind]  = 32'b0;
                   else 
                   r[ind]  = 32'h1000;
                   end
                   end
                   end
                   
                     always @(clk or a1 or a2)
                     begin
                     if (reset!=1 && clk == 0)                      // Getting operands from register file
                     begin                     
                     d1 = r[a1];
                     d2 = r[a2];
                     end
                     end

                     always @(posedge clk)
                     begin                                       // Storing result in the register file
                     if (reset!=1 && iswb==1 )
                     r[a3] <= d3;
                     end

endmodule

