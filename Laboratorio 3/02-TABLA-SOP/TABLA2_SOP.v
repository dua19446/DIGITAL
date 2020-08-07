module TABLA2_SOP();


reg A, B, C;
wire a1, a2, a3, b1, b2, b3, out;

not ja1(a1, A);
not ja2(a2, B);
not ja3(a3, C);
and ja4(b1, a1, a2, C);
and ja5(b2, A, B, a3);
and ja6(b3, A, B, C);
or  ja9(out, b1, b2, b3);

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
      $dumpfile("TABLA2_SOP_tb.vcd");
      $dumpvars(0, TABLA2_SOP);
    end  
endmodule

//Se utiliza apio sim
