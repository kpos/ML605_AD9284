`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:59:03 01/07/2021 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
    input [7:0] ADC_D_p,
    input [7:0] ADC_D_n,
    input ADC_DCO_P,
    input ADC_DCO_N,
    input RST,
    input CLK,
    input [7:0] Switch,
    output reg [7:0] LED
    );

   IBUFGDS DCO_CLK_IN (
      .O(DCO_CLK),  // Clock buffer output
      .I(ADC_DCO_P),  // Diff_p clock buffer input (connect directly to top-level port)
      .IB(ADC_DCO_N) // Diff_n clock buffer input (connect directly to top-level port)
   );



endmodule
