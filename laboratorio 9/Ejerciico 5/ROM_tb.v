module testbench();

  reg En;
  reg [6:0]Entrada;
  wire [12:0]Salida;

  rom g(En, Entrada, Salida);

  initial begin
    #1
    $display(" En  Entrada   | Salida ");
    $display("--------------------------");
    $monitor(" %b  %b | %b", En, Entrada, Salida);
        En = 0;
      #1 En = 1;
      #1 Entrada = 7'bxxxxxx0;
      #1 Entrada = 7'b00001x1;
      #1 Entrada = 7'b00000x1;
      #1 Entrada = 7'b00011x1;
      #1 Entrada = 7'b00010x1;
      #1 Entrada = 7'b0010xx1;
      #1 Entrada = 7'b0011xx1;
      #1 Entrada = 7'b0100xx1;
      #1 Entrada = 7'b0101xx1;
      #1 Entrada = 7'b0110xx1;
      #1 Entrada = 7'b0111xx1;
      #1 Entrada = 7'b1000x11;
      #1 Entrada = 7'b1000x01;
      #1 Entrada = 7'b1001x11;
      #1 Entrada = 7'b1001x01;
      #1 Entrada = 7'b1010xx1;
      #1 Entrada = 7'b1011xx1;
      #1 Entrada = 7'b1100xx1;
      #1 Entrada = 7'b1101xx1;
      #1 Entrada = 7'b1110xx1;
      #1 Entrada = 7'b1111xx1;
      #1 Entrada = 7'b0101010;
      #1 Entrada = 7'b1010100;

  end

  initial
    #30 $finish;

  initial begin
    $dumpfile("ROM_tb.vcd");
    $dumpvars(0, testbench);
  end


endmodule //
