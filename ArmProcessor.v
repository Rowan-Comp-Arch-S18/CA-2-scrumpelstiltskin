module ps2_mouse_xy(clk, reset, ps2_clk, ps2_data, mx, my, btn);

	input clk, reset;
	input ps2_clk, ps2_data; // data to/from PS/2 mouse
	output [11:0] mx, my;    // the mouse position 
	output [2:0] btn;        // button clicks middle left and right
	
	//parameters
	
	parameter max_x = 1023; // subject to change
	parameter max_y = 767; // subject to change
	
	// mouse wiring
	
	wire [8:0] 	 dx, dy;
   wire [2:0] 	 btn_click;
   wire 	 data_ready;
   wire [1:0] 	 ovf_xy;
   wire 	 streaming;
	
ps2_mouse

	
	m1(
	.clk(clk),
	.reset(reset),
   .ps2_clk(ps2_clk),
   .ps2_data(ps2_data),
   .x_increment(dx),
   .y_increment(dy),
   .data_ready(data_ready),
   .read(1'b1),   
   .left_button(btn_click[2]),
   .right_button(btn_click[0])  
   );
	
	reg [11:0]  mx, my;
   wire        sx = dx[8];		
   wire        sy = dy[8];		
   wire [8:0]  ndx = sx ? {0,~dx[7:0]}+1 : {0,dx[7:0]};	// magnitudes
   wire [8:0]  ndy = sy ? {0,~dy[7:0]}+1 : {0,dy[7:0]};
   
   always @(posedge clk) begin
      mx <= reset ? 0 :
	    data_ready ? (sx ? (mx>ndx ? mx - ndx : 0) 
			  : (mx < MAX_X - ndx ? mx+ndx : MAX_X)) : mx;
       my <= reset ? 0 :
	    data_ready ? (sy ? (my < MAX_Y - ndy ? my+ndy : MAX_Y)
			  : (my>ndy ? my - ndy : 0))  : my;
	end
end module
module ps2_mouse_interface (
  clk,
  reset,
  ps2_clk,
  ps2_data,
  left_button,
  right_button,
  x_increment,
  y_increment,
  data_ready, 
  read,             
  );

