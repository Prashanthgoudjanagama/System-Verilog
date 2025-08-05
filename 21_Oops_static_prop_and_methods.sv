

// file name: 21_Oops_static_prop_and_methods.sv

/*
    Static Properties:
        --> static properties are declared inside the class using static keyword.
        --> It will share single memory location for all class instance.

    Static Methods:
        --> Use only static members.
        --> Illegal to use the non-static members.

    Different Static Methods:

        1. Normal Function: _______________________________________________

                function name();

                        ---> Use both static and non-static members.

                endfunction : name

        2. Static Function: _______________________________________________

                static function name();

                             __________use only static members.
                            |
                        ----+
                            |__________illegal to use non-static members.

                endfunction : name

        3. Function Static: _______________________________________________

                function static name();

                             __________use static and non-static members.
                            |
                        ----+
                            |__________variables declared inside the 
                                       function-static will be static.

                endfunction : name
    
    Scope Resolution Operator:

*/


class static_prop_and_methods;

    int data, data1;
    static int s_data, s_data1;

    int count;

    function normal(int d1, s2);
        this.data = d1 * 5;  
        this.s_data = s2 * 100;
    endfunction : normal

    static function st_fun(int d2, s2);
        //data1 = d2 * 9; // illegal to access non-static property 'data1' from a static method.
        s_data1 = s2 *11;
    endfunction : st_fun

    static int s3;
    int a3;

    function static fun_st();
        int d3; // local variable, it will be static.
        d3++;
        s3++;
        a3++; // non-static variable, it will be instance specific. always this value is 1.
              // every time it take new memory for every object creation.
    endfunction : fun_st

/*
    summary of function static:
        --> It can access both static and non-static members.
        --> Variables declared inside the function-static will be static.
*/


endclass : static_prop_and_methods


class practice;

    int d, d1, d2;
    static int s, s1, s2;

    function f1();
        d++;
        s++;
        $display("\n\t inside normal functon --> d : %0d, s : %0d", d, s);
    endfunction : f1

    static function f2();
        //d1++;
        s1++;
        $display("\n\t inside static function --> d1 : s1 : %0d", s1);
    endfunction : f2

    function static f3();
        int status; // local variable, it will be static.
        d2++;
        s2++;
        status++;
        $display("\n\t inside function static --> d : %0d, status : %0d, d1 : %0d", d2, s2, status);
    endfunction : f3

endclass : practice

//--------------------- SCOPE RESOLUTION OPERATOR ---------------------

class static_methods_without_object_creation;

    static int cnt = 0;

    static function void incr();
        cnt++;
    endfunction : incr

endclass : static_methods_without_object_creation


module top_fun();

    static_prop_and_methods tr, tr1, tr2[5];
    practice p[3];
    static_methods_without_object_creation s_tr;

    initial begin
        $display("\n______________________ normal function _________________________");
        tr = new();
        tr.normal(10,5);  // (50, 500)
        $display("\n\t --> data : %0d, s_data : %0d", tr.data, tr.s_data);

        $display("\n______________________ static function _________________________");
        tr1 = new();
        tr1.st_fun(5,7);  // (5,77)
        $display("\n\t --> data : %0d, s_data1 : %0d", tr1.data, tr1.s_data1);

        $display("\n______________________ function static _________________________");
        foreach(tr2[i]) begin
            tr2[i] = new();
            tr2[i].fun_st();
            $display("\t --> d3 : %0d, s3 : %0d, a3 : %0d", tr2[i].fun_st.d3, tr2[i].s3, tr2[i].a3);
        end

        $display("\n______________________ practice _________________________");
        foreach(p[i]) begin
            p[i] = new();
            p[i].f1(); // normal function
            p[i].f2(); // static function
            p[i].f3(); // function static
        end

        $display("\n---------------------- static_methods_without_object_creation -------------------------");
        $display("\n\t______________________ SCOPE RESOLUTION OPERATOR & class handle _________________________");
        static_methods_without_object_creation::incr();     // accessing the static method
        s_tr.incr();    // accessing the method without creating the object.
        $display("\tcall using handle --> cnt : %0d", s_tr.cnt);
        $display("\tcall using object with SRO --> cnt : %0d", static_methods_without_object_creation::cnt);
    end

endmodule : top_fun




