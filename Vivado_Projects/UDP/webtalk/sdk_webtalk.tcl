webtalk_init -webtalk_dir /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "2018-08-13 12:01:46" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2018.1" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2018.1" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "epjnlslm4h1q2d2dscjkme2nhh" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2018.1_18" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "18" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 14.04.5 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-2400 CPU @ 3.10GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3200.023 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "16.701 GB" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1534197689000" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key isZynq -value "true" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key isZynqMP -value "false" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key Processors -value "2" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key VivadoVersion -value "2018.1" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key Arch -value "zynq" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key Device -value "7z010" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key IsHandoff -value "true" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key os -value "NA" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key apptemplate -value "NA" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key RecordType -value "HWCreation" -context "sdk\\\\hardware/1534197689000"
webtalk_add_data -client sdk -key uid -value "NA" -context "sdk\\\\bsp/1534197706152"
webtalk_add_data -client sdk -key RecordType -value "ToolUsage" -context "sdk\\\\bsp/1534197706152"
webtalk_add_data -client sdk -key BootgenCount -value "0" -context "sdk\\\\bsp/1534197706152"
webtalk_add_data -client sdk -key DebugCount -value "0" -context "sdk\\\\bsp/1534197706152"
webtalk_add_data -client sdk -key PerfCount -value "0" -context "sdk\\\\bsp/1534197706152"
webtalk_add_data -client sdk -key FlashCount -value "0" -context "sdk\\\\bsp/1534197706152"
webtalk_add_data -client sdk -key CrossTriggCount -value "0" -context "sdk\\\\bsp/1534197706152"
webtalk_add_data -client sdk -key QemuDebugCount -value "0" -context "sdk\\\\bsp/1534197706152"
webtalk_transmit -clientid 3752938114 -regid "" -xml /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/webtalk/usage_statistics_ext_sdk.xml -html /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/webtalk/usage_statistics_ext_sdk.html -wdm /home/idlab-52/Desktop/GitVivado/WATCHMAN/prototype_watchman/webtalk/sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
