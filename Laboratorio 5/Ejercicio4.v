//José Alejandro Duarte Godinez

// Se realiza el modulo del Mux 2:1
module Mux2(input wire S, D0, D1, output wire Y);
    //estabeciendo conexiones
  assign Y = S ? D1 : D0;

// Se finaliza el modulo
endmodule

// Se realiza el modulo del Mux 4:1
module Mux4(input wire S0, S1, D0, D1, D2, D3,  output wire Y1);
  // estableciendo conexines
  wire cbl1, cbl2;
  // Se intancia el Mux2:1
  Mux2 caja0(S0, D0, D1, cbl1);
  Mux2 caja1(S0, D2, D3, cbl2);
  Mux2 caja2(S1, cbl1, cbl2, Y1);

//Se finaliza el modulo
endmodule

// Se realiza el modulo del Mux 8:1
module Mux8(input wire D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2, output wire Y2);
  // Estableciendo conectores
  wire cbl3, cbl4;
  // se instancian el Mux 4:1 y Mux 2:1
  Mux4 caja01(S0, S1, D0, D1, D2, D3, cbl3);
  Mux4 caja02(S0, S1, D4, D5, D6, D7, cbl4);
  Mux2 caja03(S2, cbl3, cbl4, Y2);

//Se finaliza el modulo
endmodule

// Se realiza el Mux 8:1 del ejercicio 1 de la tabla 1
module E1T1M8(input wire A, B, C, output Y4);

  wire V, G;
  assign V = 1;
  assign G = 0;
  //Se instancia el Mux 8:1
  Mux8 eje1t1(G, V, V, G, V, G, G, V, A, B, C, Y4);
  //Finaliza el modulo
endmodule

// Se realiza el Mux 4:1 del ejercicio 1 de la tabla 1
module E1T1M4(input wire A, B, C, output Y5);
  //se asignan variables
  wire NC;
  assign NC = ~C;

  //Se instancia el Mux 4:1
  Mux4 eje1t12( A, B, C, NC, NC, C, Y5);
endmodule

// Se realiza el Mux 2:1 del ejercicio 1 de la tabla 1
module E1T1M2(input wire A, B, C, output Y6);

  wire XOR,NXOR;
  assign XOR = B ^ C;
  assign NXOR = B ~^ C;

  Mux2 eje1t13(A, XOR, NXOR, Y6);

endmodule

module E1T2M8(input wire A, B, C, output Y7);

  wire V, G;
  assign V = 1;
  assign G = 0;
  //Se instancia el Mux 8:1
  Mux8 eje1t2(V, G, G, G, G, V, V, G, C, B, A, Y7);
  //Finaliza el modulo
endmodule

module E1T2M4(input wire A, B, C, output Y8);
  //se asignan variables
  wire NC;
  assign NC = ~C;
  assign G = 0;

  //Se instancia el Mux 4:1
  Mux4 eje1t22( B, A, NC, G, C, NC, Y8);
endmodule

module E1T2M2(input wire A, B, C, output Y9);
  wire XOR,NOR;
  assign NOR = B ~| C;
  assign XOR = B ^ C;

  Mux2 eje1t23(A, NOR, XOR, Y9);

endmodule
