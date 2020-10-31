module testbench();

  reg clk, reset, En;
  reg [3:0]D;
  wire [3:0]Q;

  flip_flop_4 c(clk, reset, En, D, Q);

  always
    begin
    #1 clk = ~clk;
  end

    initial begin
      #1
      $display("|clk reset En D | Q |");
      $display("-------------------");
      $monitor("|%b   %b   %b  %b | %b |",clk,reset, En, D, Q);
         clk = 0; reset = 0; En = 0; D = 4'b0000;
      #1 reset = 1;
      #1 reset = 0; En = 1;
      #1 D = 4'b0001;
      #1 D = 4'b0001;
      #1 D = 4'b0001;
      #1 D = 4'b1010;
      #1 D = 4'b1010; En = 0;
      #1 D = 4'b1010;
      #1 D = 4'b0010;
      #1 D = 4'b0010;
      #1 D = 4'b0010;
      #1 D = 4'b0100; En = 1;
      #1 D = 4'b0100;
      #1 D = 4'b1111;
      #1 D = 4'b1111;
      #1 D = 4'b1111;
      #1 D = 4'b1111;

    end

      initial
        #18 $finish;

      initial begin
        $dumpfile("FLIPFLOP4_tb.vcd");
        $dumpvars(0, testbench);
      end

endmodule //
