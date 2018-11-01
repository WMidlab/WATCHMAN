#
# Create Project Vivado 
#
# createProjectVivado.tcl: Tcl script for re-creating project 'P1FlexSystem'
#
#*****************************************************************************************

# Parameters

# Project Name Definition
set ProjectName "TargetC_Prototype"

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "../"
set origin_proj_dir "${origin_dir}/XilinxBuild/"

#*****************************************************************************************


# Creating Xilinx Vivado Project
create_project $ProjectName $origin_proj_dir

variable script_file
set script_file "CreateProjectVivado.tcl"

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


# OS select
switch -glob -- [lindex $tcl_platform(os) 0] {
	Win* { #Windows
		cd ../hw/user_ip/
		set ip_list [list [exec cmd /c dir /B]]
		cd ../../XilinxBuild/
	}
	Lin* { #Linux
		set ip_list [list [exec ls ${origin_dir}/hw/user_ip/]]

	}
	default {
		puts "Unknow"
	}
}

if {[llength ip_list] > 0} {
	foreach a $ip_list {
		set_property -name "ip_repo_paths" -value "[file normalize "${origin_dir}/hw/user_ip/${a}"]" -objects $obj
	}
}
update_ip_catalog

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
		cd ../hw/images/
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
		if {[exec ls $proj_dir/../$ProjectName/hw/images/$BITProjectWrapper | wc -l] == 1} {
			exec cp $proj_dir/../$ProjectName/hw/images/$BITProjectWrapper $proj_dir/$ProjectName.runs/impl_1/
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
		cd ../hw/images/
		if {[file exist $HDFProjectWrapper] == 1} {
			file copy $HDFProjectWrapper ${proj_dir}/${ProjectName}.sdk/
			puts "Success : HDF save done"
		} else {
			puts "HDF file does not exist"
		}
		cd "${proj_dir}"
	}
	Lin* { #Linux
		if {[exec ls $proj_dir/../$ProjectName/hw/images$HDFProjectWrapper | wc -l] == 1} {
			exec cp $proj_dir/../$ProjectName/hw/images$HDFProjectWrapper $proj_dir/$ProjectName.sdk/
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
