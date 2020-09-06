module filp_flop(input clk, reset, D ,output reg Q);
  always @ (posedge clk, posedge reset) begin
    if (reset) begin
      Q <= 1'b0;
    end
    else begin
      Q <= D;
    end
  end
endmodule

module ejercicio_1(input wire clk, reset, A, B, output wire Y);

  wire D0, D1, Q0, Q1;

  assign D0 = (Q1 & B) | (Q0 & A & B);
  assign D1 = (~Q0 & Q1 & A);


  filp_flop a1(clk, reset, D0, Q0);
  filp_flop a2(clk, reset, D1, Q1);
  assign Y = Q0 & A & B;
endmodule

module ejercici_3(input wire clk, reset, boton, output wire Y1, Y2, Y3);

  wire D0, D1, D2, Q0, Q1, Q2;
  assign D2 = (~Q2 & Q1 & Q0 & boton) | (~Q2 & ~Q1 & ~Q0 & ~boton) | (Q2 & Q0 & ~boton) | (Q2 & ~Q1 & boton) | (Q2 & Q1 & ~Q0);
  assign D1 = ( Q1 & Q0 & ~boton) | ( Q1 & Q0 & boton ) | ( Q1 & Q0 & ~boton) | ( Q1 & ~Q0 & boton);
  assign D0 = ~Q0;

  filp_flop b0(clk, reset, D0, Q0);
  filp_flop b1(clk, reset, D1, Q1);
  filp_flop b2(clk, reset, D2, Q2);

  assign Y1 = Q2;
  assign Y2 = (~Q2 & Q1) | (Q2 & ~Q1);
  assign Y3 = (Q1 & ~Q0) | (Q1 & ~Q0);
endmodule
