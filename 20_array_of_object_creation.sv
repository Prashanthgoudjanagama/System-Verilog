
// file name: 20_array_of_object_creation.sv
// module name: top_objects

class object_array;

    int id;
    string name;

    // Constructor to initialize the object
    function new(int id, string name);
        this.id = id;
        this.name = name;
    endfunction : new

    // Method to display object details
    function void display();
        $display("\t\tObject ID: %0d, Name: %s", id, name);
    endfunction : display

endclass : object_array


module fixed_array();

    object_array a1[5];

    initial begin
        $display("\n---------- fixed array of object -----------");
        foreach(a1[i]) begin
            a1[i] = new(i, "fixed");
            a1[i].display();
        end
    end

endmodule : fixed_array


module dynamic_array();

    object_array a2[];

    initial begin
        $display("\n---------- dynamic array of object -----------");
        a2 = new[10];
        foreach(a2[i]) begin
            a2[i] = new(i, "Dynamic");
            a2[i].display();
        end
    end

endmodule : dynamic_array


typedef enum {apple, mango, banana} fruit_t;

class fruit;

    int rate;

    // defualt Constructor
    function new(int rate); // it will return value, so it can't be void type. 
        this.rate = rate;   // this refers to current class scope
    endfunction : new

endclass : fruit

module associative_array();

    fruit ass_a[fruit_t];

    initial begin
        $display("\n---------- Associative array of object -----------");
        ass_a[mango] = new(120);
        ass_a[banana] = new(75);
        ass_a[apple] = new(200);

        foreach(ass_a[i]) begin
            $display("\t\tass_a[%0s]:  rate --> %0d", i.name(), ass_a[i].rate);
        end
    end

endmodule : associative_array

// ======================== Array of Object Creation ==================================
module top_objects;

    fixed_array fa();
    dynamic_array da();
    associative_array aa();

endmodule: top_objects

/*
# ---------- fixed array of object -----------
# 		Object ID: 0, Name: fixed
# 		Object ID: 1, Name: fixed
# 		Object ID: 2, Name: fixed
# 		Object ID: 3, Name: fixed
# 		Object ID: 4, Name: fixed
# 
# ---------- dynamic array of object -----------
# 		Object ID: 0, Name: Dynamic
# 		Object ID: 1, Name: Dynamic
# 		Object ID: 2, Name: Dynamic
# 		Object ID: 3, Name: Dynamic
# 		Object ID: 4, Name: Dynamic
# 		Object ID: 5, Name: Dynamic
# 		Object ID: 6, Name: Dynamic
# 		Object ID: 7, Name: Dynamic
# 		Object ID: 8, Name: Dynamic
# 		Object ID: 9, Name: Dynamic
# 
# ---------- Associative array of object -----------
# 		ass_a[apple]:  rate --> 200
# 		ass_a[mango]:  rate --> 120
# 		ass_a[banana]:  rate --> 75


*/