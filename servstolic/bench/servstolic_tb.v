//-----------------------------------------------------------------------------
// blinky_tb.v
//
// git clone https://github.com/bustedwing1/servstolic
//
// Description:
//   This block instantiates multiple SERV RISC-V processors in a rxc stolic
//
//------------------------------------------------------------------------------

`timescale 1 ns /  100 ps
module tb;
  parameter nrow = 4;
  parameter ncol = 4;
  parameter memfile = "blinky.hex";
  parameter memsize = 8192;
  parameter sim = 1;
  parameter with_csr = 1;
  parameter compressed = 0;
  parameter align = compressed;

  reg  wb_rst = 0;
  wire [nrow*ncol-1:0] q;

  wire [31:0] pc_adr;
  wire	      pc_vld;

  // ==========================================================================
  // Generate a clock that toggles every 5nsec, resulting in a 100MHz pulsing
  // clock with a 50% duty cycle
  reg wb_clk = 0;
  always
  begin
   #5 // Wait 5 ns
   wb_clk <= !wb_clk; // toggle the clock
  end

//   always
//   begin
//    #100000 // Wait 5 ns
//    $display($time);
//   end

  always @(q)
  begin
    $display($time, ": q=%0h",q);
  end

  servstolic
  #(.nrow     (nrow),
    .ncol     (ncol),
    .memfile  (memfile),
    .memsize  (memsize),
    .sim      (sim),
    .with_csr (with_csr),
    .compress (compressed[0:0]),
    .align    (align[0:0])
  )
  u_servstolic (
    .wb_clk(wb_clk),  // input
    .wb_rst(wb_rst),  // input
    .q(q)             // output
  );


  // ==========================================================================
  // MAIN TEST INITIAL BLOCK
  integer ii = 0;
  initial begin
  
    $display($time, " info: Start of Simulation ii = %d", ii);
    wb_rst = 1;
    repeat(10) @(posedge wb_clk);

    wb_rst = 0;
    repeat(10) @(posedge wb_clk);

    repeat(50000) @(posedge wb_clk);

    $display($time, " info: End of Simulation");
    
    $finish;
  end // end of MAIN TEST initial block

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, tb);
  end
  
  
  

endmodule


//    assign pc_adr = dut.wb_mem_adr;
//    assign pc_vld = dut.wb_mem_ack;


// `default_nettype none
// module servant_sim
//   (input wire	      wb_clk,
//    input wire	      wb_rst,
//    output wire	      q);
//
//    reg [1023:0] firmware_file;
//    initial
//      if ($value$plusargs("firmware=%s", firmware_file)) begin
// 	$display("Loading RAM from %0s", firmware_file);
// 	$readmemh(firmware_file, dut.ram.mem);
//      end
//
//    servant
//    dut(wb_clk, wb_rst, q);



