module testbench();
  reg clk, reset, En, J, K;
  wire Q;

  FLIPFLOPJK g(clk, reset, En, J, K, Q);

  always
    begin
    #1 clk = ~clk;
  end

  initial begin
    #1
    $display("| Clk reset En J K | Q |");
    $display("-------------------------");
    $monitor("| %b     %b   %b  %b %b | %b |", clk, reset, En, J, K, Q);
       clk = 0; reset = 0; En = 0; J = 0; K = 0;
    #2 reset = 1; En = 0; J = 0; K = 0;
    #2 reset = 0; En = 1; J = 0; K = 0;
    #2 En = 1; J = 1; K = 0;
    #2 En = 1; J = 0; K = 1;
    #2 En = 1; J = 1; K = 1;
    #2 En = 0; J = 0; K = 0;
    #2 En = 0; J = 0; K = 1;
    #2 En = 0; J = 1; K = 0;
  end

    initial
      #25 $finish;

    initial begin
      $dumpfile("FLIPFLOPJK_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule //testbenc
