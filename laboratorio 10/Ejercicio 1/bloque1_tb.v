module testbench();

reg clk, reset, En1, En2, load;
reg [11:0]D;
wire [7:0]Program_byte;
wire [3:0]instr, oprnd;

EJERCICIO1 a1(clk, reset, En1, En2, load, D, Program_byte, instr, oprnd);

  always
    begin
    #1 clk = ~clk;
  end

  initial begin
  #1
  $display("---------------------------------------|----------------------------|");
  $display(" clk reset En1 En2  load         D      |  Program_byte instr oprnd  |");
  $display("---------------------------------------|----------------------------|");
  $monitor("%b    %b    %b    %b     %b    %b |    %b   %b   %b  |", clk, reset, En1, En2, load, D, Program_byte, instr, oprnd);
     clk = 0; reset = 0; En1 = 0; En2 = 0; D = 12'b000000000000; load = 0;
  #1 reset = 1; En1 = 0; En2 = 0;
  #1 reset = 0; En1 = 1; En2 = 1;
  #1 reset = 0; En1 = 1; En2 = 1;
  #1 reset = 0; En1 = 1; En2 = 1;
  #1 reset = 0; En1 = 1; En2 = 1;
  #1 reset = 0; En1 = 1; En2 = 1; load = 1; D = 12'b000000000100;
  #1 reset = 0; En1 = 1; En2 = 1; load = 0; D = 12'b000000000000;
  #1 reset = 0; En1 = 1; En2 = 1; load = 0; D = 12'b000000000000;
  #1 reset = 0; En1 = 1; En2 = 1; load = 0; D = 12'b000000000000;
  #1 reset = 0; En1 = 0; En2 = 0; load = 0; D = 12'b000000000000;
  #1 reset = 0; En1 = 0; En2 = 0; load = 0; D = 12'b000000000000;
  #1 reset = 0; En1 = 0; En2 = 0; load = 0; D = 12'b000000000000;


  end

  initial
   #14 $finish;

  initial begin
    $dumpfile("bloque1_tb.vcd");
    $dumpvars(0, testbench);
  end


endmodule
