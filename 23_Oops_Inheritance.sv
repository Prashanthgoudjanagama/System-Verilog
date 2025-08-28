
// file name : 23_Oops_Inheritance.sv
// module name : top_inheritance


/*

        Inheritance : 
        ______________________________________________________________________________________________________

            1. Inheritance allow us to create a derived class from existing class.

            2. derived class - child class.
               existing class - parent class.

            3. we use "extends" keyword to create a sub-classes.
                    syntax:
                        class parent;
                            .
                            .
                        endclass : parent

                        class child extends parent;
                            .
                            .
                        endclass : child

            4. This extended/child class will have access to the parent class
               Properies and methods. Also it have own properties and methods.

            5. SUPER keyword:
                    i.   It will used in Child class.
                    ii.  It will refer only it's immediate base class.
                            syntax: super.new(name, parent);
                    iii. super.super is not possible.

            6. VIRTUAL keyword:
                    i.   It will used in Parent class.
                    ii.  It will allow the child class to override the method
                         of parent class.
                    iii. It will not allow the parent class to override the method
                         of child class.
                    iv.  Once a method is declared in parent class as virtual,
                         all the child classes methods will be virtual by default.
        ______________________________________________________________________________________________________


*/


// _________________________________________________________________________________________________

class parent;

    string name;
    real land;

    function new(string name, real land);
        this.name = name;
        this.land = land;
    endfunction : new

    function void display();
        $display("[parent] : name -> %0s, land -> %0f", name, land);
    endfunction : display

endclass : parent


class child extends parent;

    real own_land;


    function new(real land_1);
        super.new("parent", 4.05);  // calling parent constructor/method
        this.own_land = land_1;
    endfunction : new

   function void display();
       $display("\t[child] : name -> %0s, land -> %0f, own_land -> %0f, total_land -> %0f", name, land, own_land, land + own_land);
   endfunction : display

endclass : child


module example1();

    child c1;

    initial begin
       
        $display("\n\t__________________ checking the point number -4 ___________________\n");
        c1 = new(2.30);
        c1.display();
    end

endmodule : example1

// _________________________________________________________________________________________________


class parent_1;

    real land_1;
    string place;

    function void display();
        $display("\n\t\t[parent] : land_1 -> %0f, place -> %0s", land_1, place);
    endfunction : display

endclass : parent_1

class child_1 extends parent_1;

    real own_land_1;
    string place;

    function void display();
        $display("\n\t\t[child] : own_land_1 -> %0f, place -> %0s", own_land_1, place);
    endfunction : display

endclass : child_1


class parent_2;

    real land_2;

    function void display();
        $display("\n\t\t[parent] : land_2 -> %0f", land_2);
    endfunction : display

endclass : parent_2

class child_2 extends parent_2;

    real own_land_2;

    function void display();
        super.display(); // calling parent display method
        $display("\n\t\t[child] : own_land_2 -> %0f", own_land_2);
    endfunction : display

endclass : child_2

module example_2();
    parent_1 ptr;
    child_1 ctr;

    child_2 ctr2;

    initial begin 
        $display("\n\t__________________ parent and child have separate memories ___________________\n");
        $display("\t----> display using parent handle");
        ptr = new();
        ptr.land_1 = 5.10;
        ptr.display();

        $display("\n\t----> display using child handle without super");
        ctr = new();
        ctr.own_land_1 = 1.0;
        ctr.land_1 = 3.30;
        ctr.display();

        $display("\n\t__________________ super keyword ___________________\n");
        ctr2 = new();
        ctr2.own_land_2 = 1.05;
        ctr2.land_2 = 4.20;
        ctr2.display(); // it will call parent display method first and then child display method

    end
endmodule : example_2


// _________________________________________________________________________________________________

module top_inheritance();

    example1 e1();
    example_2 e2();

   
endmodule : top_inheritance