module testbench();

reg r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12,r13, r14, r15;
reg r16, r17, r18;
wire led0, led1, led2, led3, led4, led5;

E1T1M8 l1(r1, r2, r3, led0);
E1T1M4 l2(r4, r5, r6, led1);
E1T1M2 l3(r7, r8, r9, led2);
E1T2M8 l4(r10, r11, r12, led3);
E1T2M4 l5(r13, r14, r15, led4);
E1T2M2 l6(r16, r17, r18, led5);

initial begin //Mux 8:1 del ejercicio 1 de la tabla 1
  $display("\n\n");
  $display("A B C | Y");
  $display("------|---");
  $monitor("%b %b %b | %b", r1, r2, r3, led0);
      r1 = 0; r2 = 0; r3 = 0;
    #1r1 = 0; r2 = 0; r3 = 1;
    #1r1 = 0; r2 = 1; r3 = 0;
    #1r1 = 0; r2 = 1; r3 = 1;
    #1r1 = 1; r2 = 0; r3 = 0;
    #1r1 = 1; r2 = 0; r3 = 1;
    #1r1 = 1; r2 = 1; r3 = 0;
    #1r1 = 1; r2 = 1; r3 = 1;
end

initial begin//el Mux 4:1 del ejercicio 1 de la tabla 1
  #8
  $display("\n\n");
  $display("A B C | Y");
  $display("------|---");
  $monitor("%b %b %b | %b", r4, r5, r6, led1);
      r4 = 0; r5 = 0; r6 = 0;
    #1r4 = 0; r5 = 0; r6 = 1;
    #1r4 = 0; r5 = 1; r6 = 0;
    #1r4 = 0; r5 = 1; r6 = 1;
    #1r4 = 1; r5 = 0; r6 = 0;
    #1r4 = 1; r5 = 0; r6 = 1;
    #1r4 = 1; r5 = 1; r6 = 0;
    #1r4 = 1; r5 = 1; r6 = 1;

end

initial begin//el Mux 2:1 del ejercicio 1 de la tabla 1
  #16
  $display("\n\n");
  $display("A B C | Y");
  $display("------|---");
  $monitor("%b %b %b | %b", r7, r8, r9, led2);
      r7 = 0; r8 = 0; r9 = 0;
    #1r7 = 0; r8 = 0; r9 = 1;
    #1r7 = 0; r8 = 1; r9 = 0;
    #1r7 = 0; r8 = 1; r9 = 1;
    #1r7 = 1; r8 = 0; r9 = 0;
    #1r7 = 1; r8 = 0; r9 = 1;
    #1r7 = 1; r8 = 1; r9 = 0;
    #1r7 = 1; r8 = 1; r9 = 1;
end

initial begin//Mux 8:1 del ejercicio 1 de la tabla 2
  #24
  $display("\n\n");
  $display("A B C | Y");
  $display("------|---");
  $monitor("%b %b %b | %b", r10, r11, r12, led3);
      r10 = 0; r11 = 0; r12 = 0;
    #1r10 = 0; r11 = 0; r12 = 1;
    #1r10 = 0; r11 = 1; r12 = 0;
    #1r10 = 0; r11 = 1; r12 = 1;
    #1r10 = 1; r11 = 0; r12 = 0;
    #1r10 = 1; r11 = 0; r12 = 1;
    #1r10 = 1; r11 = 1; r12 = 0;
    #1r10 = 1; r11 = 1; r12 = 1;
end

initial begin////Mux 4:1 del ejercicio 1 de la tabla 2
  #32
  $display("\n\n");
  $display("A B C | Y");
  $display("------|---");
  $monitor("%b %b %b | %b", r13, r14, r15, led4);
      r13 = 0; r14 = 0; r15 = 0;
    #1r13 = 0; r14 = 0; r15 = 1;
    #1r13 = 0; r14 = 1; r15 = 0;
    #1r13 = 0; r14 = 1; r15 = 1;
    #1r13 = 1; r14 = 0; r15 = 0;
    #1r13 = 1; r14 = 0; r15 = 1;
    #1r13 = 1; r14 = 1; r15 = 0;
    #1r13 = 1; r14 = 1; r15 = 1;
end
initial begin//Mux 2:1 del ejercicio 1 de la tabla 2
  #40
  $display("\n\n");
  $display("A B C | Y");
  $display("------|---");
  $monitor("%b %b %b | %b", r16, r17, r18, led5);
      r16 = 0; r17 = 0; r18 = 0;
    #1r16 = 0; r17 = 0; r18 = 1;
    #1r16 = 0; r17 = 1; r18 = 0;
    #1r16 = 0; r17 = 1; r18 = 1;
    #1r16 = 1; r17 = 0; r18 = 0;
    #1r16 = 1; r17 = 0; r18 = 1;
    #1r16 = 1; r17 = 1; r18 = 0;
    #1r16 = 1; r17 = 1; r18 = 1;
end

initial begin
    $dumpfile("Ejercicio4_tb.vcd");
    $dumpvars(0, testbench);
  end

initial
    #48$finish;




endmodule
