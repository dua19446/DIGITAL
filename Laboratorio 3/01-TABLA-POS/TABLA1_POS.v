module TABLA1_POS();


reg A, B, C;
wire a1, a2, a3, b1, b2, b3, out;

not ja1(a1, A);
not ja2(a2, B);
not ja3(a3, C);
or ja4(b1, A, B, a3);
or ja5(b2, A, a2, a3);
or ja6(b3, a1, a2, C);
and ja7(out, b1, b2, b3);

initial begin
  $display("A B C | Y");
  $monitor("%b %b %b | %b", A, B, C, out);
  A = 0; B = 0; C = 0;
  #1 C = 1;
  #1 B = 1; C = 0;
  #1 C = 1;
  #1 A = 1; B = 0; C = 0;
  #1 C = 1;
  #1 B = 1; C = 0;
  #1 C = 1;
  #1 $finish;
end

initial
   begin
      $dumpfile("TABLA1_POS_tb.vcd");
      $dumpvars(0, TABLA1_POS);
    end
endmodule

//se utilizo apio sim
