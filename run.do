vlib work
vlog -sv 19_Oops_intro.sv
vsim -voptargs=+acc work.top_module
run -all