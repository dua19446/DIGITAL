module BUSDRIVER1(input [3:0] Entrada, input En, output [3:0] salida);
  assign salida = (En) ? Entrada:4'bz;
endmodule



module BUSDRIVER2(input [3:0] Entrada, input En, output [3:0] salida);
  assign salida = (En) ? Entrada:4'bz;
endmodule



module ALU (
  input wire [3:0] A,B,
  input wire [2:0]commando,
  output reg [3:0]Out,
  output reg carry,
  output reg zero);

  reg[4:0]w;
  always @ (A or B or commando) begin


    case(commando)
      3'b000: begin
                w = 5'b00000;
                w = A;
                carry = 1'b0;
                zero = (w == 5'b00000) ? 1:0;
                Out = w[3:0];
              end

      3'b010: begin
                w = 5'b00000;
                w = B;
                carry = 1'b0;
                zero = (w == 5'b00000) ? 1:0;
                Out = w[3:0];
              end

      3'b011: begin //SUMA
                w = 5'b00000;
                w = A + B;
                carry = (w[4] == 1) ? 1:0;
                zero = (w == 5'b00000) ? 1:0;
                Out = w[3:0];
              end

      3'b001: begin
                  w = 5'b00000;
                  w = A - B;
                  carry = (w[4] == 1) ? 1:0;
                  zero = (w == 5'b00000) ? 1:0;
                  Out = w[3:0];
                end

      3'b100:begin
                w = 5'b00000;
                w = ~(A & B);
                carry = 1'b0;
                zero = (w == 5'b00000) ? 1:0;
                Out = w[3:0];
              end
    endcase
  end
endmodule //ALU

module acumulador(input clk, reset,En, input [3:0]D, output reg [3:0]Q);
  always @ (posedge clk or posedge reset)begin
    if (reset)
      Q <= 4'b0;
    else if (En)
      Q <= D;
  end
endmodule



module ejercicio2(input clk, reset, EN_BUS1, EN_BUS2, EN_ACU,
  input [2:0]selct, input [3:0]D, output carry, zero, output [3:0]salida);

  wire [3:0]data_bus;
  wire [3:0]respuesta_ALU;
  wire [3:0]accu;

  BUSDRIVER1 c1(D, EN_BUS1, data_bus);
  ALU c2(accu, data_bus, selct, respuesta_ALU, carry, zero);
  acumulador c3(clk, reset, EN_ACU, respuesta_ALU, accu);
  BUSDRIVER2 c4(respuesta_ALU, EN_BUS2, salida);

endmodule
