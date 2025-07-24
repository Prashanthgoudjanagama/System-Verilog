

// file name: 14_enumaration.sv
// module name: top_enum

/*
    --> Enumeration (enum) is a user-defined data type that consists of a set of named values.
    --> It allows you to define a variable that can take one of the predefined values.
    --> Syntax: 
            enum <enum_name> { <value1>, <value2>, ... };
    --> To declare an enum variable, 
            use: <enum_name> <variable_name>;
    --> Enums are useful for representing a fixed set of related constants, improving code readability.
    --> Enum Methods:
            - name(): Returns the name of the enum value.
            - num(): Returns the numeric value of the enum.
            - first(): Returns the first value of the enum.
            - last(): Returns the last value of the enum.
            - next(): Returns the next value in the enum sequence.
            - prev(): Returns the previous value in the enum sequence.

*/


// ==========================================enum_syntax========================================

module enum_syntax();

    typedef enum { 
        RED, GREEN, BLUE 
    } color;

    color my_color;

    initial begin
        $display("------------------------------------------------------");
        $display("\n-------- Basic Enum use case --------\n");

        my_color = RED; // Assigning an enum value
        $display("\t\tTotal num of colors: %0d", my_color.num());
        $display("\t\tFirst color: %s", my_color.first().name());
        $display("\t\tNext color after RED: %s", my_color.next().name());
        $display("\t\tLast color: %s", my_color.last().name());
        $display("\t\tCurrent color: %s", my_color.name());
    end

endmodule :enum_syntax


// ========================================== enum_ex2 =======================================

module enum_ex2();

    typedef enum { 
        SUNDAY=16, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY // start from 16 to 17, 18, 19, 20, 21, 22
    } day_of_week;

    day_of_week today;

    initial begin
        $display("------------------------------------------------------");
        $display("\n-------- Enum Example 2 --------\n");

        today = MONDAY; // Assigning an enum value
        $display("\t\tToday is: %s , date : %0d", today.name(), today);
        $display("\t\tTotal days in enum: %0d", today.num());
        $display("\t\tNext day: %s", today.next());
        $display("\t\tPrevious day: %s", today.prev().name());
    end

endmodule : enum_ex2

// ========================================== Enum ex3 =======================================

module enum_ex3;
  // name : The next number will be associated with name starting from 0
  // GREEN = 0, YELLOW = 1, RED = 2, BLUE = 3
  typedef enum {GREEN, YELLOW, RED, BLUE} color_set_1;

  // name = C : Associates the constant C to name
  // MAGENTA = 2, VIOLET = 7, PURPLE = 8, PINK = 9
  typedef enum {MAGENTA=2, VIOLET=7, PURPLE, PINK} color_set_2;

  // name[N] : Generates N named constants : name0, name1, ..., nameN-1
  // BLACK0 = 0, BLACK1 = 1, BLACK2 = 2, BLACK3 = 3
  typedef enum {BLACK[4]} color_set_3;

  // name[N] = C : First named constant gets value C and subsequent ones
  // are associated to consecutive values
  // RED0 = 5, RED1 = 6, RED2 = 7
  typedef enum {RED[3] = 5} color_set_4;

  // name[N:M] : First named constant will be nameN and last named
  // constant nameM, where N and M are integers
  // YELLOW3 = 0, YELLOW4 = 1, YELLOW5 = 2
  typedef enum {YELLOW[3:5]} color_set_5;

  // name[N:M] = C : First named constant, nameN will get C and
  // subsequent ones are associated to consecutive values until nameM
  // WHITE3 = 4, WHITE4 = 5, WHITE5 = 6
  typedef enum {WHITE[3:5] = 4} color_set_6;

  initial begin
    // Create new variables for each enumeration style
  	color_set_1 color1;
    color_set_2 color2;
    color_set_3 color3;
    color_set_4 color4;
    color_set_5 color5;
    color_set_6 color6;

    $display("------------------------------------------------------");
    $display("\n-------- Enum Example 3 --------\n");

    color1 = YELLOW; 
    $display ("color1 = %0d, name = %s", color1, color1.name()); // YELLOW = 1

    color2 = PURPLE; 
    $display ("color2 = %0d, name = %s", color2, color2.name()); // PURPLE = 8

    color3 = BLACK3; 
    $display ("color3 = %0d, name = %s", color3, color3.name()); // BLACK3 = 3

    color4 = RED1;   
    $display ("color4 = %0d, name = %s", color4, color4.name()); // RED1 = 6

    color5 = YELLOW3; 
    $display ("color5 = %0d, name = %s", color5, color5.name()); // YELLOW3 = 0

    color6 = WHITE4; 
    $display ("color6 = %0d, name = %s", color6, color6.name()); // WHITE4 = 5

  end
endmodule : enum_ex3

// ===========================================top_enum========================================
module top_enum();

    enum_syntax enum_example1();
    enum_ex2 enum_example2();
    enum_ex3 enum_example3();

    initial begin
        $display("\n------------------------------------------------------------\n");
    end
endmodule : top_enum