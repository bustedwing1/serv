module servstolic
#(
  parameter nrow = 4,
  parameter ncol = 4,
  parameter memfile = "blinky.hex",
  parameter memsize = 16384, // 8192,
  parameter reset_strategy = "MINI",
  parameter sim = 1,
  parameter with_csr = 1,
  parameter [0:0] compress = 0,
  parameter [0:0] align = compress
)
(
  input wire  wb_clk,
  input wire  wb_rst,
  output wire [nrow*ncol-1:0] q
);

  wire        gpio_out_clk [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out     [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out_n   [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out_ne  [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out_e   [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out_se  [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out_s   [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out_sw  [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out_w   [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_out_nw  [0:nrow+1][0:ncol+1];

  wire        gpio_in_clk  [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in      [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in_n    [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in_ne   [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in_e    [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in_se   [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in_s    [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in_sw   [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in_w    [0:nrow+1][0:ncol+1];
  wire [31:0] gpio_in_nw   [0:nrow+1][0:ncol+1];

  genvar g_row;
  genvar g_col;
  generate 
    for (g_row = 1; g_row <= nrow; g_row = g_row + 1) begin
      for (g_col = 1; g_col <= ncol; g_col = g_col + 1) begin
        
        servant 
        #(
          .memfile  (memfile),
          .memsize  (memsize),
          .sim      (sim),
          .with_csr (with_csr),
//           .compress (compressed[0:0]),
          .align    (align[0:0])
        )
        u_servant
        (
          .wb_clk(wb_clk), // input
          .wb_rst(wb_rst), // input
          .q(q[ncol*(g_row-1) + (g_col-1)]), // output
          
          .gpio_out_clk(gpio_out_clk [g_row][g_col]),
          .gpio_out(gpio_out         [g_row][g_col]),
          .gpio_out_n(gpio_in_s      [g_row+1][g_col]),
          .gpio_out_ne(gpio_in_sw    [g_row+1][g_col+1]),
          .gpio_out_e(gpio_in_w      [g_row][g_col+1]),
          .gpio_out_se(gpio_in_nw    [g_row-1][g_col+1]),
          .gpio_out_s(gpio_in_n      [g_row-1][g_col]),
          .gpio_out_sw(gpio_in_ne    [g_row-1][g_col-1]),
          .gpio_out_w(gpio_in_e      [g_row][g_col-1]),
          .gpio_out_nw(gpio_in_se    [g_row+1][g_col-1]),
          
          .gpio_in_clk(gpio_in_clk   [g_row][g_col]),
          .gpio_in(gpio_in           [g_row][g_col]),
          .gpio_in_n(gpio_in_n       [g_row][g_col]),
          .gpio_in_ne(gpio_in_ne     [g_row][g_col]),
          .gpio_in_e(gpio_in_e       [g_row][g_col]),
          .gpio_in_se(gpio_in_se     [g_row][g_col]),
          .gpio_in_s(gpio_in_s       [g_row][g_col]),
          .gpio_in_sw(gpio_in_sw     [g_row][g_col]),
          .gpio_in_w(gpio_in_w       [g_row][g_col]),
          .gpio_in_nw(gpio_in_nw     [g_row][g_col])
        );
      end
    end
  endgenerate
endmodule
