module testbench();

reg [3:0] Entrada;
reg En;
wire [3:0] salida;

BUFFER T(Entrada, En, salida);

initial begin
  #1
  $display("| En Entrada | salida |");
  $display("-------------------------");
  $monitor("| %b     %b | %b |", En, Entrada, salida);
     En = 0; Entrada = 4'b0000;
  #1 En = 1; Entrada = 4'b0101;
  #1 En = 1; Entrada = 4'b0100;
  #1 En = 0; Entrada = 4'b0001;
  #1 En = 1; Entrada = 4'b1001;

end

  initial
    #25 $finish;

  initial begin
    $dumpfile("BUFFER_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule //testbenc
