module testbench();

  reg clk, reset, En, D;
  wire Q;

  flip_flop a(clk, reset, En, D, Q);

  always
    begin
    #1 clk = ~clk;
  end

  initial begin
  #1
  $display("-------------------|-----|");
  $display(" clk  En  reset  D  |  Q  |");
  $display("-------------------|-----|");
  $monitor("%b    %b    %b    %b   |  %b  |", clk, En, reset, D, Q);
    clk = 0; reset = 0; En = 0; D = 0;
  #1 reset = 1; En = 0; D = 0;
  #1 reset = 0; En = 1; D = 0;
  #1 D = 1;
  #1 D = 0;
  #1 D = 0;
  #1 D = 1;
  #1 D = 1;
  #1 D = 1;
  #1 D = 0;
  #1 D = 0;
  #1 D = 0;
  #1 En = 0;
  #1 D = 1;
  #1 D = 1;
  #1 D = 1;

end

  initial
   #16 $finish;

  initial begin
    $dumpfile("FLIPFLOP_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule //
