
// file name : 16_2_task_function_passing_methods.sv
// module name : top_passing

/*
    pass by name:
        1. Passes the variable name.
        2. Allows the function to modify the original variable.
        3. Changes made in the function reflect in the calling scope.
        4. do not follow order of evaluation.

    pass by value:
        1. A pass by value argument passing mechanism does copy arguments locally and 
           operate on those variables. 
        2. Any changes in variables in the function will not be visible outside of the function.
    
    pass by reference:
        1. A pass by reference argument passing mechanism does not copy arguments locally, but rather
           passes the reference of the variable.
        2. Any changes in variables in the function will be visible outside of the function.
        3. Changes made in the function reflect in the calling scope.
*/

// ==================== pass by name ========================
module pass_by_name();

        function employee(string name, int id);
            $display("name : %0s, id : %0d", name, id);
        endfunction : employee

        task write(bit[31:0] data = 32'haaaa_bbbb, bit[7:0] addr = 8'h12);
            $display("data : %0h, addr : %0h", data, addr);
        endtask : write

        initial begin
            $display("\n------------- pass by name ------------------");
            employee(.id(123), .name("JAMES"));   // order not followed 
        end

endmodule : pass_by_name

// ==================== pass by value =======================
module pass_by_value();

        function int mult(int a, b);
            a = a*b;
            return a;
        endfunction : mult

        int a, b, result;

        initial begin
            $display("\n------------- pass by value ------------------");
            a = 5;
            b = 3;
            result = mult(a,b);
            $display("a = %0d, b = %0d, result = %0d", a, b, result);  // a = 5, b = 3, result = 15
        end

endmodule : pass_by_value

// ==================== pass by reference ====================
module pass_by_reference();

        function automatic int mult_r(ref int a, int b);  // a must be automatic other wise error
            a = a*b;
            return a;
        endfunction : mult_r

        int a, b, result;

        initial begin
            $display("\n------------- pass by ref ------------------");
            a = 5;
            b = 3;
            result = mult_r(a,b);
            $display("a = %0d, b = %0d, result = %0d", a, b, result);  // a = 15, b = 3, result = 15
        end

endmodule

// ==================== top module to instantiate all modules ========================
module top_passing();

  pass_by_name name_inst();
  pass_by_value value_inst();
  pass_by_reference ref_inst();

endmodule : top_passing