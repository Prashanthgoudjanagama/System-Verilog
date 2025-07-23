
// file name : 4_loops.sv
// module name : loops

module loops();

    int i,j;
    int for_var;
    int while_var;
    int do_while_var;
    bit [7:0] array[10];  // same as verilog mem
    bit [7:0] array_2d[2][3]; // for 2d_array

    // for loop
    initial begin
        $display("\n============for-loop===============");
        for(i=0; i<=10; i++) begin  
            for_var = i * 12;
            $display("12 x %0d = %0d", i, for_var);  
        end

        // write a logic to find the num is divided by 13
        $display("\n============for-loop with if-else===============");
        for(i =0; i<=100; i++) begin  // initialization;condition;increment
            if(i % 13 == 0) begin
                $display("divided by 13 : %0d", i);
            end
            else begin
                $display("not divided by 13");
            end
        end

        $display("\n============while-loop==============="); 
        //while loop
        i = 0; //initialization
        while(i <= 10) begin  //condition
            while_var = i * 15;
            $display("15 x %0d = %0d", i, while_var);
            i++;  // increment
        end

        $display("\n============do_while-loop===============");
        //do-while
        i=0; // initialization
        do begin
            do_while_var = i*20;
            $display("20 x %0d = %0d", i, do_while_var);
            i++; // increment
        end
        while(i <= 10); // condition

        $display("\n============foreach-loop===============");
        // foreach loop
        // it is used to display array or iterate arrays.
        foreach(array[i]) begin  
            array[i] = i * 5;
            $display("array[%0d] = %0d", i, array[i]);
        end
        $display("array ---> %0p", array);


        foreach(array_2d[i,j]) begin
            array_2d[i][j] = j;
        end
        $display("array_2d ---> %0p", array_2d);

        $display("\n==============continue===============");
        //continue
        for(i=0; i<10; i++) begin
            for_var = i*2;
            if(i==5 || i==3) begin
                continue;
            end
            $display("in continue :     2 x %0d = %0d", i, for_var);
        end


        $display("\n==============break===============");
        // break
        for(i=0; i<10; i++) begin
            for_var = i*2;
            if(i==5) begin
                break;
            end
            $display("in break :     2 x %0d = %0d", i, for_var);
        end
    end

endmodule : loops


// conclusions:

/*
    1. do_while loop is executed at least once, even if the condition is false.
    2. foreach loop is used to iterate arrays.
    3. continue is used to skip the current iteration and continue with the next iteration.
    4. break is used to exit the loop immediately.
*/

