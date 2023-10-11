/*
1. Simple Register
2. Simple Shift Register
3. Finite State Machine
4. Single Cycle Processor
5. Pipelined Processor (DDCA)
6. Branch Prediction (first simple)
7. Perceptron based branch predicton
*/

// Register w/ Load (Cause you shouldn't do logic on the clock)
module top  (clk, res, D, load, Q, Qp);
  input clk;
  input res;
  input [31:0] D;
  input load;
  output logic [31:0] Q;  
  output logic [31:0] Qp;
  // wire 
  // adder a0 (.in1(D), .in2(D), .out(Q));
  // adder a1 (.in1(~D), .in2(~D), .out(Qp));

  always @(posedge clk) begin
    if(res)
      Q <= 0;
    else 
      if (load)
        Q <= D;
        Qp <= ~D;
  end
  
endmodule 