module testbench();
  reg fa1, fa2, fa3, fa4, fa5, fa6, fa7, fa8, fa9, fa10, fa11, fa12;
  reg fa13, fa14, fa15,fa16, fa17, fa18;
  wire led, led1, led2, led3, led4, led5;

  gate1 GA(fa1, fa2, fa3, led);
  gate2 GO(fa4, fa5, fa6, led1);
  gate3 GE(fa7, fa8, fa9, led2);
  opera1 JA(fa10, fa11, fa12, led3);
  opera2 JO(fa13, fa14, fa15, led4);
  opera3 JE(fa16, fa17, fa18, led5);

  initial begin //gate1
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", fa1, fa2, fa3, led);
      fa1 = 0; fa2 = 0; fa3 = 0;
    #1fa1 = 0; fa2 = 0; fa3 = 1;
    #1fa1 = 0; fa2 = 1; fa3 = 0;
    #1fa1 = 0; fa2 = 1; fa3 = 1;
    #1fa1 = 1; fa2 = 0; fa3 = 0;
    #1fa1 = 1; fa2 = 0; fa3 = 1;
    #1fa1 = 1; fa2 = 1; fa3 = 0;
    #1fa1 = 1; fa2 = 1; fa3 = 1;
  end

  initial begin //gate2
    #8
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", fa4, fa5, fa6, led1);
      fa4 = 0; fa5 = 0; fa6 = 0;
    #1fa4 = 0; fa5 = 0; fa6 = 1;
    #1fa4 = 0; fa5 = 1; fa6 = 0;
    #1fa4 = 0; fa5 = 1; fa6 = 1;
    #1fa4 = 1; fa5 = 0; fa6 = 0;
    #1fa4 = 1; fa5 = 0; fa6 = 1;
    #1fa4 = 1; fa5 = 1; fa6 = 0;
    #1fa4 = 1; fa5 = 1; fa6 = 1;
  end

  initial begin//gate3
    #16
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", fa7, fa8, fa9, led2);
      fa7 = 0; fa8 = 0; fa9 = 0;
    #1fa7 = 0; fa8 = 0; fa9 = 1;
    #1fa7 = 0; fa8 = 1; fa9 = 0;
    #1fa7 = 0; fa8 = 1; fa9 = 1;
    #1fa7 = 1; fa8 = 0; fa9 = 0;
    #1fa7 = 1; fa8 = 0; fa9 = 1;
    #1fa7 = 1; fa8 = 1; fa9 = 0;
    #1fa7 = 1; fa8 = 1; fa9 = 1;
  end

  initial begin//opera1
    #24
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", fa10, fa11, fa12, led3);
      fa10 = 0; fa11 = 0; fa12 = 0;
    #1fa10 = 0; fa11 = 0; fa12 = 1;
    #1fa10 = 0; fa11 = 1; fa12 = 0;
    #1fa10 = 0; fa11 = 1; fa12 = 1;
    #1fa10 = 1; fa11 = 0; fa12 = 0;
    #1fa10 = 1; fa11 = 0; fa12 = 1;
    #1fa10 = 1; fa11 = 1; fa12 = 0;
    #1fa10 = 1; fa11 = 1; fa12 = 1;
  end

  initial begin//opera2
    #32
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", fa13, fa14, fa15, led4);
      fa13 = 0; fa14 = 0; fa15 = 0;
    #1fa13 = 0; fa14 = 0; fa15 = 1;
    #1fa13 = 0; fa14 = 1; fa15 = 0;
    #1fa13 = 0; fa14 = 1; fa15 = 1;
    #1fa13 = 1; fa14 = 0; fa15 = 0;
    #1fa13 = 1; fa14 = 0; fa15 = 1;
    #1fa13 = 1; fa14 = 1; fa15 = 0;
    #1fa13 = 1; fa14 = 1; fa15 = 1;
  end

  initial begin//opera3
    #40
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", fa16, fa17, fa18, led5);
      fa16 = 0; fa17 = 0; fa18 = 0;
    #1fa16 = 0; fa17 = 0; fa18 = 1;
    #1fa16 = 0; fa17 = 1; fa18 = 0;
    #1fa16 = 0; fa17 = 1; fa18 = 1;
    #1fa16 = 1; fa17 = 0; fa18 = 0;
    #1fa16 = 1; fa17 = 0; fa18 = 1;
    #1fa16 = 1; fa17 = 1; fa18 = 0;
    #1fa16 = 1; fa17 = 1; fa18 = 1;
  end

  initial
    #48$finish;

  initial begin
    $dumpfile("gate_y_operador_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
