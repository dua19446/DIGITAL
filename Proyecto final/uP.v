//BLOQUE 1
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

  always @(posedge clk or posedge reset) begin
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
      $readmemh("memory.list", cerebro);
    end

  assign respuesta = cerebro[localidad];

endmodule

//BLOQUE 2
module BUSDRIVER1(input [3:0] Entrada, input En, output [3:0] salida);
  assign salida = (En) ? Entrada:4'bz;
endmodule

module BUSDRIVER2(input [3:0] Entrada, input En, output [3:0] salida);
  assign salida = (En) ? Entrada:4'bz;
endmodule

// ALU
module ALU(input [3:0] A, B,
           input [2:0] comando,
           output C, Zero,
           output [3:0] Salida);

    reg [4:0] cbl;

    always @ (A, B, comando)
        case (comando)
            3'b000: cbl = A;
            3'b001: cbl = A - B;
            3'b010: cbl = B;
            3'b011: cbl = A + B;
            3'b100: cbl = {1'b0, ~(A & B)};
            default: cbl = 5'b10101;
        endcase

    assign Salida = cbl[3:0];
    assign C = cbl[4];
    assign Zero = ~(cbl[3] | cbl[2] | cbl[1] | cbl[0]);

endmodule

module acumulador(input clk, reset,En, input [3:0]D, output reg [3:0]Q);
  always @ (posedge clk or posedge reset)begin
    if (reset)
      Q <= 4'b0;
    else if (En)
      Q <= D;
  end
endmodule

// DECODER
module DECODER (input [6:0]Entrada, output reg [12:0]Salida);
  always @ (Entrada)begin
          Salida = 13'b0000000000000;
        casex (Entrada)
          7'bxxxxxx0 : Salida   <=   13'b1000000001000;
          7'b00001x1:  Salida   <=   13'b0100000001000;
          7'b00000x1:  Salida   <=   13'b1000000001000;
          7'b00011x1:  Salida   <=   13'b1000000001000;
          7'b00010x1:  Salida   <=   13'b0100000001000;
          7'b0010xx1:  Salida   <=   13'b0001001000010;
          7'b0011xx1:  Salida   <=   13'b1001001100000;
          7'b0100xx1:  Salida   <=   13'b0011010000010;
          7'b0101xx1:  Salida   <=   13'b0011010000100;
          7'b0110xx1:  Salida   <=   13'b1011010100000;
          7'b0111xx1:  Salida   <=   13'b1000000111000;
          7'b1000x11:  Salida   <=   13'b0100000001000;
          7'b1000x01:  Salida   <=   13'b1000000001000;
          7'b1001x11:  Salida   <=   13'b1000000001000;
          7'b1001x01:  Salida   <=   13'b0100000001000;
          7'b1010xx1:  Salida   <=   13'b0011011000010;
          7'b1011xx1:  Salida   <=   13'b1011011100000;
          7'b1100xx1:  Salida   <=   13'b0100000001000;
          7'b1101xx1:  Salida   <=   13'b0000000001001;
          7'b1110xx1:  Salida   <=   13'b0011100000010;
          7'b1111xx1:  Salida   <=   13'b1011100100000;
        endcase
  end
endmodule

// IMPLEMENTACION DE LA RAM
module RAM(input cs, we, input [11:0]address_RAM, output [3:0]data);

 reg [3:0]data_out;
 reg [3:0] mem[0:4095];

 assign data = (cs && !we) ? data_out : 4'bzzzz;
 always @ (address_RAM or data or cs or we )
   begin: MEM_WRITE
       if (cs && we)
          mem[address_RAM] = data;
 end

 always @ (address_RAM or cs or we)
  begin: MEM_READ
       if (cs && !we)
          data_out = mem[address_RAM];
 end
endmodule

// IMPLEMENTACION DE PHASE
module flipflop(input clk, reset, D, output reg Q);
  always @ (posedge clk, posedge reset)
    if (reset)
      Q <= 1'b0;
    else
      Q <= D;
endmodule

module PHASE(input clk, reset, output Q);// DUDA
  wire clb;

  assign clb = ~Q;

  flipflop c(clk, reset, clb, Q);
endmodule //PHASE

// IMPLEMENTACION DE OUTPUTS
module OUTPUTS(input clk, reset,En, input [3:0]D, output reg [3:0]Q);
 always @ (posedge clk or posedge reset)begin
   if (reset)
     Q <= 4'b0;
   else if (En)
     Q <= D;
 end
endmodule


// IMPLEMENTACION DE INPUTS
module INPUTS (input [3:0] Entrada, input En, output [3:0] salida);
  assign salida = (En) ? Entrada:4'bz;
endmodule //INPUTS

// IMPLEMENTACION DE FLAGS
module flip_flop_D(input clk, reset, En, input wire D, output reg Q);

 always @ (posedge clk or posedge reset)begin
   if (reset)
     Q <= 1'b0;
   else if (En)
     Q <= D;
 end

endmodule

module FLAGS(input clk, reset,En, D, D1, output zero, carry);

 flip_flop_D Z(clk, reset, En, D, zero);
 flip_flop_D C(clk, reset, En, D1, carry);

endmodule


module uP(input clock, reset, input [3:0]pushbuttons, output phase, c_flag, z_flag,
  output [3:0]instr, oprnd, accu, data_bus, FF_out, output [7:0]program_byte,
  output [11:0]PC, address_RAM);

  wire incPC, loadPC, loadA, loadFlags, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut;
  wire [12:0]control_signals;
  wire [3:0]salida_ALU;
  wire [2:0]comando_ALU;
  wire zero,carry;
  wire [6:0]in_decode;

  assign incPC = control_signals[12];
  assign loadPC = control_signals[11];
  assign loadA = control_signals[10];
  assign loadFlags = control_signals[9];
  assign comando_ALU = control_signals[8:6];
  assign csRAM = control_signals[5];
  assign weRAM = control_signals[4];
  assign oeALU = control_signals[3];
  assign oeIN = control_signals[2];
  assign oeOprnd = control_signals[1];
  assign loadOut = control_signals[0];

  assign address_RAM = {oprnd, program_byte};
  assign in_decode = {instr,c_flag,z_flag,phase};

  contador Pc(clock,reset,incPC,loadPC,address_RAM,PC);
  memoriaROM ProgramROM(PC,program_byte);
  fetch Fetch(clock,reset,~phase,program_byte,instr,oprnd);
  BUSDRIVER1 Busdriver1(oprnd,oeOprnd,data_bus);
  ALU ALU(accu,data_bus, comando_ALU,carry,zero,salida_ALU);
  acumulador ACCU(clock, reset, loadA,salida_ALU,accu);
  BUSDRIVER2 Busdriver2(salida_ALU,oeALU,data_bus);
  INPUTS Inputs(pushbuttons,oeIN,data_bus);
  OUTPUTS Ouputs(clock,reset,loadOut,data_bus,FF_out);
  RAM RAM(csRAM,weRAM,address_RAM,data_bus);
  PHASE Phase(clock, reset,phase);
  FLAGS Flags(clock,reset,loadFlags,zero,carry,z_flag,c_flag);
  DECODER Decoder(in_decode,control_signals);

endmodule //
