# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/antonio/git/vitisMicroPython/micropython_system/_ide/scripts/systemdebugger_micropython_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/antonio/git/vitisMicroPython/micropython_system/_ide/scripts/systemdebugger_micropython_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AB6EC6A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351AB6EC6A-13722093-0"}
fpga -file /home/antonio/git/vitisMicroPython/micropython/_ide/bitstream/hdmi_video_out.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/antonio/git/vitisMicroPython/hdmi_video_out/export/hdmi_video_out/hw/hdmi_video_out.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/antonio/git/vitisMicroPython/micropython/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/antonio/git/vitisMicroPython/micropython/Debug/micropython.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
