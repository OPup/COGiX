onerror {quit -f}
vlib work
vlog -work work ise_proj.vo
vlog -work work ise_proj.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ise_proj_vlg_vec_tst
vcd file -direction ise_proj.msim.vcd
vcd add -internal ise_proj_vlg_vec_tst/*
vcd add -internal ise_proj_vlg_vec_tst/i1/*
add wave /*
run -all
