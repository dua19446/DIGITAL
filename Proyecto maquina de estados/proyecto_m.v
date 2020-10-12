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

module antirrebote(
  input wire clk, reset, in,
  output wire Y);

  wire D, Q;

  assign D = in;
  assign Y = (~Q & in);

  filp_flop a1(clk, reset, D, Q);

endmodule

module memoria_motores(
  input wire clk, reset, TI, N,
  input wire [1:0]PE,
  output wire TER, En,
  output wire [1:0]M,
  output wire [1:0]Gen);

  wire D0, D1, D2, Q0, Q1, Q2;

  assign D0 = (~Q0 & Q1 & ~Q2 & TI) | (~Q0 & Q2 & TI) | (Q0 & ~Q1 & Q2 & ~TI) | (Q0 & ~Q2 & ~TI);
  assign D1 = (~Q0 & ~Q1 & ~Q2 & PE[1] & N) | (~Q0 & Q1 & Q2) | (Q1 & ~Q2 & ~TI);
  assign D2 = (~Q0 & Q1 & ~Q2 & TI) | (Q0 & ~Q1 & Q2 & ~TI) | (~Q0 & Q2 & ~TI) | (~Q0 & ~Q1 & ~Q2 & PE[0] & N);

  assign TER = (Q0 & ~Q1 & Q2) | (Q0 & ~Q2);
  assign M[1] = (Q0 & Q1 & ~Q2) | (Q0 & ~Q1 & Q2);
  assign M[0] = (Q0 & ~Q2);
  assign Gen[1] = (~Q0 & Q1);
  assign Gen[0] = (~Q0 & Q2);
  assign En = (Q0 & ~Q1 & Q2) | (~Q0 & Q1) | (~Q0 & Q2) | (Q0 & ~Q2);

  filp_flop b0(clk, reset, D0, Q0);
  filp_flop b1(clk, reset, D1, Q1);
  filp_flop b2(clk, reset, D2, Q2);

endmodule

module lector_selector(
  input wire clk, reset, TI, N, D, I, TER,
  input wire [1:0]T,
  output wire [3:0]LCD,
  output wire [1:0]PE,
  output LV, LR, En);

  wire D0, D1, D2, D3, Q0, Q1, Q2, Q3;

  assign D0 = (Q0 & ~Q1 & ~Q2 & ~Q3 & ~TI) | (~Q0 & Q1 & Q2 & Q3 & TER);

  assign D1 = (~Q0 & Q1 & ~Q2 & Q3 & ~D & I) | (~Q0 & Q1 & ~Q2 & Q3 & D & ~I) | (~Q0 & Q1 & Q2 & ~Q3 & ~D & I) |
  (~Q0 & ~Q1 & Q2 & Q3 & ~N) | (~Q0 & Q1 & ~Q2 & ~Q3 & D & ~I) | (~Q0 & Q1 & Q2 & Q3 & ~TER) |
  (~Q0 & Q1 & ~Q2 & N) | (~Q0 & Q1 & ~Q3 & N);

  assign D2 = (~Q0 & ~Q1 & ~Q3 & ~T[1] & T[0]) | (~Q0 & Q1 & ~Q2 & Q3 & D & ~I) | (~Q0 & ~Q1 & Q2 & ~Q3) |
  (~Q0 & Q1 & Q2 & Q3 & ~TER) | (~Q0 & Q1 & ~Q2 & N) | (~Q0 & Q1 & ~Q3 & N);

  assign D3 = (~Q0 & ~Q1 & ~Q2 & ~Q3 & T[1] & ~T[0]) | (~Q0 & Q1 & Q2 & ~Q3 & ~D & I) | (~Q0 & Q1 & ~Q2 & ~Q3 & D & ~I) |
  (~Q0 & ~Q1 & ~Q2 & Q3 & ~TI) | (~Q0 & ~Q1 & Q2 & ~Q3 & TI) | (~Q0 & Q1 & Q2 & Q3 & ~TER) |
  (~Q0 & Q1 & ~Q2 & N) | (~Q0 & Q1 & ~Q3 & N);

  assign LCD[3] = (Q0 & ~Q1 & ~Q2 & ~Q3);
  assign LCD[2] = (~Q0 & Q1);
  assign LCD[1] = (~Q0 & Q1 & Q2 & ~Q3) | (~Q0 & ~Q1 & ~Q2 & Q3) | (~Q0 & Q2 & Q3);
  assign LCD[0] = (~Q0 & Q1 & ~Q2 & Q3) | (~Q0 & ~Q1 & Q2 & ~Q3) | (~Q0 & Q2 & Q3);
  assign LV = (~Q0 & ~Q1 & Q2 & ~Q3);
  assign LR = (~Q0 & ~Q1 & ~Q2 & Q3);
  assign PE[1] = (~Q0 & Q1 & ~Q2 & Q3) | (~Q0 & Q1 & Q2 & ~Q3);
  assign PE[0] = (~Q0 & Q1 & ~Q3);
  assign En = (Q0 & ~Q1 & ~Q2 & ~Q3) | (~Q0 & ~Q1 & ~Q2 & Q3) | (~Q0 & ~Q1 & Q2 & ~Q3);

  filp_flop C0(clk, reset, D0, Q0);
  filp_flop C1(clk, reset, D1, Q1);
  filp_flop C2(clk, reset, D2, Q2);
  filp_flop C3(clk, reset, D3, Q3);

endmodule

module timer(input wire En, output wire TI);
  always @ (En)
      if (En == 1) begin
        TI = 0;
        #10
        TI = 1;
      end
      else
        TI = 0;
  endmodule

module FSM_COM(input wire clk, reset, D, I, N, input wire [1:0]T,
  output wire [3:0]LCD,
  output wire [1:0]Gen,
  output wire LV, LR);

  wire De, Iz, Ne, TI, TI1, En, En1, TER;
  wire [1:0]PE;

  antirrebote a(clk, reset, D, De);
  antirrebote b(clk, reset, I, Iz);
  antirrebote C(clk, reset, N, Ne);
  antirrebote d(clk, reset, N, Ne);

  tiner a(En, TI);
  timer b(En1, TI1);

  lector_selector a(clk, reset, TI, Ne, De, Iz, TER,
    [1]T, [0]T,
    [3:0]LCD,
    [1:0]PE,
    LV, LR, En);
  memoria_motores b(clk, reset, TI1, Ne,
    [1:0]PE,
    TER, En1,
    [1:0]M,
    [1:0]Gen);
