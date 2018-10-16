connect -url tcp:127.0.0.1:3121
source /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/UDP/prototype_watchman.sdk/prototype_watchman_wrapper_hw_platform_2/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS3 210299A56B81"} -index 0
loadhw -hw /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/UDP/prototype_watchman.sdk/prototype_watchman_wrapper_hw_platform_2/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS3 210299A56B81"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS3 210299A56B81"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS3 210299A56B81"} -index 0
dow /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/UDP/prototype_watchman.sdk/watchman/Debug/watchman.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS3 210299A56B81"} -index 0
con
