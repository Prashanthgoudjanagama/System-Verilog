
// file name : 17_fork_join.sv
// module name : top_fork_join

/*
    fork-join:
        1. A fork-join block allows concurrent execution of multiple processes.
        2. The fork statement starts a parallel block, and the join 
           statement waits for all processes to complete.
        3. It is used to run tasks or functions in parallel, 
           which can improve performance in certain scenarios.
        4. The processes within a fork-join block can be tasks or functions.
        5. The join statement can be used with or without a timeout.

    fork-join types:
        1. fork ... join
        2. fork ... join_any
        3. fork ... join_none
    
    timeouts in fork-join:
        1. disable fork : terminates all child treads below the current context.
        2. wait fork : waits for all child threads to complete.


  i. fork-join             ii. fork-join_any             iii. fork-join_none
  -------------            -----------------             -------------------
       fork                      fork                           fork
        |                          |                               |
   +----+----+               +-----+-----+                   +-----+-----+----+
   |    |    |               |     |     |                   |     |     |    | 
  T1   T2   T3              T1    T2    T3                  T1    T2    T3    |
   |    |    |               |     |     |                   |     |     |    |
   +----+----+               +     +     +                   +     +     +    +
        |                          |                                          |
      join                    join_any                                    join_none


*/

// ==================== basic fork-join example ========================
module basic_fork_join();

    initial begin
        $display("\n----------------------- basic_fork_join ---------------------------");
        fork
            begin 
                $display("\ttread-1 started at : %0t", $time);
                #25;
                $display("\ttread-1 completed at : %0t", $time);
            end
            begin
                $display("\ttread-2 started at : %0t", $time);
                #10;
                $display("\ttread-2 completed at : %0t", $time);
            end
            begin
                $display("\ttread-3 started at : %0t", $time);
                #15;
                $display("\ttread-3 completed at : %0t", $time);
            end
        // join
        join_any
        // join_none
        disable fork;
        // wait fork;
        $display("\nAll threads completed at : %0t", $time);
    end
endmodule : basic_fork_join



// =============================== top module ===============================
module top_fork_join();
    
    basic_fork_join basic_fork_join_inst();
    

endmodule : top_fork_join