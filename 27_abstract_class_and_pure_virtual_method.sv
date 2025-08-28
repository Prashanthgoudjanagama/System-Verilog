

// file name : 27_abstract_class_and_pure_virtual_method.sv
// module name : top_pure_virtual_method

/*
//_______________________________________________________________________________________________________

abstract class:
        1. cannot be instantiated.
        2. can contain pure virtual methods.
        3. we use "virtual" keyword to define a abstract class.
            virtual class base_class;

            endclass : base_class
        4. use case:
            clean and clear visibility of code.

pure virtual methods:
        1. methods declaration
            class base_class;
                pure virtual function void display();
            endclass

        2. methods definition in child class
            class child_class extends base_class;
                function void display();
                    $display("Display function of child class");
                endfunction
            endclass

        3. if defination not done in child class, then it will throw an error.
            class child_class extends base_class;
            endclass

//_______________________________________________________________________________________________________

*/


//__________________________ with pure virtual method ________________________________

virtual class parent;

    int data;
    bit [31:0] id;

    pure virtual function void display(); // pure virtual method

endclass : parent

class child extends parent;

    function void display(); // overriding the pure virtual method
        $display("\t[child]: data -> %0d, id -> %0d", data, id);
    endfunction

endclass : child

module with_pure_virtual_method;

    child c;

    initial begin
        $display("\n\t________ with pure virtual method in abstract class ____________");
        c = new();
        c.data = 10;
        c.id = 20;

        c.display();
    end

endmodule : with_pure_virtual_method


/*_______________________________________________________________________________________________________

    note:
            1. If pure virtual method, not in abstract class ---> error
            2. If pure virtual method defination, not in child class ---> error
            3. If abstract class is instatiated (object creation)--> error 
_______________________________________________________________________________________________________*/


module top_pure_virtual_method();
 
    with_pure_virtual_method inst();
    pure_virtual_not_in_abstract inst1();

endmodule : top_pure_virtual_method
