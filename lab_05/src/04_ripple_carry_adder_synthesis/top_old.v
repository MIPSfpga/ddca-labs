module ripple_carry_adder
# (
    parameter width = 8
)
(
    input    [ width - 1 : 0 ] x,
    input    [ width - 1 : 0 ] y,
    output   [ width - 1 : 0 ] z,
	output                     carry_out
);

    wire [ width - 1 : 0 ] carry;

    generate
    
        genvar i;
    
        for (i = 0; i <= width - 1; i = i + 1)
        begin : stage
		  if( i == 0) begin
				half_adder HA
				(
					.x( x [i] ),
					.y( y [i] ),
					.z( z [i] )
				);
			end
			else
			if (i == (width - 1))
			begin
				full_adder FA
				(
					.x		   ( x [i] ),
					.y         ( y [i] ),
					.carry_in  ( carry [i - 1] ),
					.z         ( z [i] ),
					.carry_out ( carry_out )
				);
			end
			else
			begin
				full_adder FA
				(
					.x		   ( x [i] ),
					.y         ( y [i] ),
					.carry_in  ( carry [i - 1] ),
					.z         ( z [i] ),
					.carry_out ( carry [i] )
				);
			end
				end
    endgenerate

endmodule

//--------------------------------------------------------------------

`ifndef SIMULATION

module top
(
    input         fast_clk,
    input         slow_clk,
    input         rst_n,
    input         fast_clk_en,
    input  [ 3:0] key,
    input  [ 7:0] sw,
    output [ 7:0] led,
    output [ 7:0] disp_en,
    output [31:0] disp,
    output [ 7:0] disp_dot
);

    wire [3:0] res_vld;

    ripple_carry_adder
    # ( .width (4) )
    adder
    (
        .x        ( sw [3:0] ),
        .y        ( sw [7:4] ),
        .z        ( led[6:0] ),
        .carry_out( led[7]   )
    );

    assign disp_en  = 8'b0;
    assign disp_dot = 8'b0;

endmodule

`endif