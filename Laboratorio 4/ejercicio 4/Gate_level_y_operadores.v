//Se realizo la ecuacion reducida de la tabla 02 del ejercicio 1
module gatelevel(input wire A, B, C, output wire out);

  not (out, B);

endmodule

//Se realiza la ecuacion reducida de la tabla 03 del ejercicio 1
module gatelevel2(input wire A, B, C, D, output out);

  wire a1, a2, a3, a4, b1, b2, b3, b4, b5, b6, b7, b8;

  not (a1, A);
  not (a2, B);
  not (a3, C);
  not (a4, D);
  and (b1, a1, a2, a3, a4);
  and (b2, a1, a2, C, D);
  and (b3, a1, B, a3, D);
  and (b4, a1, B, C, a4);
  and (b5, A, B, a3, a4);
  and (b6, A, B, C, D);
  and (b7, A, a2, a3, D);
  and (b8, A, a2, C, a4);
  or (out, b1, b2, b3, b4, b5, b6, b7, b8);

endmodule

// Se realizo la ecuacion reducida de la ecuacion 1 del ejercicio 2
module gatelevel3(input wire A, B, C, D, output out);

  wire c1, c2, c3, c4, d1, d2, d3, d4;

  not (c1, A);
  not (c2, B);
  not (c3, C);
  not (c4, D);
  and (d1, A, c3);
  and (d2, A, c4);
  and (d3, A, c2);
  and (d4, c2, c3, c4);
  or (out, d1, d2, d3, d4);

endmodule

// Se realizo la ecuacion reducida de la ecuacion 2 del ejercicio 2
module gatelevel4(input wire A, B, C, output out);

  wire e1;

  not (e1, B);
  or (out, e1, C);

endmodule

// Se realizo la ecuacion reducida de la tabla 01 del ejercicio 1
module operador1(input wire A, B, C, output wire out);

  assign out = (A & C) | (~A & ~C) | (~B & ~C);

endmodule

// Se realizo la ecuacion reducida de la tabla 04 del ejercicio 1
module operador2(input wire A, B, C, D, output wire out);

  assign out = (B & D) | (A & ~D) | (A & C);

endmodule

// Se realizo la ecuacion reducida de la ecuacion 3 del ejercicio 2
module operador3(input wire A, B, C, D, output wire out);

  assign out = (B) | (~C & D) | (A & D);

endmodule

// Se realizo la ecuacion reducida de la ecuacion 4 del ejercicio 2
module operador4(input wire A, B, C, output wire out);

  assign out = (B) | (~A & ~C);

endmodule
