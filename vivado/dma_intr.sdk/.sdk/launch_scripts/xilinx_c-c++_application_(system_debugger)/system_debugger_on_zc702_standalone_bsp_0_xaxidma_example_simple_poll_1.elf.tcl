connect -url tcp:xhdbfarmd13:3121
source /proj/css/Krishna.M/dma_designs/simple_dma/simple_dma.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203345589A"} -index 0
loadhw /proj/css/Krishna.M/dma_designs/simple_dma/simple_dma.sdk/design_1_wrapper_hw_platform_0/system.hdf
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203345589A"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203345589A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203345589A"} -index 0
dow /proj/css/Krishna.M/dma_designs/simple_dma/simple_dma.sdk/standalone_bsp_0_xaxidma_example_simple_poll_1/Debug/standalone_bsp_0_xaxidma_example_simple_poll_1.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203345589A"} -index 0
con
