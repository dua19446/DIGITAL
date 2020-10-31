module flipflop(input clk, reset,En, D, output reg Q);
  always @ (posedge clk or posedge reset) begin
    if (reset)
      Q <= 1'b0;
    else if (En)
      Q <= D;
  end
endmodule

module FLIPFLOPJK(input clk, reset, En, J, K, output Q);

wire nQ, nK, A1, A2, d;

not(nQ, Q);
not(nK, K);

and(A1, nK, Q);
and(A2, J, nQ);

or(d, A1, A2);

flipflop a(clk, reset, En, d, Q);

endmodule
