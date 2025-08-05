
// file name: 22_Oops_Shallow_and_Deep_copies.sv
// module : top_copies


// _________________________________ SHALLOW COPY _________________________________

/*
    Shallow copy:
        --> Class properties are copied.
        --> Class Objects are not copied, only instance handles are copied.
        --> If the original object is modified, the changes will be reflected in the copied object vise versa.
        --> This is because both objects share the same instance of the class object.

_______________________________________________________________________________________________________________

    airbase ab1;                                                             airbase ab2;
    ab1 = new();                                                            ab2 = new ab1;
        |                                                                        |
        |                                                                        |
        |                                                                        |
        |            +-------------------------------------------+               |
        +----------->| airbase_name      = "WAC_DELHI";          |               |
        |            | total_aircraft_no = 34;                   |               |
        |            +-------------------------------------------+               |
        |
        |            +-------------------------------------------+               |
        |            | airbase_name      = "SAC_THIRCHI";        |               |
        |            | total_aircraft_no = 15;                   |<--------------+
        |            +-------------------------------------------+               |
        |                                                                        |  
        |                                                                        |
        |            +-------------------------------------------+               |
        |            | air_craft.ar                              |               |
        +----------->| ar.aircraft_name  = "RAFALE";             |<--------------+
                     | ar.flight_number  = 4597;                 |
                     +-------------------------------------------+

_______________________________________________________________________________________________________________



*/

class air_craft;

    string aircraft_name;
    int flight_number;

    function new(string name, int num);
        this.aircraft_name = name;
        this.flight_number = num;
    endfunction : new

endclass : air_craft


class air_base;

    string airbase_name;
    int total_aircraft_no;
    air_craft ar;       // air_craft object

    function new();
        this.airbase_name = "WAC_DELHI";
        this.total_aircraft_no = 34;
        this.ar = new("Tejas", 1327);
    endfunction : new

    function void display();
        $display("\t[air_base]  :: airbase_name -> %0s, Total_NO_of_aircrafts -> %0d", airbase_name, total_aircraft_no);
        $display("\t[air_craft] :: aircraft_name -> %0s, flight_num -> %0d", ar.aircraft_name, ar.flight_number);
    endfunction : display

endclass : air_base


module shallow_copy();

    air_base ab1, ab2;

    initial begin
        $display("\n____________________________ SHALLOW_COPY ____________________________");
        ab1 = new();
        $display("\n-------- display using ab1 ------\n");
        ab1.display();

        ab2 = new ab1;   // shallow copy
        $display("\n-------- display using ab2 [after shallow copy ab1 --> ab2]------\n");
        ab2.display();

        ab1.airbase_name = "SAC_THIRCHI";
        ab1.total_aircraft_no = 15;
        ab1.ar.aircraft_name = "RAFALE";
        ab1.ar.flight_number = 4597;

        $display("\n-------- after changing values ------\n");

        $display("\n\t-------- display using ab1 ------\n");
        ab1.display();

        $display("\n\t-------- display using ab2 ------\n");
        ab2.display();

    end

endmodule : shallow_copy

// _________________________________ DEEP COPY _________________________________

/*
    Deep copy:
        --> Same as shallow copy.
        --> But, the class objects are also copied.
        --> We impliment the deep_copy() method in the class.

_______________________________________________________________________________________________________________

                                                                             airbase ab2; 
    airbase ab1;                                                             ab2 = new();
    ab1 = new();                                                            ab1.deep_copy(ab2);
        |                                                                        |
        |                                                                        |
        |                                                                        |
        |            +-------------------------------------------+               |
        +----------->| airbase_name      = "WAC_DELHI";          |               |
        |            | total_aircraft_no = 34;                   |               |
        |            +-------------------------------------------+               |
        |
        |            +-------------------------------------------+               |
        |            | airbase_name      = "SAC_THIRCHI";        |               |
        |            | total_aircraft_no = 15;                   |<--------------+
        |            +-------------------------------------------+               |
        |                                                                        |  
        |                                                                        |
        |            +-------------------------------------------+               |
        |            | air_craft.ar                              |               |
        +----------->| ar.aircraft_name  = "RAFALE";             |               |
                     | ar.flight_number  = 4597;                 |               |
                     +-------------------------------------------+               |
                                                                                 |
                                                                                 |
                     +-------------------------------------------+               |
                     | air_craft.ar                              |               |
                     | ar.aircraft_name  = "Tejas";              |<--------------+
                     | ar.flight_number  = 1327;                 |
                     +-------------------------------------------+

_______________________________________________________________________________________________________________


*/


class aircraft;

    string aircraft_name1;
    int flight_number1;

    function new(string name, int num);
        this.aircraft_name1 = name;
        this.flight_number1 = num;
    endfunction : new

endclass : aircraft


class airbase;

    string airbase_name1;
    int total_aircraft_no1;
    aircraft ar1;       // aircraft object

    function new();
        this.airbase_name1 = "WAC_DELHI";
        this.total_aircraft_no1 = 34;
        this.ar1 = new("Tejas", 1327);
    endfunction : new

    function void display();
        $display("\t[air_base]  :: airbase_name -> %0s, Total_NO_of_aircrafts -> %0d", airbase_name1, total_aircraft_no1);
        $display("\t[air_craft] :: aircraft_name -> %0s, flight_num -> %0d", ar1.aircraft_name1, ar1.flight_number1);
    endfunction : display

    function deep_copy(airbase tr);
        this.airbase_name1 = tr.airbase_name1;
        this.total_aircraft_no1 = tr.total_aircraft_no1;
        this.ar1 = new(tr.ar1.aircraft_name1, tr.ar1.flight_number1); // deep copy of aircraft object
    endfunction : deep_copy

endclass : airbase


module deepcopy();

    airbase a1, a2;

    initial begin
        $display("\n____________________________ DEEP_COPY ____________________________");
        a1 = new();
        $display("\n-------- display using a1 ------\n");
        a1.display();

        a2 = new(); // create a new instance for deep copy
        a1.deep_copy(a2); // deep copy
        // Alternatively, you can also use:
        // a2 = new a1;   // deep copy
        $display("\n-------- display using a2 [after deep copy a1 --> a2]------\n");
        a2.display();

        a1.airbase_name1 = "SAC_THIRCHI";
        a1.total_aircraft_no1 = 15;
        a1.ar1.aircraft_name1 = "RAFALE";
        a1.ar1.flight_number1 = 4597;

        $display("\n-------- after changing values ------\n");

        $display("\n\t-------- display using a1 ------\n");
        a1.display();

        $display("\n\t-------- display using a2 ------\n");
        a2.display();

    end

endmodule : deepcopy


module top_copies();

    shallow_copy sc();
    deepcopy dc();

endmodule : top_copies