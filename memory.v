module memory(am1,am2,dm3, rw,dm1,dm2);

input [31:0] am1,am2,dm3;
input rw;
output [31:0] dm1,dm2;

wire [31:0] am1,am2,dm3;
wire rw;
reg [31:0] dm1,dm2;
reg [7:0] mem [16'h1000:0];
integer ind;
reg [31:0] a1,a2;
 
always @(am1)
            begin
            a1   =  am1;
            for(ind=0;ind<4;ind=ind+1)
            begin
            dm1[8*ind +: 8] =  mem[a1];
            a1 = a1 + 1 ;
            end
            end

always @(am2)      
                            
            begin
            a2  =  am2;
            if (rw == 0)
            begin
            for(ind=0;ind<4;ind=ind+1)
            begin
            dm2[8*ind +: 8] =  mem[a2];
            a2 = a2 + 1 ;
            end
            end
else if (rw == 1)
            begin
            for(ind=0;ind<4;ind=ind+1)
            begin
            mem[a2] <= dm3[8*ind +: 8];
            a2 = a2 + 1;
            end

            end
            end

endmodule

