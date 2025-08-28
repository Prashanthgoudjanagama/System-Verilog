

// file name: 25_Virtual_keyword.sv
// module name: top_virtual

/*
        VIRTUAL keyword:
            i.   It will used in Parent class.
            ii.  It will allow the child class to override the method
                 of parent class.
            iii. It will not allow the parent class to override the method
                 of child class.
            iv.  Once a method is declared in parent class as virtual,
                 all the child classes methods will be virtual by default.

        pure virtual methods:
            i.   It is a method which is declared in parent class as virtual
                 and it does not have any definition.
            ii.  It is mandatory for the child class to override the pure
                 virtual method of parent class.
            iii. If the child class does not override the pure virtual method
                 of parent class, then it will throw an error.
            iv.  A class which contains at least one pure virtual method
                 is called as abstract class.
            v.   An abstract class cannot be instantiated.
            vi.  A pure virtual method is declared by assigning 0 to it.
            

*/

//___________________________ without virtual keyword ___________________________
class parent;

    int data;
    int id;

    function void display();
        $display("\t[parent]: data -> %0d, id -> %0d", data, id);
    endfunction 

endclass 

class child extends parent;

    function void display();
        $display("\t[child]: data -> %0d, id -> %0d", data, id);
    endfunction 

endclass

module without_virtual();

    parent p;
    child c;

    initial begin
        $display("\n\t________ without virtual keyword ____________");
        c = new();
        c.data = 3333;
        c.id = 10;

        p = c;
        p.display();  // we will get child display
    end

endmodule 

//________________________________________________________________________________________

//___________________________ with virtual keyword ___________________________
class parent1;

    int data;
    int id;

    virtual function void display();
        $display("\t[parent]: data -> %0d, id -> %0d", data, id);
    endfunction 

endclass 

class child1 extends parent1;

    function void display();
        $display("\t[child]: data -> %0d, id -> %0d", data, id);
    endfunction 

endclass

module with_virtual();

    parent1 p;
    child1 c;

    initial begin
        $display("\n\t________ with virtual keyword ____________");
        c = new();
        c.data = 3333;
        c.id = 10;

        p = c;
        p.display();  // we will get parent display
    end

endmodule 

//________________________________________________________________________________________

module top_virtual();
    without_virtual wv();  
    with_virtual wiv();
endmodule

/*

# 	________ without virtual keyword ____________
# 	[parent]: data -> 3333, id -> 10
# 
# 	________ with virtual keyword ____________
# 	[child]: data -> 3333, id -> 10



*/