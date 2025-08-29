

// file name : 34_merging_events.sv
// module : top_merge


/*
_______________________________________________________________

    Merge Events:
        -> one event can be assigned to another event.
        -> So, that waiting of the other event can be avoided, 
           by triggering the other event.
_______________________________________________________________
*/


module top_merge();

  event e1, e2;
  
  task process_A();
    e2 = e1;
    #10;
    ->e2;
    $display("@%0t: process_A: event e2 is triggered", $time);
  endtask
  
  task process_B();
    $display("@%0t: process_B: waiting for the event e1", $time);
    wait(e1.triggered);
    $display("@%0t: process_B: event e1 is received", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule : top_merge

/*____________________________________________________________

    simulation results:

        # @0: process_B: waiting for the event e1
        # @10: process_A: event e2 is triggered
        # @10: process_B: event e1 is received

    note:
        -> There are two events e1 and e2.
        -> In process_A, an event e2 variable is assigned with the e1 variable and 
           an event e2 is triggered.
        -> In process_B, the wait() construct is waiting for event e1 to be triggered. 
        -> Due to event merging, even though process_B is unblocked due to e2 event 
           triggering even though it is waiting for event e1.
