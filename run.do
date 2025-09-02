vlib work
vlog -sv 36_IPC_mailbox.sv
vsim -voptargs=+acc work.IPC_mail
run -all