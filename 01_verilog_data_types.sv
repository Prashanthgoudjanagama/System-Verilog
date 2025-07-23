
// File: 1_verilog_data_types.sv
// module name: verilog_data_types

module verilog_data_types();

//======= verilog datatypes ==========
    //----------> net datatypes
    wire w1, w2;
    tri t1;
    wand wa;
    wor wo;

    // assigning values to the wand
    assign wa = w1; 
    assign wa = w2; 

    // Assigning values to wor 
    assign wo = w1;
    assign wo = w2;

    //----------> reg datatypes
    reg var1;
    integer var2;
    time var3;
    real var4;

    // assigning values to the net datatypes
    assign #5 w1 = 1'b0;
    assign #5 w2 = 1'b1;
    assign #5 t1 = 1'b1;

    initial begin
        // displaying all the default values
        $display("\n-------- Default Values --------");
        $display("wire data_type w1 :", w1);
        $display("wire data_type w2 :", w2);
        $display("tri data_type t1 :", t1);
        $display("wand data_type wa :", wa);
        $display("wor data_type wo :", wo);

        $display("\n-------- Reg Data Types --------");
        $display("reg data_type var1 : %b", var1);
        $display("integer data_type var2 : %d", var2);
        $display("time data_type var3 : %t", var3);
        $display("real data_type var4 : %f", var4);

        #5;

        // assigning values to the reg datatypes
        var1 = 1'b1;
        var2 = 32'd100;
        var3 = $time; // maximum time value
        var4 = 3.14;

        // displaying the assigned values
        $display("\n-------- Assigned Values --------");
        $display("wire data_type w1 : %b", w1);
        $display("wire data_type w2 : %b", w2);
        $display("tri data_type t1 : %b", t1);
        $display("wand data_type wa : %b", wa);
        $display("wor data_type wo : %b", wo);
        $display("reg data_type var1 : %b", var1);
        $display("integer data_type var2 : %d", var2);
        $display("time data_type var3 : %t", var3);
        $display("real data_type var4 : %f", var4);

        // displaying the sizes of the datatypes
        $display("\n-------- Sizes of Data Types --------");
        $display("Size of wire w1 : %0d bits", $bits(w1));
        $display("Size of wire w2 : %0d bits", $bits(w2));
        $display("Size of tri t1 : %0d bits", $bits(t1));
        $display("Size of wand wa : %0d bits", $bits(wa));
        $display("Size of wor wo : %0d bits", $bits(wo));
        $display("Size of reg var1 : %0d bits", $bits(var1));
        $display("Size of integer var2 : %0d bits", $bits(var2));
        $display("Size of time var3 : %0d bits", $bits(var3));
        $display("Size of real var4 : %0d bits", $bits(var4));
    end
endmodule : verilog_data_types

// main conclusions:
// verilog datatypes are 4-state logic types, 1,0,z,x.


// conclusions:
/*
1. all net datatypes default to 'z' (high impedance) state.
2. all reg datatypes default to 'x' (unknown) state.
3. net datatypes can only be driven by continuous assignments (assign statements).
4. reg datatypes can be driven by procedural assignments (inside always blocks).
5. the size of each data type can be determined using the $bits system function.
6. the time data type is used to represent simulation time and can hold large values.
7. the real data type is used to represent floating-point numbers.
8. the integer data type is used to represent whole numbers and can hold a range of values. 
   it will follow 2's complement representation.
9. sizes:
    - net data types: 1 bit
    - reg data types: 
         -> reg: 1 bit
         -> integer: 32 bits
         -> time: 64 bits
         -> real: 64 bits (IEEE 754 double precision)

    
*/