// file name : 24_Super_keyword.sv
// module name : top_super


//_________________________________________________________________________________________________________________

// ---------------------- example-1 --------------------------
class parent1;

    int data;

    function void display();
        $display("\t\t[parent] :: Data: %0d", this.data);
    endfunction 

endclass 

class child1 extends parent1;

    int data;
    int id;

    function void display();
        $display("\t\t[child] :: Data: %0d, ID: %0d", this.data, this.id);
    endfunction

endclass

module example_1();

    parent1 p;
    child1 c;

    initial begin
        $display("\n__________________ both parent and child have separate memory ______________");
        
        p = new();
        p.data = 456;

        c = new();
        c.data = 123;
        c.id = 2;

        $display("\n\t_______ display using parent class _________");
        p.display(); // Calls parent display

        $display("\n\t_______ display using child class _________");
        c.display(); // Calls child display
    end

endmodule 

//____________________________________________________________________________________________________________

// ---------------------- example-2 --------------------------
class parent2;

    int data;
    int id;

    function void display();
        $display("\t\t[parent] :: Data: %0d, ID: %0d", this.data, this.id);
    endfunction 

endclass 

class child2 extends parent2;

    int data;

    function void display();
        $display("\t\t[child] :: Data: %0d, ID : %0d", this.data, id);
    endfunction

endclass

module example_2();

    parent2 ptr;
    child2 ctr;

    initial begin
        $display("\n__________________ parent and child have same memory ______________");

        ctr = new();
        ctr.data = 111;
        ctr.id = 2;

        ptr = ctr; // Assigning child object to parent reference
        ptr.data = 999;
        ptr.id = 4;

        $display("\n\t_______ display using parent class _________");
        ptr.display(); // Calls parent display

        $display("\n\t_______ display using child class _________");
        ctr.display(); // Calls child display
    end

endmodule 

//____________________________________________________________________________________________________________

// ---------------------- with_super keyword --------------------------
class parent3;

    int data;
    int id;

    function void display();
        $display("\t\t[parent] :: Data: %0h, ID: %0h", this.data, this.id);
    endfunction 

endclass 

class child3 extends parent3;

    int datac;

    function void display();
        super.display(); // calling the parent method
        $display("\t\t[child] :: Data: %0h, ID : %0h", this.data, id);
    endfunction

endclass

module w_super();

    child3 c3;

    initial begin
        $display("\n\t___________ using super keyword ____________");
        c3 = new();
        c3.data = 32'h1122_3344;
        c3.id = 32'haaaa_aaaa;
        c3.datac = 32'h9999_9999;
        c3.display();
    end

endmodule

//___________________________________________________________________________________________________________
module top_super();

    example_1 ex1();
    example_2 ex2();
    w_super ws();

endmodule

/*
#__________________ checking the point number -4 ___________________
# 
# 	[child] : name -> parent, land -> 4.050000, own_land -> 2.300000, total_land -> 6.350000
# 
# __________________ parent and child have same memory ______________
# 
# 	_______ display using parent class _________
# 		[parent] :: Data: 999, ID: 4
# 
# 	_______ display using child class _________
# 		[child] :: Data: 111, ID : 4

*/