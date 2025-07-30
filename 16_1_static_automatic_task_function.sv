
// file name : 16_1_static_automatic_task_function.sv
// module name : top_static_auto


/*
    Static (Default in Verilog):
        1. Variables are shared across calls.
        2. If the task is called multiple times concurrently, they interfere with each other.  
        3. Memory is allocated once and reused.
        4. Safe for sequential execution only.

    Automatic (Preferred in SV):
        1. Each call gets its own memory copy of variables.
        2. Supports recursive and concurrent execution.
        3. Safe for parallel execution in simulations.
        4. Declared using the keyword automatic.
*/


// =========================================== top module to instantiate all modules =================================
module static_test();

        function int mult(int a, b);
            return a*b;
        endfunction : mult

        function static static_cnt();
            static int cnt = 0;
            cnt++;
            $display("\t static ---> cnt value : %0d", cnt);
        endfunction : static_cnt

        function automatic automatic_cnt();
            int cnt = 0;
            cnt++;
            $display("\t automatic ---> cnt value : %0d", cnt);
        endfunction : automatic_cnt

        int result;

        initial begin
            $display("\n----------------- default function -----------------------");
            result = mult(7,8);
            $display("\t mult of 7 x 8 = %0d", result);
            result = mult(12,8);
            $display("\t mult of 12 x 8 = %0d", result);

            $display("\n ------------------- testing static ----------------------");
            repeat(4) begin
                static_cnt();
            end

            $display("\n ------------------- testing automatic ----------------------");
            repeat(4) begin
                automatic_cnt();
            end
        end

endmodule : static_test

// =========================================== to module =============================================================
module top_static_auto();
    static_test ex1();

endmodule : top_static_auto