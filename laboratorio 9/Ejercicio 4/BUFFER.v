module BUFFER(input [3:0] Entrada, input En, output [3:0] salida);
  assign salida = (En) ? Entrada:4'bz;
endmodule //BUFFER
