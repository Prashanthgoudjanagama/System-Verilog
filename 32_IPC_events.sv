
file name : 32_IPC_events.sv
module name : top_events


/*
_____________________________________________________________________________________

    Inter-process Communication (IPC):
      * IPC is used for communication between different processes.
      * Usually for synchronization purpose we use.
      * These are classified into 3-types:
                1. events.
                2. mailboxes.
                3. semaphores.
       
      * events:
                -> These are used for signaling between processes.
                -> Events can be triggered by one process and can be waited on by another.
                -> Events are typically used for synchronization purposes.

                +----------------+----------------------------------------------------------------------------------------------------+
                | Event operator | Description                                                                                        |
                +----------------+----------------------------------------------------------------------------------------------------+
                | ->             | • Triggers an event that unblocks all waiting processes due to this event.                         |
                |                | • It is an instantaneous event.                                                                    |
                +----------------+----------------------------------------------------------------------------------------------------+
                | ->>            | • Used to trigger non-blocking events.                                                             |
                +----------------+----------------------------------------------------------------------------------------------------+
                | @              | • Blocks the process until an event is triggered.                                                  |
                |                | • Edge-sensitive operator.                                                                         |
                |                | • Waiting for an event should be executed before triggering an event to avoid blocking processes.  |
                +----------------+----------------------------------------------------------------------------------------------------+
                | wait           | • Similar to @ operator.                                                                           |
                |                | • Unblocks the process even if triggering an event and waiting for an event happen at the same time|
                +----------------+----------------------------------------------------------------------------------------------------+

_____________________________________________________________________________________

*/


//_____________________________________ simple event example-1 _____________________________________________

module event_ex1();

    event e1;

    task process1();
        # 100;
        $display("[%0t] : before event triggered", $time);
        -> e1;
        $display("[%0t] : after event triggered", $time);
        
    endtask : process1

    task process2();
        $display("[%0t] : before waiting the event", $time);
        @e1;
        $display("[%0t] : event triggered done", $time);
    endtask : process2

    initial begin
        fork 
            $display("\n_______________ example-1 : wait at 0 and triggered at 100 ___________________");
            process1();
            process2();
        join
    end

endmodule : event_ex1

/*________________________________________________________

simulation results:

    # _______________ example-1 : wait at 100 and triggered at 0 ___________________
    # [0] : before waiting the event
    # [100] : before event triggered
    # [100] : after event triggered
    # [100] : event triggered done

__________________________________________________________*/


//________________________________________ example -2 ________________________________________
module event_ex2();

    event e2;

    task process3();
        $display("[%0t] : before event triggered", $time);
        -> e2;
        $display("[%0t] : after event triggered", $time);
        
    endtask : process3

    task process4();
        # 100;
        $display("[%0t] : before waiting the event", $time);
        @e2;
        //wait(e2.triggered);
        $display("[%0t] : event triggered done", $time);
    endtask : process4

    initial begin
        fork 
            $display("\n_______________ example-2 : wait at 0 and triggered at 100 ___________________\n");
            process3();
            process4();
        join
    end

endmodule : event_ex2

/*________________________________________________________

simulation results:

    # _______________ example-2 : wait at 0 and triggered at 100 ___________________
    # 
    # [0] : before event triggered
    # [0] : after event triggered
    # [100] : before waiting the event

note :
    -> In this two process, waiting at 100 and trigger at 0. so triggered done before
       the @ wait event happens. 
    -> After the @ wait event will not executed.


__________________________________________________________*/

//________________________________________ example -3 ________________________________________
module event_ex3();

    event e3;

    task process5();
        $display("[%0t] : before event triggered", $time);
        -> e3;
        $display("[%0t] : after event triggered", $time);
        
    endtask : process5

    task process6();
        $display("[%0t] : before waiting the event", $time);
        //@e3;
        wait(e3.triggered);
        $display("[%0t] : event triggered done", $time);
    endtask : process6

    initial begin
        fork 
            $display("\n_______________ example-3 : wait at 0 and triggered at 0 ___________________\n");
            process5();
            process6();
        join
    end

endmodule : event_ex3

/*_________________________________________________________________________________

    simulation results:
            # _______________ example-3 : wait at 0 and triggered at 0 ___________________
            # 
            # [0] : before event triggered
            # [0] : after event triggered
            # [0] : before waiting the event
            # [0] : event triggered done  
            
    note:
        -> If the both the triggering and waiting done at 0(same time), 
                => with @e3 ===== not displayed after triggered.
                => with wait(e3.triggered) ===== display all.
___________________________________________________________________________________*/

//________________________________________ example -4 ________________________________________
module event_ex4();

    event e4;

    task process7();
        $display("[%0t] : before event triggered", $time);
        //->e4;
        ->> e4;
        $display("[%0t] : after event triggered", $time);
        
    endtask : process7

    task process8();
        $display("[%0t] : before waiting the event", $time);
        @e4;
        //wait(e4.triggered);
        $display("[%0t] : event triggered done", $time);
    endtask : process8

    initial begin
        fork 
            $display("\n_______________ example-4 : non-blocking event ___________________\n");
            process7();
            process8();
        join
    end

endmodule : event_ex4

/*_________________________________________________________________________________

    simulation results:
            # _______________ example-4 : non-blocking event ___________________
            # 
            # [0] : before event triggered
            # [0] : after event triggered
            # [0] : before waiting the event
            # [0] : event triggered done 
            
    note:
        -> If the both the triggering and waiting done at 0(same time),
                => with ->e4 ===== not displayed after wait.
                => with ->>e4 ===== display all.
___________________________________________________________________________________*/

module top_events();

    //event_ex1 e();
    //event_ex2 ex();
    //event_ex3 ex3();
    event_ex4 ex4();

endmodule : top_events

