

// file name : 33_events_in_order_and_out_of_order.sv
// module name : top_order


/*

wait_oder in events:
__________________________________________________________________________________

    -> in_order_events: all processes are executed in order which we mentioned.
            syntax: wait_order(e1, e2, e3);

    -> out_of_order_events: all processes are executed in out of order.
            syntax: wait_order(e3, e1, e2);

__________________________________________________________________________________
*/

//____________________________________ in_order_events_____________________________
module in_order_event();

    event e1, e2, e3;

    task proc1();
        # 10;
        -> e1;
        $display("[%0t] : event  e1 triggered", $time);
    endtask : proc1

    task proc2();
        # 30;
        -> e2;
        $display("[%0t] : event e2 triggered", $time);
    endtask : proc2

    task proc3();
        # 20;
        -> e3;
        $display("[%0t] : event e3 triggered", $time);
    endtask : proc3

    task wait_in_order_ex();
        $display("[%0t] : waiting for events in order", $time);
        wait_order(e1, e3, e2)
            $display("all events triggered in order -> e1, e3, e2");
        else
            $display("all events not in order");   
    endtask : wait_in_order_ex

    initial begin
        fork
            proc1();
            proc2();
            proc3();
            wait_in_order_ex();
        join
    end

endmodule : in_order_event

/*______________________________________________________________________________

simulation results:
    # [0] : waiting for events in order
    # [10] : event  e1 triggered
    # [20] : event e3 triggered
    # [30] : event e2 triggered
    # all events triggered in order -> e1, e3, e2

________________________________________________________________________________*/

//____________________________________ out_of__order_events_____________________________

module out_of_order_event();

    event e1, e2, e3;

    task proc1();
        # 10;
        -> e1;
        $display("[%0t] : event  e1 triggered", $time);
    endtask : proc1

    task proc2();
        # 30;
        -> e2;
        $display("[%0t] : event e2 triggered", $time);
    endtask : proc2

    task proc3();
        # 20;
        -> e3;
        $display("[%0t] : event e3 triggered", $time);
    endtask : proc3

    task wait_out_of_order();
        $display("[%0t] : waiting for events out of order", $time);
        wait_order(e3, e1, e2);
        $display("all events triggered in order -> e3, e1, e2");
    endtask : wait_out_of_order

    initial begin
        fork
            proc1();
            proc2();
            proc3();
            wait_out_of_order();
        join
    end

endmodule : out_of_order_event

/*______________________________________________________________________________

simulation results:
    # [0] : waiting for events out of order
    # [10] : event  e1 triggered
    # all events triggered in out of order -> e3, e1, e2
    # [20] : event e3 triggered
    # [30] : event e2 triggered

________________________________________________________________________________*/

module top_order();

    in_order_event in_order_inst();
    out_of_order_event out_of_order_inst();

endmodule : top_order