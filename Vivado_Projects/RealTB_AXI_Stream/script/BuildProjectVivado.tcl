#
# Build Project Vivado 
#
# BuildProjectVivado.tcl: Tcl script for re-creating project 'P1FlexSystem'
#
#*****************************************************************************************

# Parameters

# Project Name Definition
set ProjectName			"RealTB_AXI_Stream"
set OperatingSystem		"Linux"
#variable OperatingSystem	"Windows"
set ProjectStructure	"Vivado"
#set ProjectStructure	"IDLAB"

#*****************************************************************************************

set build_dir [get_property directory [current_project]]
set CurProject [get_property name [current_project]]

if {[string equal $OperatingSystem "Linux"]} {
	puts "Building Folder Structure...for Linux OS"
	
	exec mkdir $build_dir/$ProjectName
	exec mkdir $build_dir/$ProjectName/hw
	exec mkdir $build_dir/$ProjectName/hw/bd
	exec mkdir $build_dir/$ProjectName/hw/user_ip
	exec mkdir $build_dir/$ProjectName/hw/sim
	exec mkdir $build_dir/$ProjectName/hw/src
	exec mkdir $build_dir/$ProjectName/hw/images
	
	exec mkdir $build_dir/$ProjectName/XilinxBuild
	exec mkdir $build_dir/$ProjectName/script
	exec mkdir $build_dir/$ProjectName/sdk
	
	puts "Building Folder Structure >> DONE"
}

puts "Copying bd Folder"
exec cp -r $build_dir/$CurProject.srcs/sources_1/bd $build_dir/$ProjectName/hw/

#puts "Copying bd Folder"
#exec cp -r $build_dir/$ProjectName.src/source_1/bd $build_dir/$ProjectName/hw/bd

puts "Copying hwdef File into images (if any)"
set hwdef [file tail [exec ls $build_dir/$CurProject.srcs/sources_1/bd/]]
set file_hwdef "${hwdef}_wrapper"
if {[exec ls $build_dir/$CurProject.runs/impl_1/$file_hwdef.hwdef | wc -l] == 1} {
	exec cp $build_dir/$CurProject.runs/impl_1/$file_hwdef.hwdef $build_dir/$ProjectName/hw/images
} else {
	puts "File does not exist"
}
puts "Copying FPGA bit File into images (if any)"
if {[exec ls $build_dir/$CurProject.runs/impl_1/$file_hwdef.hwdef | wc -l] == 1} {
	exec cp $build_dir/$CurProject.runs/impl_1/$file_hwdef.bit $build_dir/$ProjectName/hw/images

} else {
	puts "BD File does not exist"
}



