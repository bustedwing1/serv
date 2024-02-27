module servgrid
#(
  parameter nrow = 4,
  parameter ncol = 4,
  parameter memfile = "blinky_fast.hex.hex",
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
//   input wire [31:0] i_wb_proc_adr,
//   input wire [31:0] i_wb_proc_dat,
//   input wire [3:0]  i_wb_proc_sel,
//   input wire        i_wb_proc_we,
//   input wire        i_wb_proc_stb,
//   output wire [31:0] o_wb_proc_rdt,
//   output wire        o_wb_proc_ack,
  output wire [nrow*ncol-1:0] q
);

  wire [31:0] wb_proc_rdt [0:nrow*ncol-1];
  wire        wb_proc_ack [0:nrow*ncol-1];
//   assign o_wb_proc_rdt = wb_proc_rdt[i_wb_proc_adr[19:16]];
//   assign o_wb_proc_ack = wb_proc_ack[i_wb_proc_adr[19:16]];

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

//           .i_wb_proc_adr(i_wb_proc_adr),
//           .i_wb_proc_dat(i_wb_proc_dat),
//           .i_wb_proc_sel(i_wb_proc_sel),
//           .i_wb_proc_we(i_wb_proc_we),
//           .i_wb_proc_stb(i_wb_proc_stb),
//           .o_wb_proc_rdt(wb_proc_rdt[nrow*g_row+g_col]),
//           .o_wb_proc_ack(wb_proc_ack[nrow*g_row+g_col]),

          .q(q[ncol*g_row + g_col]) // output
        );
      end
    end
  endgenerate
endmodule
