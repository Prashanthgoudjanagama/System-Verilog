

// file name: 31_typedef_class.sv
// module name : top_typedef


/*
____________________________________________________________________

Typedef Class:
    -> In some cases we need to use an un-defined class in the current class.

    -> In this case system verilog provides the forward declaration of the using
       `typedef` keyword.

    -> This allows the use of the undefined class within the current class.

____________________________________________________________________

*/
//_______________with typedef keyword_________________________
typedef class transaction_B;

class transaction_A;
  bit [31:0] data;
  int id;
  transaction_B tr_B = new();
      
  function void display();
    $display("transaction_A: data = %0d and id = %0d", data, id);
    $display("transaction_B: addr = %0d", tr_B.addr);
  endfunction
endclass : transaction_A

class transaction_B;
  bit [31:0] addr = 200;
endclass

module test1();
  transaction_A tr_A;
  
  initial begin
    $display("\n\t------------- with typedef ---------------------");
    tr_A = new();
   
    tr_A.data = 100;
    tr_A.id = 1;
    tr_A.display();
  end
endmodule : test1

//________________without typedef keyword___________________________
class trans_A;
  bit [31:0] data;
  int id;
  trans_B tr_B = new();
      
  function void display();
    $display("transaction_A: data = %0d and id = %0d", data, id);
    $display("transaction_B: addr = %0d", tr_B.addr);
  endfunction
endclass : trans_A

class trans_B;
  bit [31:0] addr = 200;
endclass : trans_B

module test2;
  trans_A tr_A;

  initial begin
    $display("\n\t------------- without typedef ---------------------");
    tr_A = new();
   
    tr_A.data = 100;
    tr_A.id = 1;
    tr_A.display();
  end
endmodule : test2


module top_typedef();

    test1 t1();
    test2 t2();

endmodule : top_typedef


/*
simulation results:
__________________________________________________________________________

        #------------- with typedef ---------------------
        # transaction_A: data = 100 and id = 1
        # transaction_B: addr = 200
        # 
        # 	------------- without typedef ---------------------
        # ** Error: 31_typedef_class.sv(56): Invalid type 'trans_B'. Please check the type of the variable 'tr_B'.
        # ** Error: (vlog-13069) 31_typedef_class.sv(56): near "=": syntax error, unexpected '=', expecting function or task or "SystemVerilog keyword 'pure'".
__________________________________________________________________________

*/