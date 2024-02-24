module servant_gpio
 (input wire i_wb_clk,
   input wire [31:0] i_wb_adr,
   input wire [31:0] i_wb_dat,
   input wire i_wb_we,
   input wire i_wb_cyc,
   output reg [31:0] o_wb_rdt,
   output reg        o_gpio_clk,
   output reg [31:0] o_gpio,
   output reg [31:0] o_gpio_n,
   output reg [31:0] o_gpio_ne,
   output reg [31:0] o_gpio_e,
   output reg [31:0] o_gpio_se,
   output reg [31:0] o_gpio_s,
   output reg [31:0] o_gpio_sw,
   output reg [31:0] o_gpio_w,
   output reg [31:0] o_gpio_nw
 );

  reg gpio_clk;

  always @(posedge i_wb_clk) begin
    o_wb_rdt <= o_gpio;
    gpio_clk <= (i_wb_cyc & i_wb_we & i_wb_adr[5:2]==4'h0);
    o_gpio_clk <= gpio_clk;
    if (i_wb_cyc & i_wb_we) begin
      case (i_wb_adr[5:2])
        4'h0: o_gpio    <= i_wb_dat;
        4'h1: o_gpio_n  <= i_wb_dat;
        4'h2: o_gpio_ne <= i_wb_dat;
        4'h3: o_gpio_e  <= i_wb_dat;
        4'h4: o_gpio_se <= i_wb_dat;
        4'h5: o_gpio_s  <= i_wb_dat;
        4'h6: o_gpio_sw <= i_wb_dat;
        4'h7: o_gpio_w  <= i_wb_dat;
        4'h8: o_gpio_nw <= i_wb_dat;
        default: ;
      endcase
    end
  end
endmodule
