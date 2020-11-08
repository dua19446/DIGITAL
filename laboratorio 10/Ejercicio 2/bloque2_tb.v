module testbench();

reg clk, reset, EN_BUS1, EN_BUS2, EN_ACU;
reg [2:0]selct;
reg [3:0]D;
wire carry, zero;
wire [3:0]salida;

ejercicio2 a2(clk, reset, EN_BUS1, EN_BUS2, EN_ACU, selct,
  D, carry, zero, salida);

  always
    begin
    #1 clk = ~clk;
  end

  initial begin
  #1
  $display("--------------------------------------------------|--------------------|");
  $display(" clk reset EN_BUS1 EN_BUS2 EN_ACU    D   SELECTOR  |  ZERO CARRY SALIDA |");
  $display("--------------------------------------------------|--------------------|");
  $monitor("%b    %b       %b       %b       %b    %b    %b     |    %b    %b    %b  |", clk, reset, EN_BUS1, EN_BUS2, EN_ACU, D, selct, zero, carry, salida);
     clk = 0; reset = 0; EN_BUS1 = 0; EN_BUS2 = 0; EN_ACU = 0; D = 4'b0000; selct = 3'b000;
  #1 reset = 1; EN_BUS1 = 0; EN_BUS2 = 0; EN_ACU = 0;
  #1 reset = 0; EN_BUS1 = 1; EN_BUS2 = 1; EN_ACU = 1; selct = 3'b010; D = 4'b1000;
  #1 reset = 0; EN_BUS1 = 1; EN_BUS2 = 1; EN_ACU = 1; selct = 3'b010; D = 4'b1000;
  #1 reset = 0; EN_BUS1 = 1; EN_BUS2 = 1; EN_ACU = 1; selct = 3'b010; D = 4'b1000;
  #1 reset = 0; EN_BUS1 = 1; EN_BUS2 = 1; EN_ACU = 1; selct = 3'b011; D = 4'b1000;
  #1 reset = 0; EN_BUS1 = 1; EN_BUS2 = 1; EN_ACU = 1; selct = 3'b011; D = 4'b1000;
  #1 reset = 0; EN_BUS1 = 1; EN_BUS2 = 1; EN_ACU = 1; selct = 3'b010; D = 4'b0001;
  #1 reset = 0; EN_BUS1 = 1; EN_BUS2 = 1; EN_ACU = 1; selct = 3'b010; D = 4'b0001;
  #1 reset = 0; EN_BUS1 = 1; EN_BUS2 = 1; EN_ACU = 1; selct = 3'b001; D = 4'b0001;
  end

  initial
   #10 $finish;


  initial begin
    $dumpfile("bloque2_tb.vcd");
    $dumpvars(0, testbench);
  end
endmodule //
