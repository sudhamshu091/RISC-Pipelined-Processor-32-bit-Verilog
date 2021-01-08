module  operand_fetch( instruction, pc_current,isret,isst,opcode, I, immx,branchtarget,op1,op2,rd); 
        
input [31:0] instruction,pc_current;
input isret,isst;
output [4:0] opcode;
output I;
output [3:0] rd;
output [31:0] immx,branchtarget,op1,op2;

wire [31:0] Instuction,pc_current;
wire isret,isst;
reg [4:0] opcode;
reg I;
reg [3:0] rd;
reg [31:0] immx,branchtarget,op1,op2;
reg  signed [15:0] imm_temp;
reg signed [26:0] branch_temp;


 
            always @(*)
 
            begin
            branch_temp = instruction[26:0];
            opcode      = instruction[31:27];
            rd          = instruction[25:22];
            I           = instruction[26];
            imm_temp    = instruction[15:0];
            if (I==1)
            begin
            if (instruction[17:16] == 2'b00)
            begin
            immx        = imm_temp;
            end
            else if (instruction[17:16] == 2'b01)      // u      
            begin
            immx        = 32'd0;
            immx        = immx + instruction[15:0];
            end
            else if (instruction[17:16] == 2'b10)     // H
            begin
            immx        = 32'd0;
            immx        = immx + instruction[15:0];
            immx        = immx << 16;
            end
            end
       
           
           branch_temp  = branch_temp << 2;
           branchtarget = branch_temp;
           branchtarget = branchtarget + pc_current;
        
           
           if (isret == 1)
           begin
           p.a1 = 4'b1111;
           end
           else 
           begin
           p.a1 = instruction[21:18];
           end
           if ( isst == 1 )
           begin
           p.a2 = instruction[25:22];
           end
           else
           begin
           p.a2 = instruction[17:14];
           end
           op1 = p.d1;
           op2 = p.d2;
           end
           
          endmodule   

