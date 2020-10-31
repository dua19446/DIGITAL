module testbench();

reg clk, reset, En;
wire Q;

FLIPT b(clk, reset, En, Q);

always
  #1 clk = ~clk;

initial begin
  #1
  $display("| Q |");
  $display("-----");
  $monitor("| %b |", Q);
     clk = 0; reset = 0; En = 1;
  #1 reset = 1; En = 1;
  #1 reset = 0; En = 1;
end

  initial
    #25 $finish;

  initial begin
    $dumpfile("FLIPFLOPT_tb.vcd");
    $dumpvars(0, testbench);
  end
  endmodule //testbench
