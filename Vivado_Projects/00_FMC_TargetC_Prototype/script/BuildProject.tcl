#
# Create Project Vivado 
#
# createProjectVivado.tcl: Tcl script for re-creating project 'P1FlexSystem'
#
#*****************************************************************************************

# Parameters

# Project Name Definition
set ProjectName "FMC_TARGETC_Prototype"

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "../"
set origin_proj_dir "${origin_dir}/XilinxBuild/"

#*****************************************************************************************


# Creating Xilinx Vivado Project
create_project $ProjectName $origin_proj_dir

variable script_file
set script_file "BuildProject.tcl"

set proj_dir [get_property directory [current_project]]
cd ${proj_dir}

# Set project properties
set obj [current_project]
set_property -name "corecontainer.enable" -value "1" -objects $obj
set_property -name "part" -value "xc7z010clg400-1" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "generate_ip_upgrade_log" -value "0" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_MEMORY" -objects $obj


# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/hw/src/98_Basic_Component/CNT_EN.vhdl"]\
 [file normalize "${origin_dir}/hw/src/98_Basic_Component/iobuf.vhd"]\
 [file normalize "${origin_dir}/hw/src/98_Basic_Component/clockcrossing_Buffer.vhd"]\
 [file normalize "${origin_dir}/hw/src/98_Basic_Component/afifoV2.vhdl"]\
 [file normalize "${origin_dir}/hw/src/98_Basic_Component/fifo.vhdl"]\
 [file normalize "${origin_dir}/hw/src/98_Basic_Component/counter.vhdl"]\
 [file normalize "${origin_dir}/hw/src/98_Basic_Component/DFF.vhd"]\
 [file normalize "${origin_dir}/hw/src/FiFo_Manager/DataDecoder.vhdl"]\
 [file normalize "${origin_dir}/hw/src/AXI_Stream_Interface/AXI-STREAM_INTERFACE.vhdl"]\
 [file normalize "${origin_dir}/hw/src/FiFo_Manager/AddressDecoder.vhdl"]\
 [file normalize "${origin_dir}/hw/src/FiFo_Manager/FIFO_MANAGER.vhdl"]\
 [file normalize "${origin_dir}/hw/src/TARGETC_TOPLEVEL.vhd"]\
 [file normalize "${origin_dir}/hw/src/99_Packages/Register_pkg.vhd"]\
 [file normalize "${origin_dir}/hw/src/99_Packages/AXI_Lite_pkg.vhd"]\
 [file normalize "${origin_dir}/hw/src//99_Packages/TARGETC_pkg.vhd"]\
 [file normalize "${origin_dir}/hw/src/Digitization_Readout/READOUT_DIGITIZATION_SAMPLE.vhd"]\
 [file normalize "${origin_dir}/hw/src/Register_Handler/REGISTER_HANDLER.vhd"]\
 [file normalize "${origin_dir}/hw/src/Clock_Management/CLOCK_MANAGEMENT.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/WindowStoreV4.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/CPU_CONTROLLERV3.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/RoundBufferV6.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/TRIGGER_CONTROLLER.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/SingleTrigger.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/LookupTable_LE.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/Window_BrainV2.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/BlockDelay.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/BitSelector.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/HammingDecoderV2.vhd"]\
 [file normalize "${origin_dir}/hw/src/TargetC_Control/TARGETC_Control.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/GrayEncoder.vhd"]\
 [file normalize "${origin_dir}/hw/src/Round_Buffer/GrayDecoder.vhd"]\
 [file normalize "${origin_dir}/hw/src/99_Packages/WindowCPU_pkg.vhd"]\
] 
add_files -norecurse -fileset $obj $files

update_compile_order -fileset sources_1

# Set Project BD for Project
switch -glob -- [lindex $tcl_platform(os) 0] {
	Win* { #Windows
		cd ../hw/bd/
		set ProjectBD [exec cmd /c dir /B]
		cd ../../XilinxBuild/
		cd ../hw/bd/${ProjectBD}/hdl/
		set ProjectWrapper [file rootname [exec cmd /c dir /B]]
		cd ../../../../XilinxBuild/
	}
	Lin* { #Linux
		set ProjectBD [exec ls ${origin_dir}/hw/bd/]
		set ProjectWrapper [file rootname [exec ls -1 ${origin_dir}/hw/bd/${ProjectBD}/hdl/]]

	}
	default {
		puts "Unknow"
	}
}

#Generate Name of file from the ProjectBD and Wrapper
set FileProjectBD "${ProjectBD}.bd"
set VHDProjectWrapper "${ProjectWrapper}.vhd"
set BITProjectWrapper "${ProjectWrapper}.bit"
set HDFProjectWrapper "${ProjectWrapper}.hdf"
set HWDEFProjectWrapper "${ProjectWrapper}.hwdef"


# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/hw/bd/${ProjectBD}/hdl/${VHDProjectWrapper}"]\
 [file normalize "${origin_dir}/hw/bd/${ProjectBD}/${FileProjectBD}"]\
] 

# [file normalize "${origin_dir}/hdl/base_zynq.vhd"]\

add_files -norecurse -fileset $obj $files
#add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
set file "${origin_dir}/hw/bd/${ProjectBD}/${FileProjectBD}"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "registered_with_manager" -value "1" -objects $file_obj

#set file "${origin_dir}/hdl/base_zynq.vhd"
#set file [file normalize $file]
#set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
#set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "${origin_dir}/hw/bd/${ProjectBD}/hdl/${VHDProjectWrapper}"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
#set_property -name "top" -value "base_zynq_wrapper" -objects $obj


# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "include_dirs" -value "${origin_dir}/hw/src" -objects $obj
#set_property -name "top" -value "base_zynq_wrapper" -objects $obj
#set_property "top" "P1CoreZC706" $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "${origin_dir}/hw/Constraints/DebugCore.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "${origin_dir}/hw/Constraints/DebugCore.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

set file "[file normalize "${origin_dir}/hw/Constraints/Implementation.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "${origin_dir}/hw/Constraints/Implementation.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

set file "[file normalize "${origin_dir}/hw/Constraints/Pinout.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "${origin_dir}/hw/Constraints/Pinout.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

set file "[file normalize "${origin_dir}/hw/Constraints/Timing.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "${origin_dir}/hw/Constraints/Timing.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7z020clg484-1 -flow {Vivado Synthesis 2018} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2018" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property -name "needs_refresh" -value "1" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7z020clg484-1 -flow {Vivado Implementation 2018} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2018" [get_runs impl_1]
}

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:${ProjectName}"

puts "INFO: Updating compile order..."

update_compile_order -fileset sources_1


puts "INFO: Regenerating ip cores needed for the block design..."

generate_target all [get_files "${origin_dir}/hw/bd/${ProjectBD}/${FileProjectBD}"]
export_ip_user_files -of_objects [get_files "${origin_dir}/hw/bd/${ProjectBD}/${FileProjectBD}"] -no_script -sync -force -quiet
export_simulation -of_objects [get_files "${origin_dir}/hw/bd/${ProjectBD}/${FileProjectBD}"] -directory "${origin_dir}/${ProjectName}.ip_user_files/sim_scripts" -ip_user_files_dir "${origin_dir}/${ProjectName}.ip_user_files" -ipstatic_source_dir "${origin_dir}/${ProjectName}.ip_user_files/ipstatic" -lib_map_path [list {modelsim="${origin_dir}/${ProjectName}.cache/compile_simlib/modelsim"} {questa="${origin_dir}/${ProjectName}.cache/compile_simlib/questa"}] -use_ip_compiled_libs -force -quiet


puts "INFO: Exporting hardware design files for the SDK."
file mkdir "${origin_proj_dir}/${ProjectName}.sdk"

#write_hwdef -force  -file "${origin_proj_dir}/${ProjectName}.sdk/${HDFProjectWrapper}"

cd "${proj_dir}"

puts "Save BIT File"
switch -glob -- [lindex $tcl_platform(os) 0] {
	Win* { #Windows
		cd ../images/
		if {[file exist $BITProjectWrapper] == 1} {
			file mkdir ${proj_dir}/${ProjectName}.runs
			file mkdir ${proj_dir}/${ProjectName}.runs/impl_1
			file copy $BITProjectWrapper ${proj_dir}/${ProjectName}.runs/impl_1/
			puts "Success : BIT save done"
		} else {
			puts "BIT file does not exist"
		}
		cd "${proj_dir}"
	}
	Lin* { #Linux
		if {[file exist $proj_dir/../images/$BITProjectWrapper] == 1} {
			file mkdir ${proj_dir}/${ProjectName}.runs
			file mkdir ${proj_dir}/${ProjectName}.runs/impl_1
			exec cp $proj_dir/../images/$BITProjectWrapper $proj_dir/$ProjectName.runs/impl_1/
			puts "Success : BIT Save Done"
		} else {
			puts "BIT File does not exist"
		}
	}
	default {
		puts "Unknow"
	}
}

puts "Save HDF File"
switch -glob -- [lindex $tcl_platform(os) 0] {
	Win* { #Windows
		cd ../images/
		if {[file exist $HDFProjectWrapper] == 1} {
			file copy $HDFProjectWrapper ${proj_dir}/${ProjectName}.sdk/
			puts "Success : HDF save done"
		} else {
			puts "HDF file does not exist"
		}
		cd "${proj_dir}"
	}
	Lin* { #Linux
		if {[file exist $proj_dir/../images/$HDFProjectWrapper] == 1} {
			file mkdir ${proj_dir}/${ProjectName}.sdk
			exec cp $proj_dir/../images/$HDFProjectWrapper $proj_dir/$ProjectName.sdk/
			puts "Success : HDF Save Done"
		} else {
			puts "HDF File does not exist"
		}
	}
	default {
		puts "Unknow"
	}
}
cd "${proj_dir}"
set_property top base_zynq_wrapper [current_fileset]
