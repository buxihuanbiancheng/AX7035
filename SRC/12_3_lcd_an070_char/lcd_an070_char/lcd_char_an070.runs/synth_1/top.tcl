# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tfgg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.cache/wt [current_project]
set_property parent.project_path D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
add_files D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/osd.coe
read_verilog -library xil_defaultlib {
  D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/src/ax_pwm.v
  D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/src/video_define.v
  D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/src/color_bar.v
  D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/src/osd_display.v
  D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/src/timing_gen_xy.v
  D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/src/top.v
}
read_ip -quiet D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/ip/osd_rom/osd_rom.xci
set_property used_in_implementation false [get_files -all d:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/ip/osd_rom/osd_rom_ooc.xdc]

read_ip -quiet D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/ip/video_pll/video_pll.xci
set_property used_in_implementation false [get_files -all d:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/ip/video_pll/video_pll_board.xdc]
set_property used_in_implementation false [get_files -all d:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/ip/video_pll/video_pll.xdc]
set_property used_in_implementation false [get_files -all d:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/ip/video_pll/video_pll_late.xdc]
set_property used_in_implementation false [get_files -all d:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/sources_1/ip/video_pll/video_pll_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/constrs_1/new/lcd_test.xdc
set_property used_in_implementation false [get_files D:/demo_ax7035/demo_ax7035/12_3_lcd_an070_char/lcd_an070_char/lcd_char_an070.srcs/constrs_1/new/lcd_test.xdc]


synth_design -top top -part xc7a35tfgg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"