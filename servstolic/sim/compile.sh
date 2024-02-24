iverilog -o servstolic.vvp \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_rf_if.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_alu.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_csr.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_aligner.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_bufreg.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_rf_ram_if.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_rf_ram.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_bufreg2.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_decode.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_compdec.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_rf_top.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_immdec.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_ctrl.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_state.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_top.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/serv_1.2.1/rtl/serv_mem_if.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servile_1.3.0/servile/servile_mux.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servile_1.3.0/servile/servile_rf_mem_if.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servile_1.3.0/servile/servile.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servile_1.3.0/servile/servile_arbiter.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servant_1.2.1/servant/servant_mux.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servant_1.2.1/servant/servant.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servant_1.2.1/servant/servant_gpio.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servant_1.2.1/servant/servant_ram.v \
$WORKSPACE/build/servant_1.2.1/verilator_tb/src/servant_1.2.1/servant/servant_timer.v \
../rtl/servstolic.v \
../bench/servstolic_tb.v

