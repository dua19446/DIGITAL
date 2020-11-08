module flip_flop4(input clk, reset,En, input [3:0]D, output reg [3:0]Q);
  always @ (posedge clk or posedge reset)begin
    if (reset)
      Q <= 4'b0;
    else if (En)
      Q <= D;
  end
endmodule

module fetch(input clk, reset,En, input [7:0]D, output [3:0]instr, oprnd);

 flip_flop4 b1(clk, reset, En, D[7:4], instr);
 flip_flop4 b2(clk, reset, En, D[3:0], oprnd);

endmodule

module contador(input wire clk,reset,En,load,
input wire [11:0]load2,
output reg [11:0]q);

always @(posedge clk or posedge reset or load or load2) begin
  if(reset)
  q <= 12'b000000000000;
  else if(load)
  q <= load2;
  else if(En)
  q <= q + 1;
  end
endmodule




module memoriaROM(input wire [11:0]localidad, output wire [7:0]respuesta);

reg [7:0] cerebro [0:4095];

  initial begin
    $readmemb("memory.list", cerebro);
  end

assign respuesta = cerebro[localidad];

endmodule



module EJERCICIO1(input clk, reset, En1, En2, load,
  input [11:0]D, output [7:0]Program_byte, output [3:0]instr, oprnd);

  wire [11:0]PC;

  contador a1( clk, reset, En1, load, D , PC);
  memoriaROM a2(PC, Program_byte);
  fetch a3(clk, reset, En2, Program_byte, instr, oprnd);

endmodule
