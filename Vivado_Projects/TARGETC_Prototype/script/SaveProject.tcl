#
# Create Project Vivado 
#
# createProjectVivado.tcl: Tcl script for re-creating project 'P1FlexSystem'
#
#*****************************************************************************************

# Parameters

# Project Name Definition
set ProjectName [get_property name [current_project]]
set build_dir [get_property directory [current_project]]
# Set the reference directory for source file relative paths (by default the value is script directory path)

#*****************************************************************************************

set proj_dir [get_property directory [current_project]]

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
		set ProjectBD [exec ls ${build_dir}/../hw/bd/]
		set ProjectWrapper [file rootname [exec ls -1 ${build_dir}/../hw/bd/${ProjectBD}/hdl/]]

	}
	default {
		puts "Unknow"
	}
}

#Generate Name of file from the ProjectBD and Wrapper
set BITProjectWrapper "${ProjectWrapper}.bit"
set HDFProjectWrapper "${ProjectWrapper}.hdf"

puts "Save BIT File"
# Set Project BD for Project
switch -glob -- [lindex $tcl_platform(os) 0] {
	Win* { #Windows
		cd ${build_dir}/${ProjectName}.runs/impl_1/
		if {[exec cmd /c dir /B $BITProjectWrapper] == 1} {
			exec cmd /c copy $BITProjectWrapper $build_dir/../hw/images
			puts "Success : BIT Save Done"
		} else {
			puts "BIT File does not exist"
		}
		cd ${build_dir}
	}
	Lin* { #Linux
		if {[exec ls $build_dir/$ProjectName.runs/impl_1/$BITProjectWrapper | wc -l] == 1} {
			exec cp $build_dir/$ProjectName.runs/impl_1/$BITProjectWrapper $build_dir/../hw/images
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
# Set Project BD for Project
switch -glob -- [lindex $tcl_platform(os) 0] {
	Win* { #Windows
		cd ${build_dir}/${ProjectName}.sdk/
		if {[exec cmd /c dir /B $HDFProjectWrapper] == 1} {
			exec cmd /c copy $HDFProjectWrapper $build_dir/../hw/images
			puts "Success : HDF Save Done"
		} else {
			puts "HDF File does not exist"
		}
		cd ${build_dir}
	}
	Lin* { #Linux
		if {[exec ls $build_dir/$ProjectName.sdk/$HDFProjectWrapper | wc -l] == 1} {
			exec cp $build_dir/$ProjectName.sdk/$HDFProjectWrapper $build_dir/../hw/images
			puts "Success : HDF Save Done"
		} else {
			puts "HDF File does not exist"
		}
	}
	default {
		puts "Unknow"
	}
}
cd ${build_dir}
