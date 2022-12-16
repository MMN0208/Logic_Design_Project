module proc (DIN, Resetn, Clock, Run, Done, BusWires);
  input [8:0] DIN;
  input Resetn, Clock, Run;
  output reg Done;
  output reg [8:0] BusWires;
  
  localparam T0 = 2'b00, T1 = 2'b01, T2 = 2'b10, T3 = 2'b11;

  //declare variables
  reg IRin, DINout, Ain, Gout, Gin, AddSub;
  reg [7:0] Rout, Rin;
  wire [7:0] Xreg, Yreg;
  wire [1:9] IR;
  wire [1:3] I;
  reg [9:0] MUXsel;
  wire [8:0] R0, R1, R2, R3, R4, R5, R6, R7, result  /* synthesis_keep */;
  wire [8:0] A, G /* synthesis_keep */;
  wire [2:0] Tstep_Q /* synthesis_keep */;
  reg [2:0] Tstep_D;

  wire Clear = Done || ~Resetn;
  
  assign I = IR[1:3];
  dec3to8 decX (IR[4:6], 1'b1, Xreg);
  dec3to8 decY (IR[7:9], 1'b1, Yreg);

  always @(TstepQ or Run or Done)
  begin
    case(Tstep_Q)
        T0: begin
            if(!Run) Tstep_D = T0;
            else Tstep_D = T1;
        end

        T1: begin
            case(I)
                0: Tstep_D = T0;
                1: Tstep_D = T0;
                2: Tstep_D = T2;
                3: Tstep_D = T2;
            endcase
        end

        T2: Tstep_D = T3;

        T3: Tstep_D = T0;

        default: Tstep_D = 3'bxxx;
    endcase
  end

  always @(Tstep_Q or I or Xreg or Yreg)
  begin
    //specify initial values
    IRin = 1'b0;
    Rout[7:0] = 8'b00000000;
    Rin[7:0] = 8'b00000000;
    DINout = 1'b0;
    Ain = 1'b0;
    Gout = 1'b0;
    Gin = 1'b0;
    AddSub = 1'b0;

    Done = 1'b0;

    case (Tstep_Q)
      T0: // store DIN in IR in time step 0
        begin
          IRin = 1'b1; // should this be ANDed with Run?
        end
		  
      T1: //define signals in time step 1
        case (I)
          3'b000:
            begin
              Rout = Yreg;
              Rin = Xreg;
              Done = 1'b1;
            end

          3'b001:
            begin
              DINout = 1'b1;
              Rin = Xreg;
              Done = 1'b1;
            end

          3'b010:
            begin
              Rout = Xreg;
              Ain = 1'b1;
            end

          3'b011:
            begin
              Rout = Xreg;
              Ain = 1'b1;
            end
        endcase

      T2: //define signals in time step 2
        case (I)
          3'b010:
            begin
                Rout = Yreg;
                Gin = 1'b1;
            end

          3'b011:
            begin
                Rout = Yreg;
                Gin = 1'b1;
                AddSub = 1'b1;
            end
        endcase

      T3: //define signals in time step 3
        case (I)
          3'b010:
            begin
                Gout = 1'b1;
                Rin = Xreg;
                Done = 1'b1;
            end

          3'b011:
            begin
                Gout = 1'b1;
                Rin = Xreg;
                Done = 1'b1;
            end
        endcase
    endcase
  end

  always @(posedge clock) begin
    Tstep_Q = Tstep_D;
  end

  //instantiate registers and the adder/subtracter unit
  regn reg_0 (BusWires, Rin[0], Clock, R0);
  regn reg_1 (BusWires, Rin[1], Clock, R1);
  regn reg_2 (BusWires, Rin[2], Clock, R2);
  regn reg_3 (BusWires, Rin[3], Clock, R3);
  regn reg_4 (BusWires, Rin[4], Clock, R4);
  regn reg_5 (BusWires, Rin[5], Clock, R5);
  regn reg_6 (BusWires, Rin[6], Clock, R6);
  regn reg_7 (BusWires, Rin[7], Clock, R7);

  regn reg_IR (DIN, IRin, Clock, IR);
  defparam reg_IR.n = 9;
  regn reg_A (BusWires, Ain, Clock, A);
  regn reg_G (result, Gin, Clock, G);

  addsub AS (~AddSub, A, BusWires, result);

  //define the bus
  always @ (MUXsel or Rout or Gout or DINout)
  begin
    MUXsel[9:2] = Rout;
    MUXsel[1] = Gout;
    MUXsel[0] = DINout;
    
    case (MUXsel)
      10'b0000000001: BusWires = DIN;
      10'b0000000010: BusWires = G;
      10'b0000000100: BusWires = R0;
      10'b0000001000: BusWires = R1;
      10'b0000010000: BusWires = R2;
      10'b0000100000: BusWires = R3;
      10'b0001000000: BusWires = R4;
      10'b0010000000: BusWires = R5;
      10'b0100000000: BusWires = R6;
      10'b1000000000: BusWires = R7;
		default: BusWires = 0;
    endcase
  end

endmodule




