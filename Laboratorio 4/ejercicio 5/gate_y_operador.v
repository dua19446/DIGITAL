//Se realizo la ecuacion SOP del ejercicio 5 con gate
module gate1(input wire S, M, W, output wire out);

  wire a1, a2, b1, b2, b3;

  not (a1, M);
  not (a2, W);
  and (b1, S, a1, a2);
  and (b2, S, M, a2);
  and (b3, S, M, W);
  or (out, b1, b2, b3);

endmodule

//Se realizo la ecuacion POS del ejercicio 5 con gate
module gate2(input wire S, M, W, output wire out);

  wire a3, a4, a5, b4, b5, b6, b7, b8;

  not (a3, S);
  not (a4, M);
  not (a5, W);
  or (b4, S, M, W);
  or (b5, S, M, a5);
  or (b6, S, a4, W);
  or (b7, S, a4, a5);
  or (b8, a3, M, a5);
  and (out, b4, b5, b6, b7, b8);

endmodule

//Se realizo la ecuacion reducida del ejercicio 5 con gate
module gate3(input wire S, M, W, output wire out);

  wire a6, b9, b10;

  not (a6, W);
  and (b9, S, a6);
  and (b10, S, M);
  or (out, b9, b10);

endmodule

//se realizo la ecuacion SOP del ejercicio 5 con operadores.
module opera1(input wire S, M, W, output wire out);

 assign out = (S & ~M & ~W) | (S & M & ~W) | (S & M & W);

endmodule

//se realizo la ecuacion POS del ejercicio 5 con operadores.
module opera2(input wire S, M, W, output wire out);

  assign out = (S | M | W) & (S | M | ~W) & (S | ~M | W) & (S | ~M | ~W) & (~S | M  | ~W);

endmodule

//Se realizo la ecuacion reducida del ejercicio 5 con operadores.
module opera3(input wire S, M, W, output wire out);

  assign out = (S & ~W) | (S & M);

endmodule
