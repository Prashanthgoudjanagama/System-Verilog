
// file name: 15_typedef.sv
// module: top_typedef

/*
    typedef: 
    --> typedef is a keyword used to create an alias for an existing data type.
    --> It allows you to define a new name for an existing type, making code more readable and easier to maintain.
    --> Syntax: 
            typedef <existing_type> <new_type_name>;
    --> To declare a typedef variable,
            use: <new_type_name> <variable_name>;

*/

// ========================================== type_def_use_case =======================================
module type_def_use_case();

    typedef int variables;
    variables a, b;

    initial begin
        $display("-----------------------basic typedef use case-------------------------");
        a = 56;
        b = 108;
        $display("\n\t\ta : %0d", a);
        $display("\t\tb : %0d", b);
    end

endmodule :type_def_use_case


// ========================================== typedef_with_enum =======================================
module typedef_with_enum();

    typedef enum { 
        RED, GREEN, BLUE 
    } color;

    typedef color my_color_type; // Creating a typedef for the enum type

    my_color_type my_color;

    initial begin
        $display("\n-----------------------typedef with enum use case-------------------------");
        my_color = GREEN; // Assigning an enum value using typedef
        $display("\n\t\tCurrent color: %s", my_color.name());
    end

endmodule :typedef_with_enum


// ========================================== typedef in state-machine =======================================

module typedef_in_state_machine();

    typedef enum {
        IDLE,
        RUNNING,
        STOPPED
    } state_t;

    state_t current_state;

    initial begin
        $display("\n-----------------------typedef in state-machine use case-------------------------");
        current_state = IDLE;
        $display("\n\t\tCurrent state: %s", current_state.name());
    end

endmodule :typedef_in_state_machine


// ========================================== top_typedef =======================================

module top_typedef();
    type_def_use_case ex1();
    typedef_with_enum ex2();
    typedef_in_state_machine ex3();

    initial begin
        $display("\n--------------------------------------------------------------------");
    end
endmodule : top_typedef