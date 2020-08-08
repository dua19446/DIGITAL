module testbench();
  reg ja1, ja2, ja3, ja4, ja5, ja6, ja7, ja8, ja9, ja10, ja11, ja12, ja13, ja14;
  reg ja15, ja16, ja17, ja18, ja19, ja20, ja21, jo1, jo2, jo3, jo4, jo5, jo6, jo7;
  wire led, led1, led2, led3, led4, led5, led6, led7;

  gatelevel G(ja1, ja2, ja3, led);
  gatelevel2 G1(ja4, ja5, ja6, ja7, led1);
  gatelevel3 G2(ja8, ja9, ja10, ja11, led2);
  gatelevel4 G3(ja12, ja13, ja14, led3);
  operador1 OP1(ja15, ja16, ja17, led4);
  operador2 OP2(ja18, ja19, ja20, ja21, led5);
  operador3 OP3(jo1, jo2, jo3, jo4, led6);
  operador4 OP4(jo5, jo6, jo7, led7);

  initial begin //gatelevel
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", ja1, ja2, ja3, led);
      ja1 = 0; ja2 = 0; ja3 = 0;
    #1ja1 = 0; ja2 = 0; ja3 = 1;
    #1ja1 = 0; ja2 = 1; ja3 = 0;
    #1ja1 = 0; ja2 = 1; ja3 = 1;
    #1ja1 = 1; ja2 = 0; ja3 = 0;
    #1ja1 = 1; ja2 = 0; ja3 = 1;
    #1ja1 = 1; ja2 = 1; ja3 = 0;
    #1ja1 = 1; ja2 = 1; ja3 = 1;
  end

  initial begin //gatelevel2
    #8
    $display("\n\n");
    $display("A B C D | Y");
    $display("--------|---");
    $monitor("%b %b %b %b | %b", ja4, ja5, ja6, ja7, led1);
      ja4 = 0; ja5 = 0; ja6 = 0; ja7 = 0;
    #1ja4 = 0; ja5 = 0; ja6 = 0; ja7 = 1;
    #1ja4 = 0; ja5 = 0; ja6 = 1; ja7 = 0;
    #1ja4 = 0; ja5 = 0; ja6 = 1; ja7 = 1;
    #1ja4 = 0; ja5 = 1; ja6 = 0; ja7 = 0;
    #1ja4 = 0; ja5 = 1; ja6 = 0; ja7 = 1;
    #1ja4 = 0; ja5 = 1; ja6 = 1; ja7 = 0;
    #1ja4 = 0; ja5 = 1; ja6 = 1; ja7 = 1;
    #1ja4 = 1; ja5 = 0; ja6 = 0; ja7 = 0;
    #1ja4 = 1; ja5 = 0; ja6 = 0; ja7 = 1;
    #1ja4 = 1; ja5 = 0; ja6 = 1; ja7 = 0;
    #1ja4 = 1; ja5 = 0; ja6 = 1; ja7 = 1;
    #1ja4 = 1; ja5 = 1; ja6 = 0; ja7 = 0;
    #1ja4 = 1; ja5 = 1; ja6 = 0; ja7 = 1;
    #1ja4 = 1; ja5 = 1; ja6 = 1; ja7 = 0;
    #1ja4 = 1; ja5 = 1; ja6 = 1; ja7 = 1;
    end

  initial begin //gatelevel3
    #24
    $display("\n\n");
    $display("A B C D | Y");
    $display("--------|---");
    $monitor("%b %b %b %b | %b", ja8, ja9, ja10, ja11, led2);
      ja8 = 0; ja9 = 0; ja10 = 0; ja11 = 0;
    #1ja8 = 0; ja9 = 0; ja10 = 0; ja11 = 1;
    #1ja8 = 0; ja9 = 0; ja10 = 1; ja11 = 0;
    #1ja8 = 0; ja9 = 0; ja10 = 1; ja11 = 1;
    #1ja8 = 0; ja9 = 1; ja10 = 0; ja11 = 0;
    #1ja8 = 0; ja9 = 1; ja10 = 0; ja11 = 1;
    #1ja8 = 0; ja9 = 1; ja10 = 1; ja11 = 0;
    #1ja8 = 0; ja9 = 1; ja10 = 1; ja11 = 1;
    #1ja8 = 1; ja9 = 0; ja10 = 0; ja11 = 0;
    #1ja8 = 1; ja9 = 0; ja10 = 0; ja11 = 1;
    #1ja8 = 1; ja9 = 0; ja10 = 1; ja11 = 0;
    #1ja8 = 1; ja9 = 0; ja10 = 1; ja11 = 1;
    #1ja8 = 1; ja9 = 1; ja10 = 0; ja11 = 0;
    #1ja8 = 1; ja9 = 1; ja10 = 0; ja11 = 1;
    #1ja8 = 1; ja9 = 1; ja10 = 1; ja11 = 0;
    #1ja8 = 1; ja9 = 1; ja10 = 1; ja11 = 1;
  end

  initial begin //gatelevel4
    #40
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", ja12, ja13, ja14, led3);
      ja12 = 0 ; ja13 = 0; ja14 = 0;
    #1ja12 = 0 ; ja13 = 0; ja14 = 1;
    #1ja12 = 0 ; ja13 = 1; ja14 = 0;
    #1ja12 = 0 ; ja13 = 1; ja14 = 1;
    #1ja12 = 1 ; ja13 = 0; ja14 = 0;
    #1ja12 = 1 ; ja13 = 0; ja14 = 1;
    #1ja12 = 1 ; ja13 = 1; ja14 = 0;
    #1ja12 = 1 ; ja13 = 1; ja14 = 1;
  end

  initial begin //operador1
    #48
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", ja15, ja16, ja17, led4);
      ja15 = 0; ja16 = 0; ja17 = 0;
    #1ja15 = 0; ja16 = 0; ja17 = 1;
    #1ja15 = 0; ja16 = 1; ja17 = 0;
    #1ja15 = 0; ja16 = 1; ja17 = 1;
    #1ja15 = 1; ja16 = 0; ja17 = 0;
    #1ja15 = 1; ja16 = 0; ja17 = 1;
    #1ja15 = 1; ja16 = 1; ja17 = 0;
    #1ja15 = 1; ja16 = 1; ja17 = 1;
  end

  initial begin //operator2
    #56
    $display("\n\n");
    $display("A B C D | Y");
    $display("--------|---");
    $monitor("%b %b %b %b | %b", ja18, ja19, ja20, ja21, led5);
      ja18 = 0; ja19 = 0; ja20 = 0; ja21 = 0;
    #1ja18 = 0; ja19 = 0; ja20 = 0; ja21 = 1;
    #1ja18 = 0; ja19 = 0; ja20 = 1; ja21 = 0;
    #1ja18 = 0; ja19 = 0; ja20 = 1; ja21 = 1;
    #1ja18 = 0; ja19 = 1; ja20 = 0; ja21 = 0;
    #1ja18 = 0; ja19 = 1; ja20 = 0; ja21 = 1;
    #1ja18 = 0; ja19 = 1; ja20 = 1; ja21 = 0;
    #1ja18 = 0; ja19 = 1; ja20 = 1; ja21 = 1;
    #1ja18 = 1; ja19 = 0; ja20 = 0; ja21 = 0;
    #1ja18 = 1; ja19 = 0; ja20 = 0; ja21 = 1;
    #1ja18 = 1; ja19 = 0; ja20 = 1; ja21 = 0;
    #1ja18 = 1; ja19 = 0; ja20 = 1; ja21 = 1;
    #1ja18 = 1; ja19 = 1; ja20 = 0; ja21 = 0;
    #1ja18 = 1; ja19 = 1; ja20 = 0; ja21 = 1;
    #1ja18 = 1; ja19 = 1; ja20 = 1; ja21 = 0;
    #1ja18 = 1; ja19 = 1; ja20 = 1; ja21 = 1;
  end

  initial begin //operator3
    #72
    $display("\n\n");
    $display("A B C D | Y");
    $display("--------|---");
    $monitor("%b %b %b %b | %b", jo1, jo2, jo3, jo4, led6);
      jo1 = 0; jo2 = 0; jo3 = 0; jo4 = 0;
    #1jo1 = 0; jo2 = 0; jo3 = 0; jo4 = 1;
    #1jo1 = 0; jo2 = 0; jo3 = 1; jo4 = 0;
    #1jo1 = 0; jo2 = 0; jo3 = 1; jo4 = 1;
    #1jo1 = 0; jo2 = 1; jo3 = 0; jo4 = 0;
    #1jo1 = 0; jo2 = 1; jo3 = 0; jo4 = 1;
    #1jo1 = 0; jo2 = 1; jo3 = 1; jo4 = 0;
    #1jo1 = 0; jo2 = 1; jo3 = 1; jo4 = 1;
    #1jo1 = 1; jo2 = 0; jo3 = 0; jo4 = 0;
    #1jo1 = 1; jo2 = 0; jo3 = 0; jo4 = 1;
    #1jo1 = 1; jo2 = 0; jo3 = 1; jo4 = 0;
    #1jo1 = 1; jo2 = 0; jo3 = 1; jo4 = 1;
    #1jo1 = 1; jo2 = 1; jo3 = 0; jo4 = 0;
    #1jo1 = 1; jo2 = 1; jo3 = 0; jo4 = 1;
    #1jo1 = 1; jo2 = 1; jo3 = 1; jo4 = 0;
    #1jo1 = 1; jo2 = 1; jo3 = 1; jo4 = 1;
  end

  initial begin //operador4
    #88
    $display("\n\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", jo5, jo6, jo7, led7);
      jo5 = 0; jo6 = 0; jo7 = 0;
    #1jo5 = 0; jo6 = 0; jo7 = 1;
    #1jo5 = 0; jo6 = 1; jo7 = 0;
    #1jo5 = 0; jo6 = 1; jo7 = 1;
    #1jo5 = 1; jo6 = 0; jo7 = 0;
    #1jo5 = 1; jo6 = 0; jo7 = 1;
    #1jo5 = 1; jo6 = 1; jo7 = 0;
    #1jo5 = 1; jo6 = 1; jo7 = 1;
  end

  initial
    #96$finish;

  initial begin
    $dumpfile("Gate_level_y_operadores_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
