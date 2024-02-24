`default_nettype none
module servant_sim
  (input wire	      wb_clk,
   input wire	      wb_rst,
   output wire [31:0] pc_adr,
   output wire	      pc_vld,
   output wire	      q);

   parameter memfile = "";
   parameter memsize = 8192;
   parameter with_csr = 1;
   parameter compressed = 0;
   parameter align = compressed;
   
   wire        gpio_out_clk;
   wire [31:0] gpio_out;
   wire [31:0] gpio_out_n;
   wire [31:0] gpio_out_ne;
   wire [31:0] gpio_out_e;
   wire [31:0] gpio_out_se;
   wire [31:0] gpio_out_s;
   wire [31:0] gpio_out_sw;
   wire [31:0] gpio_out_w;
   wire [31:0] gpio_out_nw;

   wire        gpio_in_clk = gpio_out_clk;
   reg  [31:0] gpio_in    = 32'h10;
   reg  [31:0] gpio_in_n  = 32'h11;
   reg  [31:0] gpio_in_ne = 32'h12;
   reg  [31:0] gpio_in_e  = 32'h13;
   reg  [31:0] gpio_in_se = 32'h14;
   reg  [31:0] gpio_in_s  = 32'h15;
   reg  [31:0] gpio_in_sw = 32'h16;
   reg  [31:0] gpio_in_w  = 32'h17;
   reg  [31:0] gpio_in_nw = 32'h18;


   reg [1023:0] firmware_file;
   initial
     if ($value$plusargs("firmware=%s", firmware_file)) begin
	$display("Loading RAM from %0s", firmware_file);
	$readmemh(firmware_file, dut.ram.mem);
     end

   servant
     #(.memfile  (memfile),
       .memsize  (memsize),
       .sim      (1),
       .with_csr (with_csr),
       .compress (compressed[0:0]),
       .align    (align[0:0]))
   dut(
     .wb_clk (wb_clk), 
     .wb_rst (wb_rst), 
     .q      (q),

     .gpio_out_clk(gpio_out_clk),
     .gpio_out(gpio_out),
     .gpio_out_n(gpio_out_n),
     .gpio_out_ne(gpio_out_ne),
     .gpio_out_e(gpio_out_e),
     .gpio_out_se(gpio_out_se),
     .gpio_out_s(gpio_out_s),
     .gpio_out_sw(gpio_out_sw),
     .gpio_out_w(gpio_out_w),
     .gpio_out_nw(gpio_out_nw),

     .gpio_in_clk(gpio_in_clk),
     .gpio_in(gpio_in),
     .gpio_in_n(gpio_in_n),
     .gpio_in_ne(gpio_in_ne),
     .gpio_in_e(gpio_in_e),
     .gpio_in_se(gpio_in_se),
     .gpio_in_s(gpio_in_s),
     .gpio_in_sw(gpio_in_sw),
     .gpio_in_w(gpio_in_w),
     .gpio_in_nw(gpio_in_nw)

     );

   assign pc_adr = dut.wb_mem_adr;
   assign pc_vld = dut.wb_mem_ack;

endmodule
