module testbench();

reg [3:0]variable1;
reg [3:0]variable2;
reg [2:0]comando;
wire [3:0]respuesta;

ALU c(variable1,variable2,comando,respuesta);

initial begin
  #1
  $display("|---------|-----------|------------|-----------|");
  $display("| Comando | Variable1 | Varaiable2 | Respuesta |");
  $display("|---------|-----------|------------|-----------|");
  $monitor("|   %b   |   %b    |     %b   |    %b   |", comando,variable1,variable2,respuesta);
       comando = 3'b000; variable1 = 4'b0010; variable2 = 4'b1100;
    #1 comando = 3'b001; variable1 = 4'b0011; variable2 = 4'b1010;
    #1 comando = 3'b010; variable1 = 4'b0110; variable2 = 4'b0000;
    #1 comando = 3'b011; variable1 = 4'b0101; variable2 = 4'b1000;
    #1 comando = 3'b100; variable1 = 4'b0001; variable2 = 4'b0110;
    #1 comando = 3'b101; variable1 = 4'b1110; variable2 = 4'b0111;
    #1 comando = 3'b110; variable1 = 4'b1111; variable2 = 4'b1100;
    #1 comando = 3'b111; variable1 = 4'b0001; variable2 = 4'b0000;

end
initial
  #10 $finish;

initial begin
  $dumpfile("Alejandro-Duarte-19446-21-ALU_tb.vcd");
  $dumpvars(0, testbench);
end


endmodule
