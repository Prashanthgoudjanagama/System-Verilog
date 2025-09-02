

// file name: 36_IPC_mailbox.sv
// module : IPC_mail


/*

______________________________________________________________________________________________________

    Mailbox :
        -> Communication between processes to exchange the data.
        -> One process can put the data into the mailbox, and another process can retrieve it.
        -> Mailbox can internally store the data in FIFO (First In First Out) order.
        -> Mailbox types:
            1. Generic mailbox.
            2. Parameterized mailbox.
            3. Divided based on Size:
                i. Bounded mailbox.
                ii. Unbounded mailbox.


            1. Generic mailbox:
                -> It can store any type of data.
                -> It is declared using the "mailbox" keyword without any parameters.
                -> Example: mailbox mbx = new();

            2. Parameterized mailbox:
                -> It can store a specific type of data.
                -> It is declared using the "mailbox" keyword with a type parameter.
                -> Example: mailbox #(int) mbx = new();

            3.i Bounded mailbox:
                -> It has a fixed size and can hold a limited number of messages.
                -> If the mailbox is full, any attempt to put a message will block until space becomes available.
                -> Example: mailbox #(int) mbx = new(5); // Bounded mailbox with a capacity of 5 messages.

            3.ii Unbounded mailbox:
                -> It has no fixed size and can grow dynamically to accommodate any number of messages.
                -> If the mailbox is full, any attempt to put a message will not block; instead, the message will be dropped or an error will be returned.
                -> Example: mailbox #(int) mbx = new(); // Unbounded mailbox.

    Mailbox Methods:

        +----------------------------+-------------------------------------------+
        |        Method name         |               Description                 |
        +----------------------------+-------------------------------------------+
        | new(int bound=0)           | Creates mailbox (bounded/unbounded).      |
        +----------------------------+-------------------------------------------+
        | put(<data>)                | Blocking store into mailbox.              |
        +----------------------------+-------------------------------------------+
        | try_put(<data>)            | Non-blocking store, returns 1/0.          |
        +----------------------------+-------------------------------------------+
        | get(ref <data>)            | Blocking retrieve from mailbox.           |
        +----------------------------+-------------------------------------------+
        | try_get(ref  <data>)       | Non-blocking retrieve, returns 1/0.       |            
        +----------------------------+-------------------------------------------+
        | peek(ref <data>)           | Copy data without removing.               |
        +----------------------------+-------------------------------------------+
        | try_peek(ref  <data>)      | Non-blocking copy without removing.       |
        +----------------------------+-------------------------------------------+
        | num()                      | Returns number of entries.                |
        +----------------------------+-------------------------------------------+


______________________________________________________________________________________________________

*/
// ______________________ example -1 : Bounded generic mailbox __________________________________

module bounded_generic_mailbox();

    mailbox mbx = new(5); // Bounded mailbox with a capacity of 5 messages.

    bit[63:0] addhar;
    string name;

    task process1();
        //addhar = 64'h3333_2222_1111;
        //name = "jr. NTR";                 // 1st simulation : for single put
        for(int i=1; i< 10; i++) begin
            addhar = i * 32'h1111_1111_1111;
            name = "Jr. NTR";

            mbx.put(addhar);
            $display("\n\tput = {iteration : %0d} --> addhar num added to the mailbox : %0h", i, addhar);
            mbx.put(name);
            $display("\tput = {iteration : %0d} --> name added to the mailbox : %0s\n", i, name);
        end
    endtask : process1

    task process2();
        for(int i =1 ; i< 10; i++) begin
            mbx.get(addhar);
            $display("\n\tget = {iteration : %0d} --> addhar num retrieved from the mailbox : %0h", i, addhar);
            mbx.get(name);
            $display("\tget = {iteration : %0d} --> name retrieved from the mailbox : %0s\n", i, name);
        end
    endtask : process2

    initial begin
        $display("\n__________ bounded Generic Mailbox __________");
        fork
            process1();
            process2();
        join
    end

endmodule : bounded_generic_mailbox

/*_____________________________________________________________________________________________________

    simulation results:
    ______________________________________________________________________
    :::: for single put and get 

                #        __________ bounded Generic Mailbox __________
                # 
                # 	addhar num added to the mailbox : 333322221111
                # 	name added to the mailbox : jr. NTR
                # 
                # 	addhar num retrieved from the mailbox : 333322221111
                # 	name retrieved from the mailbox : jr. NTR

    ______________________________________________________________________
    :::: for multi put and get  -> size more then new(5).

                 __________ bounded Generic Mailbox __________
                # 
                # 	put = {iteration : 1} --> addhar num added to the mailbox : 22223333
                # 	put = {iteration : 1} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 2} --> addhar num added to the mailbox : 44446666
                # 	put = {iteration : 2} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 3} --> addhar num added to the mailbox : 66669999
                # 
                # 	get = {iteration : 1} --> addhar num retrieved from the mailbox : 22223333
                # 	get = {iteration : 1} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 2} --> addhar num retrieved from the mailbox : 44446666
                # 	get = {iteration : 2} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 3} --> addhar num retrieved from the mailbox : 66669999
                # 	get = {iteration : 3} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 	put = {iteration : 3} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 4} --> addhar num added to the mailbox : 8888cccc
                # 	put = {iteration : 4} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 5} --> addhar num added to the mailbox : aaaaffff
                # 	put = {iteration : 5} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 6} --> addhar num added to the mailbox : cccd3332
                # 	put = {iteration : 6} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 4} --> addhar num retrieved from the mailbox : 8888cccc
                # 	get = {iteration : 4} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 5} --> addhar num retrieved from the mailbox : aaaaffff
                # 	get = {iteration : 5} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 6} --> addhar num retrieved from the mailbox : cccd3332
                # 	get = {iteration : 6} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 7} --> addhar num retrieved from the mailbox : eeef6665
                # 
                # 	put = {iteration : 7} --> addhar num added to the mailbox : eeef6665
                # 	put = {iteration : 7} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 8} --> addhar num added to the mailbox : 111119998
                # 	put = {iteration : 8} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 9} --> addhar num added to the mailbox : 13333cccb
                # 	put = {iteration : 9} --> name added to the mailbox : Jr. NTR
                # 
                # 	get = {iteration : 7} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 8} --> addhar num retrieved from the mailbox : 111119998
                # 	get = {iteration : 8} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 9} --> addhar num retrieved from the mailbox : 13333cccb
                # 	get = {iteration : 9} --> name retrieved from the mailbox : Jr. NTR
                # 

    Observations:
        1. In the first case --> new(5) : 
                -> only we are doing single put and get.

        2. In the Second case --> new(5): 
                -> our mailbox size is 5.
                -> we are doing 10 puts and gets.
                -> first 5 puts are done mailbox is full and 
                   then 5 gets now mailbox is empty. then again
                   5 remaining puts and gets.
______________________________________________________________________________________________________*/

module unbounded_generic_mailbox();

    mailbox mbx = new(); // Bounded mailbox with a capacity of 5 messages.

    bit[63:0] addhar;
    string name;

    task process1();
        for(int i=1; i< 10; i++) begin
            addhar = i * 32'h1111_2222_3333;
            name = "Jr. NTR";

            mbx.put(addhar);
            $display("\n\tput = {iteration : %0d} --> addhar num added to the mailbox : %0h", i, addhar);
            mbx.put(name);
            $display("\tput = {iteration : %0d} --> name added to the mailbox : %0s\n", i, name);
        end
       
    endtask : process1

    task process2();
        for(int i =1 ; i< 10; i++) begin
            mbx.get(addhar);
            $display("\n\tget = {iteration : %0d} --> addhar num retrieved from the mailbox : %0h", i, addhar);
            mbx.get(name);
            $display("\tget = {iteration : %0d} --> name retrieved from the mailbox : %0s\n", i, name);
        end
    endtask : process2

    initial begin
        $display("\n__________ unbounded Generic Mailbox __________");
        fork
            process1();
            process2();
        join
    end

endmodule : unbounded_generic_mailbox

/*_____________________________________________________________________________________________
simulation results:

                # __________ unbounded Generic Mailbox __________
                # 
                # 	put = {iteration : 1} --> addhar num added to the mailbox : 22223333
                # 	put = {iteration : 1} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 2} --> addhar num added to the mailbox : 44446666
                # 	put = {iteration : 2} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 3} --> addhar num added to the mailbox : 66669999
                # 	put = {iteration : 3} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 4} --> addhar num added to the mailbox : 8888cccc
                # 	put = {iteration : 4} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 5} --> addhar num added to the mailbox : aaaaffff
                # 	put = {iteration : 5} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 6} --> addhar num added to the mailbox : cccd3332
                # 	put = {iteration : 6} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 7} --> addhar num added to the mailbox : eeef6665
                # 	put = {iteration : 7} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 8} --> addhar num added to the mailbox : 111119998
                # 	put = {iteration : 8} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	put = {iteration : 9} --> addhar num added to the mailbox : 13333cccb
                # 	put = {iteration : 9} --> name added to the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 1} --> addhar num retrieved from the mailbox : 22223333
                # 	get = {iteration : 1} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 2} --> addhar num retrieved from the mailbox : 44446666
                # 	get = {iteration : 2} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 3} --> addhar num retrieved from the mailbox : 66669999
                # 	get = {iteration : 3} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 4} --> addhar num retrieved from the mailbox : 8888cccc
                # 	get = {iteration : 4} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 5} --> addhar num retrieved from the mailbox : aaaaffff
                # 	get = {iteration : 5} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 6} --> addhar num retrieved from the mailbox : cccd3332
                # 	get = {iteration : 6} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 7} --> addhar num retrieved from the mailbox : eeef6665
                # 	get = {iteration : 7} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 8} --> addhar num retrieved from the mailbox : 111119998
                # 	get = {iteration : 8} --> name retrieved from the mailbox : Jr. NTR
                # 
                # 
                # 	get = {iteration : 9} --> addhar num retrieved from the mailbox : 13333cccb
                # 	get = {iteration : 9} --> name retrieved from the mailbox : Jr. NTR
                # 

    observation:
        -> in unbounded mailbox size not specified and all puts done after all gets.

_______________________________________________________________________________________________*/

module param_mailbox();

    mailbox #(string) mbx = new(3); // bounded
    string name;
    
    task proce_1();
        name = "Jr_NTR";
        mbx.put(name);
        $display("\tput --> string into the mbx : %0s", name);
        name = "Sri_venkateswara";
        mbx.put(name);
        $display("\tput --> string into the mbx : %0s\n", name);
    endtask : proce_1

    task proce_2();
        mbx.get(name);
        $display("\tget --> string from the mbx : %0s", name);
        mbx.get(name);
        $display("\tget --> string from the mbx : %0s", name);
    endtask : proce_2

    initial begin
        $display("\n__________ parameterized Mailbox Bounded __________");
        fork 
            proce_1();
            proce_2();
        join
    end

endmodule : param_mailbox

/*
_____________________________________________________________________________________________________
    simulation results:
        # __________ parameterized Mailbox Bounded __________
        # 	put --> string into the mbx : Jr_NTR
        # 	put --> string into the mbx : Sri_venkateswara
        # 
        # 	get --> string from the mbx : Jr_NTR
        # 	get --> string from the mbx : Sri_venkateswara

    Observation:
        -> In this parameterized mailbox we are specifying the data type.
        -> This allows for type safety and prevents data corruption.
    
_____________________________________________________________________________________________________

*/
module try_put_get_mbx();
  mailbox mb = new(3);
  int value;
  
  task pro_A();
    repeat(5) begin
      value = $urandom_range(1, 50);
      if(mb.try_put(value))
        $display("\tsuccessfully try_put data = %0d", value);
      else begin
        $display("\tfailed while try_put data = %0d", value);
        $display("\tNumber of messages in the mailbox = %0d", mb.num());
      end
    end
    $display("\t---------------------------------------");
  endtask

  task pro_B();
    repeat(5) begin
      if(mb.try_get(value))
        $display("\tSuccessfully retrieved try_get data = %0d", value);
      else begin
        $display("\tFailed in try_get data");
        $display("\tNumber of messages in the mailbox = %0d", mb.num());
      end
    end
  endtask
  
  initial begin
    $display("\n__________ try_put and try_get mailbox __________");
    fork
      pro_A();
      pro_B();
    join
  end
endmodule : try_put_get_mbx

/*
_____________________________________________________________________________________________________
    simulation results:
            # __________ try_put and try_get mailbox __________

            # 	successfully try_put data = 47
            # 	successfully try_put data = 36
            # 	successfully try_put data = 45
            # 	failed while try_put data = 48
            # 	Number of messages in the mailbox = 3
            # 	failed while try_put data = 17
            # 	Number of messages in the mailbox = 3
            # 	---------------------------------------
            # 	Successfully retrieved try_get data = 47
            # 	Successfully retrieved try_get data = 36
            # 	Successfully retrieved try_get data = 45
            # 	Failed in try_get data
            # 	Number of messages in the mailbox = 0
            # 	Failed in try_get data
            # 	Number of messages in the mailbox = 0
    
    Observations:
        -> The try_put operation is successful until the mailbox is full.
        -> Once the mailbox is full, subsequent try_put operations fail, 
           and gives message about mailbox status.
        -> The try_get operation is successful until the mailbox is empty.
        -> Once the mailbox is empty, subsequent try_get operations fail, 
           and gives message about mailbox status.

_____________________________________________________________________________________________________

*/

module peek_try_peek_mbx();
  mailbox mb = new(3);
  
  task proce_A();
    int value;
    repeat(3) begin
      value = $urandom_range(1, 50);
      mb.put(value);
      $display("\tput data = %0d", value);
    end
    $display("\t----------------------------------");
  endtask

  task proce_B();
    int value;
    mb.peek(value); // message is not removed
    $display("\tpeek data = %0d", value);
    mb.peek(value); // message is not removed
    $display("\tpeek data = %0d", value);
    if(mb.try_peek(value))
      $display("\tSuccessful try_peek data = %0d", value);
    else begin
      $display("\tFailed in try_peek");
    end
    $display("\t----------------------------------");
    repeat(3) begin
      mb.get(value);
      $display("\tget data = %0d", value);
    end
   $display("\t----------------------------------");
   if(mb.try_peek(value))
      $display("\tSuccessful try_peek data = %0d", value);
    else begin
      $display("\tFailed in try_peek");
    end
  endtask
  
  initial begin
    fork
      $display("__________ peek and try_peek mailbox __________");
      proce_A();
      proce_B();
    join
  end
endmodule

/*
_____________________________________________________________________________________________________
    simulation results:
            # __________ peek and try_peek mailbox __________
            # 	put data = 47
            # 	put data = 36
            # 	put data = 45
            # 	----------------------------------
            # 	peek data = 47
            # 	peek data = 47
            # 	Successful try_peek data = 47
            # 	----------------------------------
            # 	get data = 47
            # 	get data = 36
            # 	get data = 45
            # 	----------------------------------
            # 	Failed in try_peek

    Observations:
        -> The peek operation allows us to view the data without removing it from the mailbox.
        -> The try_peek operation is successful if there is data in the mailbox.
        -> If the mailbox is empty, try_peek fails without removing any data.

_____________________________________________________________________________________________________

*/


/*
_____________________________________________________________________________________________________
    simulation results:

_____________________________________________________________________________________________________

*/



module IPC_mail();

    //bounded_generic_mailbox in1();
    //unbounded_generic_mailbox in2();
    //param_mailbox in3();
    //try_put_get_mbx in4();
    peek_try_peek_mbx in5();

endmodule : IPC_mail