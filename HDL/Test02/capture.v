`timescale 1ns / 1ps
// from Analog Device sample files

module capture (rst, dco, din_p, din_n, wr_data, dclk);

input rst; //reset IDDR's
input dco; // data clock from adc
input dclk;    // data clock when reading         
input [7:0] din_p, din_n; //diff data input

output reg [63:0] wr_data; 

wire [7:0] din_buf;
wire [7:0] dr, df;

reg [7:0] df1;
reg [15:0] data1, data2;
reg [15:0] data3, data4;

// input buffers for data
IBUFDS IBD[7:0] (.I(din_p), .IB(din_n), .O(din_buf)); // MSB-7, LSB-0

// latch data on both edges
IDDR #(.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")) I[7:0] (
		 .D(din_buf), .C(dco), .Q1(dr), .Q2(df),
		 .CE(1'b1), .S(1'b0), .R(rst));

// swap word order
always @(posedge dco)
	df1 <= df;

// pipeline 16-bit words
always @(posedge dco or posedge rst)
    if (rst) 
        begin
            data1 <= 16'b0;
            data2 <= 16'b0;
            data3 <= 16'b0;
            data4 <= 16'b0;
        end
    else        
        begin
            data1 <= {dr, df1};
            data2 <= data1;
            data3 <= data2;
            data4 <= data3;
        end

// register data
always @(posedge dclk)
	wr_data <= {data4, data3, data2, data1};

endmodule 