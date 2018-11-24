/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adderModule_16 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] result
  );
  
  
  
  always @* begin
    result = 1'h0;
    
    case (alufn)
      6'h00: begin
        result = a + b;
      end
      6'h01: begin
        result = a - b;
      end
    endcase
  end
endmodule
