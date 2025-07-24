

// file name : 12_structure_datatype.sv
// module name : top

/*
    --> Structure is a user-defined data type that allows grouping of different data types.
    --> It will use the different memory locations to store the data.
    --> Structures can contain variables of different data types.
    --> Syntax: 
            struct <structure_name> { <data_type> <variable_name>; ... };
    --> To declare a structure variable, 
            use: <structure_name> <variable_name>;
    --> Structures can be used to represent complex data types like points, rectangles, etc.
    --> Structures can be nested, meaning a structure can contain another structure.

    --> concepts inside the struct:
            1. packed struct.
            2. unpacked struct.
            3. array of structures.
            4. nested structures.
*/

// ======================== Basic structure declaration ==================================================

module Basic_use_case();

    struct {
        int id;          // Employee ID
        string name;    // Employee Name
        real salary;    // Employee Salary
    } emp1;     // Define a structure type named employee_t

    // Declare a structure variable
    
    initial begin
        // Initialize the structure variable
        $display("------------------------------------------------------");
        $display("\n-------- Basic use case --------\n");
        emp1.id = 1302007; 
        emp1.name = "J P Goud";
        emp1.salary = 50000.0;

        // Display the structure variable
        $display("\tEmployee ID: %0d", emp1.id);
        $display("\tEmployee Name: %s", emp1.name);
        $display("\tEmployee Salary: Rs%0.2f", emp1.salary);
    end

endmodule : Basic_use_case


// ==================================== using typedef datatype ================================



module struct_with_typedef();

    typedef struct{
        string name;
        string position;
        int id;
        real salary;
    } employee_t;

    employee_t e1, e2, e3;

    initial begin
        e1.position = "SV GR-I";
        e1.name = "JAWAHAR SHARMA";
        e1.id = 1302009;
        e1.salary = 35013.89;

        e2 = e1;
        e2.name = "LADDU YADAV";
        e2.id = 1302010;

        e3 = e2;
        e3.name = "VARUN RAWAL";
        e3.id = 1101026;


        $display("\n----------- e1 -------------\n");
        $display("\t Name : %0s", e1.name);
        $display("\t Position : %0s", e1.position);
        $display("\t Id : %0d", e1.id);
        $display("\t salary : Rs.%0.2f", e1.salary);

        $display("\n----------- e2 -------------\n");
        $display("\t Name : %0s", e2.name);
        $display("\t Position : %0s", e2.position);
        $display("\t Id : %0d", e2.id);
        $display("\t salary : Rs.%0.2f", e2.salary);

        $display("\n----------- e3 -------------\n");
        $display("\t Name : %0s", e3.name);
        $display("\t Position : %0s", e3.position);
        $display("\t Id : %0d", e3.id);
        $display("\t salary : Rs.%0.2f", e3.salary);
    end

endmodule : struct_with_typedef


// ======================================== packed structure ===============================================
/* 
    Packed structs are treated as a single vector of bits. 
    Useful for bit-level manipulation, synthesis, and interfacing with hardware. 
*/

module packed_struct_example();
    // Define a packed structure
    typedef struct packed {
        logic [7:0] id;          // 8-bit ID
        logic [31:0] name;       // 32-bit Name (as an example)
        logic [31:0] salary;     // 32-bit Salary
    } employee_packed_t;

    employee_packed_t emp;

    initial begin
        emp.id = 8'hA1;          // Assigning hex value to ID
        emp.name = "John";       // Assigning string to Name
        emp.salary = 32'h0000C350; // Assigning hex value to Salary (50000 in decimal)

        $display("\n-------- Packed Structure Example --------\n");
        $display("\tEmployee ID: %0h", emp.id);
        $display("\tEmployee Name: %s", emp.name);
        $display("\tEmployee Salary: Rs.%0d", emp.salary);
    end
endmodule : packed_struct_example

// ======================================== unpacked structure ===============================================
/* 
    Unpacked structs are treated as individual variables, each occupying its own memory location. 
    Useful for complex data structures where each field can be accessed independently.
*/
module unpacked_struct_example();
    // Define an unpacked structure
    typedef struct {
        int id;          // Employee ID
        string name;    // Employee Name
        real salary;    // Employee Salary
    } employee_unpacked_t;

    employee_unpacked_t emp;

    initial begin
        emp.id = 1302008; 
        emp.name = "A K Sharma";
        emp.salary = 60000.0;

        $display("\n-------- Unpacked Structure Example --------\n");
        $display("\tEmployee ID: %0d", emp.id);
        $display("\tEmployee Name: %s", emp.name);
        $display("\tEmployee Salary: Rs.%0.2f", emp.salary);
    end
endmodule : unpacked_struct_example

// ======================================== array of structure ===============================================

module array_of_structures();
    typedef struct {
        int id;
        string name;
        real salary;
    } employee_t;

    employee_t employees[3]; // Array of 3 employees

    initial begin
        // Initializing the array of structures
        employees[0] = '{id: 1302001, name: "Alice", salary: 50000.0};
        employees[1] = '{id: 1302002, name: "Bob", salary: 60000.0};
        employees[2] = '{id: 1302003, name: "Charlie", salary: 70000.0};

        $display("\n-------- Array of Structures Example --------\n");
        foreach (employees[i]) begin
            $display("\tEmployee %0d:", i);
            $display("\t\tID: %0d", employees[i].id);
            $display("\t\tName: %s", employees[i].name);
            $display("\t\tSalary: Rs.%0.2f", employees[i].salary);
        end
    end
endmodule : array_of_structures

// ======================================== nested structures ===============================================
module nested_structures();
    typedef struct {
        int id;
        string name;
    } employee_t;

    typedef struct {
        employee_t emp; // Nested structure
        string department;
    } department_t;

    department_t dept;

    initial begin
        // Initializing the nested structure
        dept.emp.id = 1302004;
        dept.emp.name = "David";
        dept.department = "Engineering";

        $display("\n-------- Nested Structures Example --------\n");
        $display("\tEmployee ID: %0d", dept.emp.id);
        $display("\tEmployee Name: %s", dept.emp.name);
        $display("\tDepartment: %s", dept.department);
    end
endmodule : nested_structures

// =========================================== randomization of structure ============================================================

/* 
   Note: Randomization of structures is not shown in this example, 
   but it can be done using the `randc` or `rand` methods in SystemVerilog.
*/

module randomization_example();
    typedef struct {
        int id;
        string name;
        real salary;
    } employee_t;

    employee_t emp;

    initial begin
        $display("\n------------------- Randomized Structure Example ---------------------\n");
        // Randomize the structure using $urandom_range(min, max)
        repeat (5) begin
            emp.id = $urandom_range(1000000, 9999999); // Random ID between 1,000,000 and 9,999,999
            emp.salary = $urandom_range(30000, 100000); // Random salary between 30,000 and 100,000
            emp.name = $sformatf("%c", $urandom_range(65, 90));  // %c is char it generates a random character from A to Z

            $display("\tEmployee ID: %0d", emp.id);
            $display("\tEmployee Name: %s", emp.name);
            $display("\tEmployee Salary: Rs.%0.2f", emp.salary);
            $display("\n\n");
        end
    end
endmodule : randomization_example

// =========================================== top module ============================================================

module top();
    Basic_use_case bas();
    struct_with_typedef typ();
    packed_struct_example pack();
    unpacked_struct_example unpack();
    array_of_structures arr();
    randomization_example rand_struct();
    nested_structures nest();
    
    initial begin
        $display("\n--------------------------------------------------------------------------------------");
    end
endmodule : top
