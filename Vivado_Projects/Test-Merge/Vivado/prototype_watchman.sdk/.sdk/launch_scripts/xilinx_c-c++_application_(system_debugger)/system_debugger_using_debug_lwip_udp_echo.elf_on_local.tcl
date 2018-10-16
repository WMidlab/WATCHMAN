connect -url tcp:127.0.0.1:3121
source /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/prototype_watchman.sdk/prototype_watchman_wrapper_hw_platform_1/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 210249992871"} -index 0
loadhw -hw /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/prototype_watchman.sdk/prototype_watchman_wrapper_hw_platform_1/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 210249992871"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 210249992871"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 210249992871"} -index 0
dow /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/prototype_watchman.sdk/lwip_udp_echo/Debug/lwip_udp_echo.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 210249992871"} -index 0
con
