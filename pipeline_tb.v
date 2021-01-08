`define  td 1000                   // Simulation time
`timescale 1 ns/ 1 ns

module pipeline_tb();

reg clk;
integer ind1,i2,i3;
reg [64:0] buffer[32'h1000:0];
integer file,filem,temp,count=0;

 pipeline  p (.clk(clk));

initial 
       begin
       clk  = 0;
       i2=1;
       i3=0;
       p.reset=1;
       
       
       
//$monitor("t=%t Clk=%b pc=%d In=%h %h %h %h %h",$time,clk,p.pc_current,p.instruction,p.pr1.instruction,p.pr1.instruction,p.pr1.instruction,p.pr1.instruction);
                   // $monitor ("in=%h r1=%h r2=%h r4=%h",p.instruction,p.rf1.r[1],p.rf1.r[2],p.rf1.r[4]);
                 
                
                    $display ( "\t\t\t Output File : Updated_data\n");
                   
                 
                     filem = $fopen("Input_memory","r");
                     temp = $fgetc(filem);
                     while (!$feof(filem))
                     begin
                     if (temp == "\n")
                     count=count+1;
                     temp = $fgetc(filem); 
                     end       
                     $readmemh("Input_memory",buffer,0,count*2-1);
                     for(ind1 = 0;ind1 < 32'h1000;ind1 = ind1 + 1)
                     begin
                     if (i3 == 4)
                     begin      
                     i3 = 0;
                     i2 = i2 + 2 ;
                     end
                     p.m1.mem[ind1] = buffer [i2] [8*i3 +: 8];
                     i3 = i3 + 1;
                     
                     end
                     $display ("\t\t\t Total no. of instructions = %d\n \t\t\t Simulation Time = %d ns\n",count,`td);
                     
                    
       #1 p.reset = 0;
       
       # `td
       $finish;
       
       end
      
       initial 
       begin
       #`td
       file=$fopen("Updated_data","w");
       $fdisplay(file,"\t------------------Registers Updated-----------------\t\n");
       for (ind1=0;ind1<16;ind1=ind1+1)
       begin
       $fdisplay(file,"\tr=[%d] = %h\n",ind1,p.rf1.r[ind1]);
       end 
       $fdisplay(file,"\n\t------------------Memory Updated-----------------\t\n");
       for(ind1 = 0;ind1 < 32'h1000;ind1 = ind1 + 1)
       begin
       $fdisplay(file,"\tA=%h D=%h \n",ind1,p.m1.mem[ind1]);
       end
       $fclose(file);
       
       end
       
       always 
       begin
       # 5 clk = ~clk;
       end
       
       endmodule

