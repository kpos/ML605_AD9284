`timescale 1ns / 1ps

module test02_top(
    input clk_in_p, // 200MHz in
    input clk_in_n,
    input rst,
    
    input pb_N,
    input pb_E, // pattern enable
    input pb_W, // data read speed
    input pb_S, // dco speed
    input pb_C, // select channel
    

    input [7:0] adc_data_in_p,
    input [7:0] adc_data_in_n,
    input adc_dco_in_p,
    input adc_dco_in_n,
    output adc_clock_out,
    
    output [7:0] leds,
    output led_N,   // PLL lock
    output led_E,   // Pattern generator enabled
    output led_W,   // modulo 50M data read
    output led_S,   // modulo 50M dco clock
    output led_C    // channel selector A/B
    );


   
//-------------------------------------------------------------------------------------------
// Configure DCM depending on sample rate
//-------------------------------------------------------------------------------------------
clock_mgr clock_mgr (.I_clk_p(dco_p),
				.I_clk_n(dco_n),
 				.I_ref_clk(clk100),
				.I_reset(~mr),
				.I_phase_word(16'h1F), 
				.O_clk(dco),						
				.O_clkdv(dclk),						
				.O_dcm_locked(locked));

//-------------------------------------------------------------------------------------------
// Capture data
//-------------------------------------------------------------------------------------------
capture capture (.dco(dco), 
				.dclk(dclk),
				.din_p(din_p), 
				.din_n(din_n),
				.wr_data(wr_data));

//-------------------------------------------------------------------------------------------
// Write to and read from FIFO
//-------------------------------------------------------------------------------------------
storage storage (.rst(~mr), 
				.wen(~wen & locked),
				.din(wr_data), 
				.wrclk(dclk), 
				.rden(~ren), 
				.rclk(rclk),  
				.rdy(rdy), 
				.dout(dout));    


 

endmodule


