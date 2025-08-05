vlib work
vlog -sv 22_Oops_Shallow_and_Deep_copies.sv
vsim -voptargs=+acc work.top_copies
run -all