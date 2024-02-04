onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB/x
add wave -noupdate /TB/v
add wave -noupdate /TB/expected
add wave -noupdate /TB/distance_
add wave -noupdate /TB/reset
add wave -noupdate /TB/clk
add wave -noupdate /TB/start
add wave -noupdate /TB/flag
add wave -noupdate /TB/done
add wave -noupdate /TB/distance
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2170 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {305 ps} {5085 ps}
