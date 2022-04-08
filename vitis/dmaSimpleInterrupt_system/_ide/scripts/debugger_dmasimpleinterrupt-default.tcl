# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Xilinx_projects\dmaExample\vitis\dmaSimpleInterrupt_system\_ide\scripts\debugger_dmasimpleinterrupt-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Xilinx_projects\dmaExample\vitis\dmaSimpleInterrupt_system\_ide\scripts\debugger_dmasimpleinterrupt-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248AA59A3" && level==0 && jtag_device_ctx=="jsn-Zed-210248AA59A3-23727093-0"}
fpga -file C:/Xilinx_projects/dmaExample/vitis/dmaSimpleInterrupt/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Xilinx_projects/dmaExample/vitis/dmaEx_pfmPrj/export/dmaEx_pfmPrj/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Xilinx_projects/dmaExample/vitis/dmaSimpleInterrupt/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Xilinx_projects/dmaExample/vitis/dmaSimpleInterrupt/Debug/dmaSimpleInterrupt.elf
configparams force-mem-access 0
bpadd -addr &main
