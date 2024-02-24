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
  genvar g_row;
  genvar g_col;
  generate 
    for (g_row = 0; g_row < nrow; g_row = g_row + 1) begin
      for (g_col = 0; g_col < ncol; g_col = g_col + 1) begin
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
          .q(q[ncol*g_row + g_col]) // output
        );
      end
    end
  endgenerate
endmodule
