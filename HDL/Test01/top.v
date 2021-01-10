
`timescale 1ns/100ps

module top (
   input clk,
   input rst,
  
   input [7:0] adc_data_in_p,
   input [7:0] adc_data_in_n,
   input adc_dco_in_p,
   input adc_dco_in_n,
  
   //input [7:0] switches,
	
   output  [7:0] leds	
	);
parameter C_IODELAY_GROUP = "adc_if_delay_group";

wire reset;
wire clock;

wire  [7:0] adc_data_ibuf_s;
wire  [7:0] adc_data_idelay_s;
wire  [4:0] delay_rdata_s[7:0];
wire        adc_dco_ibuf_s;
wire  [7:0] adc_data_p_s;
wire  [7:0] adc_data_n_s;

reg   [31:0]   counter;






// ADC inputs
//
// clock buffers  
IBUFGDS i_clk_ibuf (
 .I (adc_dco_in_p),
 .IB (adc_dco_in_n),
 .O (adc_dco_ibuf_s));

BUFR  #(.SIM_DEVICE("VIRTEX6")) adc_dco_bufr (
 .CE( 1'b1),
 .CLR( 1'b0),
 .I (adc_dco_ibuf_s),
 .O (adc_dco_clk));

genvar          l_inst;
generate
  for (l_inst = 0; l_inst <= 7; l_inst = l_inst + 1) begin : adc_input
  IBUFDS i_data_ibuf (
    .I (adc_data_in_p[l_inst]),
    .IB (adc_data_in_n[l_inst]),
    .O (adc_data_ibuf_s[l_inst]));

  (* IODELAY_GROUP = C_IODELAY_GROUP *)
  IODELAYE1 #(
    .CINVCTRL_SEL ("FALSE"),
    .DELAY_SRC ("I"),
    .HIGH_PERFORMANCE_MODE ("TRUE"),
    .IDELAY_TYPE ("DEFAULT"),
    .IDELAY_VALUE (0),
    .ODELAY_TYPE ("FIXED"),
    .ODELAY_VALUE (0),
    .REFCLK_FREQUENCY (200.0),
    .SIGNAL_PATTERN ("DATA"))
  i_data_idelay (
    .T (1'b1),//
    .CE (1'b0),//
    .INC (1'b0),
    .CLKIN (1'b0),
    .DATAIN (1'b0),
    .ODATAIN (1'b0),//
    .CINVCTRL (1'b0),//
    .C (adc_dco_clk),//
    .CNTVALUEIN(5'b0),
    .IDATAIN (adc_data_ibuf_s[l_inst]),  //
    .DATAOUT (adc_data_idelay_s[l_inst]),//
    .RST(1'b0),//
    //.RST (delay_ld[l_inst]),
    //.CNTVALUEIN (delay_wdata),
    .CNTVALUEOUT (delay_rdata_s[l_inst]));//
 
  IDDR #(
    .INIT_Q1 (1'b0),
    .INIT_Q2 (1'b0),
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .SRTYPE ("ASYNC"))
  i_data_ddr (
    .CE (1'b1),
    .R (1'b0),
    .S (1'b0),
    .C (adc_dco_clk),
    .D (adc_data_idelay_s[l_inst]),
    .Q1 (adc_data_p_s[l_inst]),
    .Q2 (adc_data_n_s[l_inst]));

  end  
  endgenerate

// System clock generation

// Send 250MHz clock to ADC



begin  
   assign leds[6:0] = adc_data_p_s[6:0];
   assign leds[7] = ~adc_data_p_s[7];
end

//always @(posedge adc_dco_clk) begin
//    leds[7:0] <= adc_data_p_s[7:0];
    //(* KEEP = "TRUE" *)
	 //leds[7] <= 1'b1;
//end

//always @(posedge adc_dco_ibuf_s) begin
//  leds[0] <= adc_data_ibuf_s[0];
 //  leds[1] <= adc_dco_ibuf_s;
//end
  
endmodule
