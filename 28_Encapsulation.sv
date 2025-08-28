

// file name : 28_Encapsulation.sv
// module name : top_encap


/*
_______________________________________________________________________________________________

    Encapsulation:

        1. It is a "Data hiding mechanism".
        2. Class properties are hide inside the class only and 
           they are not accessible outside the class.
        3. To restrict the access, we use "access qualifiers".
        4. Access Qualifier are two types,
                i. local access qualifiers.
                ii. protected access qualifiers.

        --> Local access Qualifiers:
                *   Data members and methods with local type, available 
                    for that perticular class only.
                *   If local members are accessed outside the class ====> ___ "error" ____
                    <-- to avoid this initialize with in the class only -->
                *   Local methods accessed outside the class and in the child class ====> ____ "error" ____
                    <-- to avoid this use protected access qualifier -->

        --> Protected access Qualifiers:
                *   method which is declared with protected keyword, that method only accessed
                    in the child class only, not accessed outside the child class.

_______________________________________________________________________________________________
*/

// ___________________ Local access Qualifier _______________________

class parent;

    local int data = 50;
    bit [31:0] id;

    function void display();
        $display("[parent] : data -> %0d, id -> %0d", data, id);
    endfunction : display

endclass : parent


module test1();

    parent p;

    initial begin
        $display("\n----------- local access qualifier ----------------");

        p = new();

        // p.data = 30;   // ---> Illegal access to local member data.
        p.id = 40;

        p.display();
    end

endmodule


// ___________________ local access Qualifier  "2" _______________________

class parent1;

    local int data;
    bit [31:0] id;

    function new();
        data = 400;
        id = 200;
        display();
    endfunction : new

    local function void display();
        $display("[parent] : data -> %0d, id -> %0d", data, id);
    endfunction : display

endclass : parent1


module test2();

    parent1 p;

    initial begin
        $display("\n----------- local mem and methods access with in the class----------------");
        p = new();

    end

endmodule

// ___________________ protected access Qualifier _______________________

class parent2;

    int data;
    bit [31:0] id;


    function new();
        data = 100;
        id = 200;
    endfunction : new

    protected function void display();
        $display("[parent] : data -> %0d, id -> %0d", data, id);
    endfunction : display

endclass : parent2


class child2 extends parent2;

    int sum;

    function void add();
        sum = data + id;
        display();   // calling in child class
        $display("sum : %0d", sum);
    endfunction : add

endclass : child2


module test3();

    child2 c;

    initial begin
        $display("\n----------- protected access qualifier ----------------");
        c = new();

        c.add();
    end
endmodule : test3

//_____________top___________________

module top_encap();

    test1 t1();
    test2 t2();
    test3 t3();


endmodule : top_encap