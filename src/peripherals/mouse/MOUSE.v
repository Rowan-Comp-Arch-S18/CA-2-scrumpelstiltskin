module mouse_ps2(clock, reset, mouse_signal, mouse_clk, address, data, read);

		input clock; // de0 clock <- 50MGHZ (Processor max is 46MHz ) 
		input reset;
		input mouse_signal; // should get the data port from mouse
		input mouse_clk; // Should get the ps2 clock from mouse
		input read; // cpu reading from me
		
			// output reg [6:0] HEX0, HEX1, HEX2, HEX3; // changed to HEX instead of LED_BCD used for stand alone
			//	output reg [3:0] LED_Act;
			//	output reg [6:0] LED_out; // data for the first number/ second number/ 3rd/ 4th 
		input [63:0] address;
		output [63:0] data;
		    parameter Daddress = 14'h2250;
			 wire address_detected = ((address == Daddress) && read);
			 assign data = address_detected ? {47'b0, displayed_number} : 64'bz;
		reg [5:0] mouse_bits; // number of bits from the PS2 mouse 
	
		reg [15:0] displayed_number; // value that is increased / decreased value that should be displayed
		reg [3:0] LED_BCD; // Signal for seven seg
			// Signals for displaying on 7-segment LED 
		reg [20:0] refresh_counter; // first bits for refresh rate while last 2 bits for for LED on signals
		wire [1:0] LED_counter; 
			// wire [6:0] LED_BCD; //used for standalone apart from processor
			//33 bits from the mouse	
		
		
			always @(posedge mouse_clk or posedge reset)
			begin
				if(reset == 1)
						mouse_bits <= 0;
				else if(mouse_bits <=31)
						mouse_bits <= mouse_bits +1;
				else
					mouse_bits <= 0;
			end
		always @(negedge mouse_clk or posedge reset)
		begin
				if(reset)
					displayed_number <= 0;
				else begin
					if(mouse_bits == 1 && mouse_signal == 1) begin
						displayed_number <= displayed_number +1;
					end
					else if(mouse_bits == 2) begin
							if (mouse_signal == 1 && displayed_number > 0)
								displayed_number <= displayed_number -1;
								end
					end
		end
		
		always @(posedge clock or posedge reset)
		begin
			if(reset == 1)
				refresh_counter <= 0;
			else
				refresh_counter <= refresh_counter + 1;
		end
		
	/*	assign LED_counter = refresh_counter[20:19];
		  always @(*)
				begin
				case(LED_counter)
				2'b00: begin // 1st digit
						LED_Act = 4'b0111; 
						LED_out = displayed_number/1000;
					end
				2'b01: begin // 2nd digit
						LED_Act = 4'b1011; 
						LED_out = (displayed_number % 1000)/100;
					end
				2'b10: begin // 3rd digit
						LED_Act = 4'b1101; 
						LED_out = ((displayed_number % 1000)%100)/10;
					end
				2'b11: begin // 4th digit
						LED_Act = 4'b1110; 
						LED_out = ((displayed_number % 1000)%100)%10;
					end
        endcase
		end*/
/*		always @(*)
		begin
			case(LED_BCD)
				4'b0000: HEX0 = 7'b0000001; // "0"     
				4'b0001: HEX0 = 7'b1001111; // "1" 
				4'b0010: HEX0 = 7'b0010010; // "2" 
				4'b0011: HEX0 = 7'b0000110; // "3" 
				4'b0100: HEX0 = 7'b1001100; // "4" 
				4'b0101: HEX0 = 7'b0100100; // "5" 
				4'b0110: HEX0 = 7'b0100000; // "6" 
				4'b0111: HEX0 = 7'b0001111; // "7" 
				4'b1000: HEX0 = 7'b0000000; // "8"     
				4'b1001: HEX0 = 7'b0000100; // "9" 
					default: HEX0 = 7'b0000001; // "0"
				endcase
		end
		always @(*)
		begin
			case(LED_BCD)
				4'b0000: HEX1 = 7'b0000001; // "0"     
				4'b0001: HEX1 = 7'b1001111; // "1" 
				4'b0010: HEX1 = 7'b0010010; // "2" 
				4'b0011: HEX1 = 7'b0000110; // "3" 
				4'b0100: HEX1 = 7'b1001100; // "4" 
				4'b0101: HEX1 = 7'b0100100; // "5" 
				4'b0110: HEX1 = 7'b0100000; // "6" 
				4'b0111: HEX1 = 7'b0001111; // "7" 
				4'b1000: HEX1 = 7'b0000000; // "8"     
				4'b1001: HEX1 = 7'b0000100; // "9" 
					default: HEX1 = 7'b0000001; // "0"
				endcase
		end
		always @(*)
		begin
			case(LED_BCD)
				4'b0000: HEX2 = 7'b0000001; // "0"     
				4'b0001: HEX2 = 7'b1001111; // "1" 
				4'b0010: HEX2 = 7'b0010010; // "2" 
				4'b0011: HEX2 = 7'b0000110; // "3" 
				4'b0100: HEX2 = 7'b1001100; // "4" 
				4'b0101: HEX2 = 7'b0100100; // "5" 
				4'b0110: HEX2 = 7'b0100000; // "6" 
				4'b0111: HEX2 = 7'b0001111; // "7" 
				4'b1000: HEX2 = 7'b0000000; // "8"     
				4'b1001: HEX2 = 7'b0000100; // "9" 
					default: HEX2 = 7'b0000001; // "0"
				endcase
		end
		always @(*)
		begin
			case(LED_BCD)
				4'b0000: HEX3 = 7'b0000001; // "0"     
				4'b0001: HEX3 = 7'b1001111; // "1" 
				4'b0010: HEX3 = 7'b0010010; // "2" 
				4'b0011: HEX3 = 7'b0000110; // "3" 
				4'b0100: HEX3 = 7'b1001100; // "4" 
				4'b0101: HEX3 = 7'b0100100; // "5" 
				4'b0110: HEX3 = 7'b0100000; // "6" 
				4'b0111: HEX3 = 7'b0001111; // "7" 
				4'b1000: HEX3 = 7'b0000000; // "8"     
				4'b1001: HEX3 = 7'b0000100; // "9" 
					default: HEX3 = 7'b0000001; // "0"
				endcase
		end */
endmodule
			
		
		