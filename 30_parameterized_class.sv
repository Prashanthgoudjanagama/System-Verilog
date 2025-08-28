

// file name: 30_parameterized_class.sv
// module name : top_param


/*

_________________________________________________________________________________________

Parameterized Class:
    1. A parameterized class is a class that can accept parameters 
       (also known as type parameters) when it is instantiated.

    2. This allows for more flexible and reusable code, as the same 
       class can be used with different data types or configurations.

    3. In SystemVerilog, parameterized classes are defined using the `class` 
       keyword followed by the class name and the parameter list in angle brackets.

_________________________________________________________________________________________

*/


class transaction #(parameter WIDTH = 2, type D_TYPE = bit [2:0]);
  bit [WIDTH-1:0] data;
  D_TYPE id;
  
  function void display();
    $display("data = %0d, id = %0d", data, id);
  endfunction
endclass : transaction

module test1();
  transaction tr1;
  transaction #(32,int) tr2;
  
  initial 
    begin
        $display("\n\t________ Parameterized Class ____________");
        tr1 = new();
        tr2 = new();
        
        tr1.data = 5;
        tr1.id = 15;
        tr1.display();
        
        tr2.data = 70000;
        tr2.id = 15000;
        tr2.display();
    end
endmodule : test1


//______________top______________

module top_param;

    test1 t1();

endmodule : top_param
