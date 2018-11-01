

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "TARGETC" "NUM_INSTANCES" "DEVICE_ID"  "C_TC_AXI_BASEADDR" "C_TC_AXI_HIGHADDR"
}
