vlib work
vlog -sv 17_fork_join.sv
vsim -voptargs=+acc work.top_fork_join
run -all