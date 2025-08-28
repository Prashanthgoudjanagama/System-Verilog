

// file name : 29_extern_keyword.sv
// module name : top_extern


/*
____________________________________________________________________

Extern keyword:
    1. Extern keyword is used to declare a variable or function that is 
       defined outside the current scope.
    
    2. It is commonly used in SystemVerilog to interface with external C 
       functions or variables.

    3. When you declare a variable or function as extern, you are telling 
       the compiler that the actual definition of that variable or function 
       exists elsewhere, typically in another file or language (like C).

____________________________________________________________________

*/


class extern_class;

    int data;
    bit [31:0] id;

    extern function new();

    extern function void display(); // declaration of extern function

endclass : extern_class


module test_extern();

    extern_class tr;

    initial begin
        $display("\n\t________ extern keyword ____________");
        tr = new();
        tr.display();
    end

endmodule : test_extern

// Definition of extern function new
function extern_class::new();
    data = 100;
    id = 2;
endfunction : new

// Definition of extern function display
function void extern_class::display();
    $display("Data: %d, ID: %0d", data, id);
endfunction : display



//______________________________________________________________________
module top_extern();

    test_extern te();

endmodule : top_extern