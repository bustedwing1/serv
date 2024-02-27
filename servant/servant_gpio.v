module servant_gpio
  (input wire i_wb_clk,
   input wire [31:0] i_wb_adr,
   input wire [31:0] i_wb_dat,
   input wire i_wb_we,
   input wire i_wb_cyc,
   output reg [31:0] o_wb_rdt,
   output reg        o_gpio_clk,
   output reg [31:0] o_gpio);
   
   reg gpio_clk;

   always @(posedge i_wb_clk) begin
      o_wb_rdt <= o_gpio;
      gpio_clk <= 1'b0;
      if (i_wb_cyc & i_wb_we) begin
         case (i_wb_adr[5:2])
            4'h0: begin
              o_gpio <= i_wb_dat;
              gpio_clk <= 1'b1;
            end
            default: ;
         endcase
      end
      o_gpio_clk <= gpio_clk;
   end
endmodule

