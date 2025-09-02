

//file name : 35_IPC_semaphore.sv
//module name : IPC_semaphore


/*
_______________________________________________________________________________________

    semaphore:
        -> It is used to access the shared resources.
        -> It is bucket which contains a fixed number of tokens.
        -> Each token represents a unit of access to the shared resource.
        -> methods in semaphore:
            +-----------+-----------------------------------------------------------------------------------+
            | Method    | Description                                                                       |
            +-----------+-----------------------------------------------------------------------------------+
            | new()     | Creates a semaphore with a specified number of tokens.                            |
            +-----------+-----------------------------------------------------------------------------------+
            | get()     | Acquires a token from the semaphore.                                              |
            +-----------+-----------------------------------------------------------------------------------+
            | put()     | Releases a token back to the semaphore.                                           |
            +-----------+-----------------------------------------------------------------------------------+
            | try_get() | Attempts to acquire a token without blocking (returns immediately if unavailable).|
            +-----------+-----------------------------------------------------------------------------------+


_______________________________________________________________________________________

*/


//__________________ 1. without semaphore _____________________________

module without_semaphore();

    task write_mem();
        $display("[%0t] : Before Writing to memory", $time);
        # 10;
        $display("[%0t] : Write done", $time);
    endtask : write_mem

    task read_mem();
        $display("[%0t] : Before Reading from memory", $time);
        # 8;
        $display("[%0t] : Read done", $time);
    endtask : read_mem

    initial begin
        $display("\n______________ without semaphore _____________");
        fork
            write_mem();
            read_mem();
        join
    end

endmodule : without_semaphore

/*__________________________________________________________

simulation results:

    # ______________ without semaphore _____________
    #
    # [0] : Writing to memory
    # [0] : Reading from memory
    # [8] : Read done
    # [10] : Write done

Observation:
    -> without writing into memory , read is done which is not possible.
____________________________________________________________*/


//__________________ 2. with semaphore (single key)_____________________________

module with_semaphore();

    semaphore sema = new(1); //single key semaphore

    task write_mem();
        sema.get(); //acquire the key
        $display("[%0t] : Before Writing to memory", $time);
        # 10;
        $display("[%0t] : Write done", $time);
        sema.put(); //release the key
    endtask : write_mem

    task read_mem();
        sema.get(); //acquire the key
        $display("[%0t] : Before Reading from memory", $time);
        # 8;
        $display("[%0t] : Read done", $time);
        sema.put(); //release the key
    endtask : read_mem

    initial begin
        $display("\n______________ with semaphore _____________");
        fork
            write_mem();
            read_mem();
        join
    end

endmodule : with_semaphore

/*__________________________________________________________

simulation results:

   
    # ______________ with semaphore _____________
    #
    # [0] : Before Writing to memory
    # [10] : Write done
    # [10] : Before Reading from memory
    # [18] : Read done

Observation:
    -> first write_mem done and then read_mem is done.
____________________________________________________________*/

//__________________ 3. with semaphore (multi key)_____________________________

module with_semaphore_mult();

    semaphore sema = new(5); //multi key semaphore

    task process1();
        sema.get(4); //acquire the key
        $display("[%0t] : Before Writing to memory", $time);
        # 5;
        $display("[%0t] : Write done", $time);
        sema.put(1); //release the key
    endtask : process1

    task process2();
        sema.get(2); //acquire the key
        $display("[%0t] : Before Reading from memory", $time);
        # 4;
        $display("[%0t] : Read done", $time);
        sema.put(2); //release the key
    endtask : process2

    initial begin
        $display("\n______________ with semaphore multi key _____________\n");
        fork
            process1();
            process2();
        join
    end

endmodule : with_semaphore_mult

/*__________________________________________________________

simulation results:

   
     ______________ with semaphore multi key _____________
    # 
    # [0] : Before Writing to memory
    # [5] : Write done
    # [5] : Before Reading from memory
    # [9] : Read done


Observation:
    -> first process1 done and then process2 is done.
    -> process1 need 4/5 keys. remain = 1key left.
    -> process2 need 2/5 keys. but here only 1key left,
       so sema.get(1) key need to happen for process2 executed
       after process1.
____________________________________________________________*/



//__________________ 4. with semaphore (try_get)_____________________________

module with_semaphore_try_get();

    semaphore sema = new(1); multi key semaphore

    task process1(); 
        if(sema.try_get(1)) begin
            $display("Key is available");
        end else begin
            $display("key is not available");
        end
        $display("[%0t] : Before Writing to memory", $time);
        # 5;
        $display("[%0t] : Write done", $time);
        sema.put(1); release the key
    endtask : process1

    task process2();
         if(sema.try_get(1)) begin
            $display("Key is available");
        end else begin
            $display("key is not available");
        end
        $display("[%0t] : Before Reading from memory", $time);
        # 4;
        $display("[%0t] : Read done", $time);
        sema.put(1); release the key
    endtask : process2

    initial begin
        $display("\n______________ with semaphore try_get_____________\n");
        fork
            process1();
            process2();
        join
    end

endmodule : with_semaphore_try_get

/*__________________________________________________________

simulation results:

   
        #______________ with semaphore try_get_____________
        # 
        # Key is available
        # [0] : Before Writing to memory
        # key is not available
        # [0] : Before Reading from memory
        # [4] : Read done
        # [5] : Write done


Observation:
    -> immediate retun the status of key, avilable or not.
____________________________________________________________*/

//__________________ 5. with semaphore (get more keys back)_____________________________

module put_more_keys();

    semaphore sema = new(2); multi key semaphore

    task process1(); 
        sema.get(2);
        $display("[%0t] : Before Writing to memory", $time);
        # 5;
        $display("[%0t] : Write done", $time);
        sema.put(4); release the key
    endtask : process1

    initial begin
        process1();
    end

endmodule : put_more_keys


/*___________________________________________________

simulation results:

    ____________ putting more key then available ______________
    #
    # [0] : Before Writing to memory
    # [5] : Write done

observations:
    -> here available keys are 2, but put more keys 4.
    -> next process will required 4 keys, but we have max of 2 only.
    -> in this case all other processes will be blocked.

______________________________________________________*/

module IPC_semaphore();

    //without_semaphore ws();
    //with_semaphore ws1();
    //with_semaphore_mult ws2();
    //with_semaphore_try_get tg();
    put_more_keys pmk();


endmodule : IPC_semaphore