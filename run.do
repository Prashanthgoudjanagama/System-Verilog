vlib work
vlog -sv 13_union_datatype.sv
vsim -voptargs=+acc work.top_union
run -all