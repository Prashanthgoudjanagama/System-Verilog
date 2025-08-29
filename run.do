vlib work
vlog -sv 34_merging_events.sv
vsim -voptargs=+acc work.top_merge
run -all