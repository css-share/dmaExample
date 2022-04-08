# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Xilinx_projects\dmaExample\vitis\dmaEx_pfmPrj\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Xilinx_projects\dmaExample\vitis\dmaEx_pfmPrj\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {dmaEx_pfmPrj}\
-hw {C:\Xilinx_projects\dmaExample\vivado\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Xilinx_projects/dmaExample/vitis}

platform write
platform generate -domains 
platform active {dmaEx_pfmPrj}
platform generate
