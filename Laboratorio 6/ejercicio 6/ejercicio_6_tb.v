module testbench();

  reg clk, reset, A, B, boton;
  wire Y, Y1, Y2, Y3;

  ejercicio_1 l1(clk, reset, A, B, Y);
  ejercici_3  l2(clk, reset, boton, Y1, Y2, Y3);

  always
    #1 clk = ~clk;


initial begin
  $display(" A B | Y");
  $display("-------------------");
  $monitor("%b %b | %b", A, B, Y);
    clk = 0; reset = 0; A = 0; B = 0;
    #1 reset = 1;
    #1 reset = 0;
    #4 A = 0; B = 0;
    #8 A = 1; B = 0;
    #16 A = 0; B = 1;
    #32 A = 1; B = 1;
    #64 A = 0; B = 0;
end

initial begin
  #130
  $display("\n\n");
  $display(" Boton | Y1 Y2 Y3");
  $display("-------------------");
  $monitor("%b | %b %b %b", boton, Y1, Y2, Y3);
    clk = 0; reset = 0; boton = 0;
    #1 reset = 1;
    #1 reset = 0;
    #3 boton = 1;
    #6 boton = 1;
    #12 boton = 1;
    #24 boton = 1;
    #48 boton = 1;
    #96 boton = 1;
    #192 boton = 1;
    #384 boton = 1;
end
initial begin
  #900$finish;
end

initial begin
    $dumpfile("ejercicio6_tb.vcd");
    $dumpvars(0, testbench);
    end
endmodule
