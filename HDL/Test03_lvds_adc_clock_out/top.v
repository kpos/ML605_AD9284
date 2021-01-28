
`timescale 1ns/100ps

module top (
   input ML605_SystemClock_200MHz_p,
   input ML605_SystemClock_200MHz_n,
   input ML605_FPGA_RESET,
  
   input [7:0] adc_data_in_p,
   input [7:0] adc_data_in_n,
   input adc_dco_in_p,
   input adc_dco_in_n,
  
   //input [7:0] switches,
	
   output  [7:0] leds,
   output led_C, // used for MMCM lock indication
   output led_S,
   output led_N,
   //output adc_clock_out2 //25P on the interposer card
   //output adc_clock_out_5hz_trigger;
   output adc_clock_out_p,
   output adc_clock_out_n
	);
parameter C_IODELAY_GROUP = "adc_if_delay_group";

wire reset;
wire clock200;

wire CLKFBOUT;
wire CLKOUT0;
wire CLKOUT0B;
wire CLKOUT1;
wire CLKOUT1B;
wire CLKOUT2;
wire CLKOUT2B;
wire CLKOUT3;
wire CLKOUT3B;
wire CLKOUT4;
wire CLKOUT5;
wire CLKOUT6;
wire CLKFBOUTB;


wire  [7:0] adc_data_ibuf_s;
wire  [7:0] adc_data_idelay_s;
wire  [4:0] delay_rdata_s[7:0];
wire        adc_dco_ibuf_s;
wire  [7:0] adc_data_p_s;
wire  [7:0] adc_data_n_s;
wire adc_clock_out;
wire adc_clock_out2;
wire led_clock;

reg [7:0] leds;

//reg   [31:0]   counter;


// divide by 50M and blink a diode (adc clock in and adc clock out)
Clock_divider #(.DIVISOR( 50_000_000))adc_clock_div (
   .clock_in(adc_clock_out),
   .clock_out(led_N));
Clock_divider #(.DIVISOR( 25_000_000)) adc_dco_div (
   .clock_in(adc_dco_clk),
   .clock_out(led_S));


   
IBUFGDS i_main_clk_ibuf (
 .I (ML605_SystemClock_200MHz_p),
 .IB (ML605_SystemClock_200MHz_n),
 .O (clock200));
 
MMCM_BASE #(
   .BANDWIDTH("OPTIMIZED"),   // Jitter programming ("HIGH","LOW","OPTIMIZED")
   .CLKFBOUT_MULT_F(5.0),     // Multiply value for all CLKOUT (5.0-64.0).
   .CLKFBOUT_PHASE(0.0),      // Phase offset in degrees of CLKFB (0.00-360.00).
   .CLKIN1_PERIOD(0.0),       // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
   .CLKOUT0_DIVIDE_F(4.0),    // Divide amount for CLKOUT0 (1.000-128.000).
   // CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
   .CLKOUT0_DUTY_CYCLE(0.5),
   .CLKOUT1_DUTY_CYCLE(0.5),
   .CLKOUT2_DUTY_CYCLE(0.5),
   .CLKOUT3_DUTY_CYCLE(0.5),
   .CLKOUT4_DUTY_CYCLE(0.5),
   .CLKOUT5_DUTY_CYCLE(0.5),
   .CLKOUT6_DUTY_CYCLE(0.5),
   // CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
   .CLKOUT0_PHASE(0.0),
   .CLKOUT1_PHASE(0.0),
   .CLKOUT2_PHASE(0.0),
   .CLKOUT3_PHASE(0.0),
   .CLKOUT4_PHASE(0.0),
   .CLKOUT5_PHASE(0.0),
   .CLKOUT6_PHASE(0.0),
   // CLKOUT1_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
   .CLKOUT1_DIVIDE(1),
   .CLKOUT2_DIVIDE(1),
   .CLKOUT3_DIVIDE(1),
   .CLKOUT4_DIVIDE(1),
   .CLKOUT5_DIVIDE(1),
   .CLKOUT6_DIVIDE(1),
   .CLKOUT4_CASCADE("FALSE"), // Cascase CLKOUT4 counter with CLKOUT6 (TRUE/FALSE)
   .CLOCK_HOLD("FALSE"),      // Hold VCO Frequency (TRUE/FALSE)
   .DIVCLK_DIVIDE(1),         // Master division value (1-80)
   .REF_JITTER1(0.0),         // Reference input jitter in UI (0.000-0.999).
   .STARTUP_WAIT("FALSE")     // Not supported. Must be set to FALSE.
)
MAIN_200_CLK_MMCM (
   // Clock Outputs: 1-bit (each) output: User configurable clock outputs
   .CLKOUT0(CLKOUT0),     // 1-bit output: CLKOUT0 output
   .CLKOUT0B(CLKOUT0B),   // 1-bit output: Inverted CLKOUT0 output
   .CLKOUT1(CLKOUT1),     // 1-bit output: CLKOUT1 output
   .CLKOUT1B(CLKOUT1B),   // 1-bit output: Inverted CLKOUT1 output
   .CLKOUT2(CLKOUT2),     // 1-bit output: CLKOUT2 output
   .CLKOUT2B(CLKOUT2B),   // 1-bit output: Inverted CLKOUT2 output
   .CLKOUT3(CLKOUT3),     // 1-bit output: CLKOUT3 output
   .CLKOUT3B(CLKOUT3B),   // 1-bit output: Inverted CLKOUT3 output
   .CLKOUT4(CLKOUT4),     // 1-bit output: CLKOUT4 output
   .CLKOUT5(CLKOUT5),     // 1-bit output: CLKOUT5 output
   .CLKOUT6(CLKOUT6),     // 1-bit output: CLKOUT6 output
   // Feedback Clocks: 1-bit (each) output: Clock feedback ports
   .CLKFBOUT(CLKFBOUT),   // 1-bit output: Feedback clock output
   .CLKFBOUTB(CLKFBOUTB), // 1-bit output: Inverted CLKFBOUT output
   // Status Port: 1-bit (each) output: MMCM status ports
   .LOCKED(led_C),       // 1-bit output: LOCK output
   // Clock Input: 1-bit (each) input: Clock input
   .CLKIN1(clock200),
   // Control Ports: 1-bit (each) input: MMCM control ports
   .PWRDWN(1'b0),       // 1-bit input: Power-down input
   .RST(ML605_FPGA_RESET),             // 1-bit input: Reset input
   // Feedback Clocks: 1-bit (each) input: Clock feedback ports
   .CLKFBIN(CLKFBOUT)      // 1-bit input: Feedback clock input
);

OBUFDS adc_clock_out_ds (
  .I(adc_clock_out),
  .O(adc_clock_out_p),
  .OB(adc_clock_out_n));

//wire nled_S = ~led_S;

always @(posedge led_S ) begin
      leds[7:1] = adc_data_p_s[7:1];
      leds[0] = led_S;
   end
   

begin
   assign adc_clock_out = CLKOUT0;
   //assign leds[0] = led_S;
   //assign leds[7:0] = adc_data_p_s[7:0];
   //assign adc_clock_out2 = adc_clock_out;
   
end
    

// ADC inputs
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

/*  (* IODELAY_GROUP = C_IODELAY_GROUP *)
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
    .RST(ML605_FPGA_RESET),//
    //.RST (delay_ld[l_inst]),
    //.CNTVALUEIN (delay_wdata),
    .CNTVALUEOUT (delay_rdata_s[l_inst]));//*/
 
  IDDR #(
    .INIT_Q1 (1'b0),
    .INIT_Q2 (1'b0),
    .DDR_CLK_EDGE ("SAME_EDGE_PIPELINED"),
    .SRTYPE ("ASYNC"))
  i_data_ddr (
    .CE (1'b1),
    .R (ML605_FPGA_RESET),
    .S (1'b0),
    .C (adc_dco_clk),
    //.D (adc_data_idelay_s[l_inst]),
    .D (adc_data_ibuf_s[l_inst]),
    .Q1 (adc_data_p_s[l_inst]),
    .Q2 (adc_data_n_s[l_inst]));
  end  
  endgenerate
  


endmodule
