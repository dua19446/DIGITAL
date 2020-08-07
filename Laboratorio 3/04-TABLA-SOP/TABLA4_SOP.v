module TABLA4_SOP();


reg A, B, C, D;
wire a0, a1, a2, a3, b1, b2, b3, b4, b5, b6, b7, out;

not ja0(a0, D);
not ja1(a1, A);
not ja2(a2, B);
not ja3(a3, C);
and ja4(b1, a1, a2, a3, a0);
and ja5(b2, a1, a2, C, a0);
and ja6(b3, a1, a2, C, D);
and ja7(b4, a1, B, C, a0);
and ja8(b5, a1, B, C, D);
and ja9(b6, A, a2, a3, a0);
and ja10(b7, A, a2, C, a0);
or ja13(out, b1, b2, b3, b4, b5, b6, b7);

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
      $dumpfile("TABLA4_SOP_tb.vcd");
      $dumpvars(0, TABLA4_SOP);
    end
endmodule

// Se utiliza apio sim
