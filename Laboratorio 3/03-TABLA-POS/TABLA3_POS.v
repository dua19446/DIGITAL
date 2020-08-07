module TABLA3_POS();


reg A, B, C, D;
wire a0,a1, a2, a3, b1, b2, b3, b4, b5, b6, b7, b8, b9, out;

not ja0(a0, D);
not ja1(a1, A);
not ja2(a2, B);
not ja3(a3, C);
or ja4(b1, A, a2, C, D);
or ja5(b2, A, a2, C, a0);
or ja6(b3, A, a2, a3, D);
or ja7(b4, A, a2, a3, a0);
or ja8(b5, a1, B, C, a0);
or ja9(b6, a1, B, a3, a0);
or ja10(b7, a1, a2, C, D);
or ja11(b8, a1, a2, C, a0);
or ja12(b9, a1, a2, a3, a0);
and ja13(out, b1, b2, b3, b4, b5, b6, b7, b8, b9);

initial begin
  $display("A B C D | Y");
  $monitor("%b %b %b %b | %b", A, B, C, D, out);
  A = 0; B = 0; C = 0; D = 0;
  #1 D=1;
  #1 C=1; D=0;
  #1 D=1;
  #1 B=1; C=0; D=0;
  #1 D=1;
  #1 C=1; D=0;
  #1 D=1;
  #1 A=1; B=0; C=0; D=0;
  #1 D=1;
  #1 C=1; D=0;
  #1 D=1;
  #1 B=1; C=0; D=0;
  #1 D=1;
  #1 C=1; D=0;
  #1 D=1;
  #1 $finish;
end

initial
    begin
      $dumpfile("TABLA3_POS_tb.vcd");
      $dumpvars(0, TABLA3_POS);
    end
endmodule

//Se utilza apio sim
