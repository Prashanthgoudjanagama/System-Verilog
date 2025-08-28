vlib work
vlog -sv 31_typedef_class.sv
vsim -voptargs=+acc work.top_typedef
run -all