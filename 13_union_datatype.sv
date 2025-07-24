

// file name: 13_union_datatype.sv
// module name: top


/*
    --> Union is a user-defined data type that allows storing different data types in the same memory location.
    --> It can store only one member at a time, which means it uses the same memory location for all its members.
    --> Syntax: 
            union <union_name> { <data_type> <variable_name>; ... };
    --> To declare a union variable, 
            use: <union_name> <variable_name>;
    --> Unions are useful when you want to save memory and only need to store one value at a time.
    --> Unions can be nested, meaning a union can contain another union.
*/

module basic_union_use_case();

    typedef union {
        int    id;              // Employee ID
        real   salary;          // Employee Salary
        int   age;             // Employee Age
    } employee_t; // Define a union type named employee_t


    employee_t emp1;

    initial begin
        $display("------------------------------------------------------");
        $display("\n-------- Basic Union use case --------\n");

        // Store employee ID
        emp1.id = 2007;
        $display("\tEmployee ID: %0d", emp1.id);

        // Overwrite with salary
        emp1.salary = 50000.0;
        $display("\tEmployee Salary: Rs%0.2f", emp1.salary);

        // Overwrite with age
        emp1.age = 30;  
        $display("\tEmployee Age: %0d", emp1.age);
    end

endmodule : basic_union_use_case

// ==================================== Union vs Structure ========================================

module union_vs_structure();

    typedef union {
        int    id_u;              // Employee ID
        real   salary_u;          // Employee Salary
        int   age_u;             // Employee Age
    } employee_t; // Define a union type named employee_t

    typedef struct {
        int    id_s;              // Employee ID
        real   salary_s;          // Employee Salary
        int   age_s;             // Employee Age
    } employee_struct_t; // Define a structure type named employee_struct_t

    employee_t emp_u;
    employee_struct_t emp_s;
    
    initial begin
        $display("------------------------------------------------------");
        $display("\n-------- Union vs Structure --------\n");
        

        $display("\n\t\t ====== printing all structure in one by one ======\n");

        emp_s.id_s = 2007;  
        $display("\tEmployee ID (Structure): %0d", emp_s.id_s);
        emp_s.salary_s = 50000.0;
        $display("\tEmployee Salary (Structure): Rs%0.2f", emp_s.salary_s);
        emp_s.age_s = 30;
        $display("\tEmployee Age (Structure): %0d", emp_s.age_s);


        $display("\n\t\t ====== printing all union in one by one ======\n");
        emp_u.id_u = 2007;  
        $display("\tEmployee ID (Union): %0d", emp_u.id_u); // id_u will be printed
        emp_u.salary_u = 50000.0;   
        $display("\tEmployee Salary (Union): Rs%0.2f", emp_u.salary_u); // salary_u will be printed, id_u will be overwritten
        emp_u.age_u = 30;
        $display("\tEmployee Age (Union): %0d", emp_u.age_u); // age_u will be printed, salary_u will be overwritten

        
        $display("\n\t\t ====== Memory Size Comparison ======\n");
        $display("\tSize of Union: %0d bytes", $bits(emp_u) / 8);
        $display("\tSize of Structure: %0d bytes", $bits(emp_s) / 8);
        $display("\n\tNote: Union uses less memory than Structure as it stores only one member at a time.");
    end

endmodule : union_vs_structure

module top_union();
    
    basic_union_use_case union_example1();
    union_vs_structure union_example2();

    initial begin
        $display("\n-----------------------------------------------------------");
    end

endmodule : top_union