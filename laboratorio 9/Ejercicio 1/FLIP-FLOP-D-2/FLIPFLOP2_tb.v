module testbench ();

  reg clk, reset, En;
  reg [1:0]D;
  wire [1:0]Q;

  flip_flop_2 b(clk, reset, En, D, Q);

  always
  #1 clk = ~clk;

  initial begin
    #1
    $display("|clk reset En  D | Q |");
    $display("-------------------");
    $monitor("|  %b   %b   %b  %b | %b |",clk, reset, En, D, Q);
      clk = 0; reset = 0; En = 0; D = 2'b00;
    #1 reset = 1; En = 0; D = 2'b00;
    #1 reset = 0; En = 1; D = 2'b01;
    #1 reset = 0; En = 1; D = 2'b10;
    #1 reset = 0; En = 1; D = 2'b10;
    #1 reset = 0; En = 1; D = 2'b10;
    #1 reset = 0; En = 1; D = 2'b11;
    #1 reset = 0; En = 1; D = 2'b11;
    #1 reset = 0; En = 1; D = 2'b11;
    #1 reset = 0; En = 1; D = 2'b11;
    #1 reset = 0; En = 0; D = 2'b01;
    #1 reset = 0; En = 0; D = 2'b01;
    #1 reset = 0; En = 0; D = 2'b01;
    #1 reset = 0; En = 0; D = 2'b01;
    #1 reset = 0; En = 0; D = 2'b10;
  end

  initial
    #15 $finish;

  initial begin
    $dumpfile("FLIPFLOP2_tb.vcd");
    $dumpvars(0, testbench);
  end
endmodule //testbench
