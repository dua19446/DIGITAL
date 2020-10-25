module ALU(
  input wire [3:0]variable1,
  input wire [3:0]variable2,
  input wire [2:0]comando,
  output reg [3:0]respuesta
  );
  always @ (variable1,variable2,comando) begin
    case(comando)
        3'b000: respuesta = variable1 & variable2;
        3'b001: respuesta = variable1 | variable2;
        3'b010: respuesta = variable1 + variable2;
        3'b011: respuesta = 4'b0000;
        3'b100: respuesta = variable1 & ~variable2;
        3'b101: respuesta = variable1 | ~variable2;
        3'b110: respuesta = variable1 - variable2;
        3'b111: respuesta = (variable1 < variable2) ? 1:0;
        default: respuesta = 4'b0000;
    endcase
  end
endmodule
