
// file_name: 16_0_task_and_function.sv
// module_name: top_task_function

/*
    Verilog Task and Functions
        ==> Functions in Verilog:
                1. Used for combinational logic and pure computation.
                2. Must return a value (via function name).
                3. No delays, no event control, no timing control (#, @, wait are not allowed).
                4. Inputs must be of type input only.
                5. Executes in zero simulation time.
                6. it is synthesizable.
        
        ==> Tasks in Verilog:
                1. Used for both combinational and sequential logic.
                2. Can return values (via output or inout ports).
                3. Can have delays, event control, and timing control.
                4. Inputs can be of type input, output, or inout.
                5. Executes in non-zero simulation time.
                6. it is synthesizable.

    --> what new things are added in system verilog:
            1. Do not require begin-end.
            2. functions can be void typed.
            3. Passing arguments by reference and named arguments.
            4. Tasks can be automatic.
            5. before reaching the end of the task, it can return a value.

==> system_verilog:
        -------------------------------------------------------------------------------------------
        | Feature                 | Verilog                 | SystemVerilog                       |
        | ----------------------- | ----------------------- | ------------------------------------|
        | Argument types          | `input` only (function) | `input`, `output`, `inout`          |
        | Default arguments       | ❌ Not supported        | ✅ Supported                       |
        | Return type (function)  | Required, non-void      | ✅ Can be `void` or typed           |
        | Data types              | `reg`, `wire`, basic    | `logic`, `bit`, `string`, etc.      |
        | OOP support             | ❌ Not supported        | ✅ Classes, inheritance, `virtual` |
        | Inside classes/packages | ❌                      | ✅ Yes                             |
        | Reentrant/automatic     | Only `automatic` tasks  | ✅ Default `automatic` in classes   |
        -------------------------------------------------------------------------------------------
*/

// =========================================== basic_task_function =========================
module basic_task_function();

    // Task declaration
    task automatic display_message(input string msg);
        $display("Message: %s", msg);
    endtask

    // Function declaration
    function int add_numbers(input int a, input int b);
        return a + b;
    endfunction

    int result; // Variable to store the result of the function

    initial begin
        $display("-----------------------basic task and function use case-------------------------");
        
        // Calling the task
        display_message("Hello, SystemVerilog!");

        // Calling the function
        result = add_numbers(10, 20);
        $display("Sum of 10 and 20 is: %0d", result);
    end

endmodule : basic_task_function


// =========================================== even and odd using function =================================

module even_odd_function();

    function int even_odd(int num);
        if(num % 2 == 0) begin
            $display("num is a even : %0d", num);
        end else begin
            $display("num is a odd : %0d", num);
        end
    endfunction : even_odd

    initial begin
        $display("\n----------------------------- even_odd_function---------------------------");
        even_odd(15);       // give other values to check the function
    end

endmodule : even_odd_function

// ========================================== factorial of num ===========================================

module fact();

    function int fact(int num);
        if(num == 0) begin
            return 1;
        end
        else begin
            return num * fact(num-1);
        end
    endfunction : fact 

    int n;

    initial begin
        $display("\n-------------------- factorial of num --------------------------------");
        n = 5;      // Enter different values to check function
        $display("factorial of a %0d ---> %0d", n, fact(n));
    end

endmodule : fact

// ====================================== prime num =====================================================

module prime_num();

    function int is_prime(int num);
        int i;
        if(num < 2) begin
            return 0; // Not prime
        end
        for(i = 2; i <= num / 2; i++) begin
            if(num % i == 0) begin
                return 0; // Not prime
            end
        end
        return 1; // Is prime
    endfunction : is_prime

    int n;

    initial begin
        $display("\n-------------------- prime_num --------------------------------");
        n = 31; // Enter different values to check function
        if(is_prime(n)) begin
            $display("%0d is a prime number.", n);
        end else begin
            $display("%0d is not a prime number.", n);
        end
    end
    
endmodule : prime_num

// =========================================== top_task_function ===========================================
module top_task_function();

    basic_task_function ex1();
    even_odd_function ex2();
    fact ex3();
    prime_num ex4();

    initial begin
        $display("\n--------------------------------------------------------------------");
    end
endmodule : top_task_function
