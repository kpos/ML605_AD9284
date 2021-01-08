   (* IODELAY_GROUP = "<iodelay_group_name>" *) // Specifies group name for associated IODELAYs and IDELAYCTRL
   IODELAYE1 #(
      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion ("TRUE"/"FALSE") 
      .DELAY_SRC("I"),                 // Delay input ("I", "CLKIN", "DATAIN", "IO", "O")
      .HIGH_PERFORMANCE_MODE("FALSE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("DEFAULT"),         // "DEFAULT", "FIXED", "VARIABLE", or "VAR_LOADABLE" 
      .IDELAY_VALUE(0),                // Input delay tap setting (0-32)
      .ODELAY_TYPE("FIXED"),           // "FIXED", "VARIABLE", or "VAR_LOADABLE" 
      .ODELAY_VALUE(0),                // Output delay tap setting (0-32)
      .REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz
      .SIGNAL_PATTERN("DATA")          // "DATA" or "CLOCK" input signal
   )
   IODELAYE1_inst (
      .CNTVALUEOUT(CNTVALUEOUT), // 5-bit output - Counter value for monitoring purpose
      .DATAOUT(DATAOUT),         // 1-bit output - Delayed data output
      .C(C),                     // 1-bit input - Clock input
      .CE(CE),                   // 1-bit input - Active high enable increment/decrement function
      .CINVCTRL(CINVCTRL),       // 1-bit input - Dynamically inverts the Clock (C) polarity
      .CLKIN(CLKIN),             // 1-bit input - Clock Access into the IODELAY
      .CNTVALUEIN(CNTVALUEIN),   // 5-bit input - Counter value for loadable counter application
      .DATAIN(DATAIN),           // 1-bit input - Internal delay data
      .IDATAIN(IDATAIN),         // 1-bit input - Delay data input
      .INC(INC),                 // 1-bit input - Increment / Decrement tap delay
      .ODATAIN(ODATAIN),         // 1-bit input - Data input for the output datapath from the device
      .RST(RST),                 // 1-bit input - Active high, synchronous reset, resets delay chain to IDELAY_VALUE/
                                 // ODELAY_VALUE tap. If no value is specified, the default is 0.
      .T(T)                      // 1-bit input - 3-state input control. Tie high for input-only or internal delay or
                                 // tie low for output only.

   );
