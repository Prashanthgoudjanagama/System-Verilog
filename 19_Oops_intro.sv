
// file name : 19_Oops_intro.sv
// module name : top_Oops_intro

/*
    Oops: Object-Oriented Programming System
        --> Oops is nothing but a container which contains various data types as properties and
            tasks/functions as methods.
        --> Oops is a container which contains properties and methods.
        --> syntax:
                class <class_name>;
                    // properties
                    data_types property_name;

                    // methods
                    function method_name(input_parameters);
                        // method body
                    endfunction
                endclass : <class_name>

        --> different Oops concepts:
            1. Class : 
                --> Class is a blueprint of an object.
                --> Class contains properties and methods.
                --> Class is a template for creating objects.
                --> Class is a user-defined data type.
            2. Object : 
                --> Object is an instance of a class.
                --> Object is a real-world entity.
                --> Object contains data and methods.
            3. Inheritance : 
                --> Inheritance is a mechanism to create a new class from an existing class.
                --> The new class is called a derived class or child class.
                --> The existing class is called a base class or parent class.
                --> we use "extends" keyword to inherit a class.
            4. Polymorphism : 
                --> Polymorphism is the ability to take many forms.
                --> It allows methods to do different things based on the object it is acting upon.
            5. Encapsulation : 
                --> Encapsulation is the bundling of data and methods that operate on that data.
                --> It restricts direct access to some of an object's components.
            6. Abstraction : 
                --> Abstraction is the process of hiding the implementation details and showing only the essential features.
                --> It helps to reduce complexity and increase efficiency.

*/


// ================== basic class and object creation ==================

class basic_class;

    // properties
    int land;
    string home;

    // method
    function void display();
        $display("\t\tland : %0d, home : %0s", land, home);
    endfunction : display

endclass : basic_class


module basic_class_test();

    basic_class tc1;   // class instance

    initial begin
        $display("\n--------------------- class and object creation ----------------");
        tc1 = new();   // object creation --> tc1 = new() not called it will give null point error or Bad handle or reference.
        tc1.land = 4;
        tc1.home = "my_home";
        tc1.display();
    end

endmodule : basic_class_test


module sharing_same_memory();

    basic_class ts1, ts2;

    initial begin
        $display("\n---------- both handles uses same memory location ----------");
        ts1 = new();
        ts1.land = 50;
        ts1.home = "home-1";
        $display("\t\tts1 --> land : %0d, home : %0s", ts1.land, ts1.home);

        ts2 = ts1;
        ts2.land = 3;
        ts2.home = "home-2";
        $display("\t\tts2 --> land : %0d, home : %0s", ts2.land, ts2.home);

        $display("\t\tts1 --> land : %0d, home : %0s", ts1.land, ts1.home);
    end

endmodule : sharing_same_memory



module different_memory_location();

    basic_class td1, td2;

    initial begin
        $display("\n---------- both handles uses different memory location ----------");
        td1 = new();
        td1.land = 50;
        td1.home = "home-1";
        $display("\t\ttd1 --> land : %0d, home : %0s", td1.land, td1.home);

        td2 = new();
        td2.land = 3;
        td2.home = "home-2";
        $display("\t\ttd2 --> land : %0d, home : %0s", td2.land, td2.home);

        $display("\t\ttd1 --> land : %0d, home : %0s", td1.land, td1.home);
    end

endmodule : different_memory_location


// ======================= top_module ===========================
module top_Oops_intro();

    basic_class_test bs1();
    sharing_same_memory sh1();
    different_memory_location df1();

    initial begin
        $display("\n----------------------------------------------------------------");
    end

endmodule : top_Oops_intro

/*
# simulation :
--------------------- class and object creation ----------------
# 		land : 4, home : my_home
# 
# ---------- both handles uses same memory location ----------
# 		ts1 --> land : 50, home : home-1
# 		ts2 --> land : 3, home : home-2
# 		ts1 --> land : 3, home : home-2
# 
# ---------- both handles uses different memory location ----------
# 		td1 --> land : 50, home : home-1
# 		td2 --> land : 3, home : home-2
# 		td1 --> land : 50, home : home-1
# 

*/
