module servant_gpio
 (input wire i_wb_clk,
   input wire [31:0] i_wb_adr,
   input wire [31:0] i_wb_dat,
   input wire i_wb_we,
   input wire i_wb_cyc,
   output reg [31:0] o_wb_rdt,
   output reg        o_gpio_out_clk,
   output reg [31:0] o_gpio_out,
   output reg [31:0] o_gpio_out_n,
   output reg [31:0] o_gpio_out_ne,
   output reg [31:0] o_gpio_out_e,
   output reg [31:0] o_gpio_out_se,
   output reg [31:0] o_gpio_out_s,
   output reg [31:0] o_gpio_out_sw,
   output reg [31:0] o_gpio_out_w,
   output reg [31:0] o_gpio_out_nw,
   output reg        i_gpio_in_clk,
   input wire [31:0] i_gpio_in,
   input wire [31:0] i_gpio_in_n,
   input wire [31:0] i_gpio_in_ne,
   input wire [31:0] i_gpio_in_e,
   input wire [31:0] i_gpio_in_se,
   input wire [31:0] i_gpio_in_s,
   input wire [31:0] i_gpio_in_sw,
   input wire [31:0] i_gpio_in_w,
   input wire [31:0] i_gpio_in_nw
 );

  reg gpio_out_clk;

  always @(posedge i_wb_clk) begin
    o_wb_rdt <= o_gpio_out;
    gpio_out_clk <= (i_wb_cyc & i_wb_we & i_wb_adr[5:2]==4'h0);
    o_gpio_out_clk <= gpio_out_clk;
    if (i_wb_cyc & i_wb_we) begin
      case (i_wb_adr[5:2])
        4'h0: o_gpio_out    <= i_wb_dat;
        4'h1: o_gpio_out_n  <= i_wb_dat;
        4'h2: o_gpio_out_ne <= i_wb_dat;
        4'h3: o_gpio_out_e  <= i_wb_dat;
        4'h4: o_gpio_out_se <= i_wb_dat;
        4'h5: o_gpio_out_s  <= i_wb_dat;
        4'h6: o_gpio_out_sw <= i_wb_dat;
        4'h7: o_gpio_out_w  <= i_wb_dat;
        4'h8: o_gpio_out_nw <= i_wb_dat;
        default: ;
      endcase
    end else if (i_gpio_in_clk) begin
      o_gpio_out    <= i_gpio_in;
      o_gpio_out_n  <= i_gpio_in_n;
      o_gpio_out_ne <= i_gpio_in_ne;
      o_gpio_out_e  <= i_gpio_in_e;
      o_gpio_out_se <= i_gpio_in_se;
      o_gpio_out_s  <= i_gpio_in_s;
      o_gpio_out_sw <= i_gpio_in_sw;
      o_gpio_out_w  <= i_gpio_in_w;
      o_gpio_out_nw <= i_gpio_in_nw;
    end
  end
endmodule
