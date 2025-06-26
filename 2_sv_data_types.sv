
// File: 1_sv_data_types.sv
// module name: sv_data_types

module sv_data_types();

    // ======= sv datatypes ==========
    logic l1;       // 1bit wide
    bit b1;         // 1bit wide
    byte by1;       // 8bit wide
    shortint si1;   // 16bit wide
    int i1;         // 32bit wide
    longint li1;    // 64bit wide
    shortreal sr1;  // 64bit wide


    // assigning values to sv datatypes
    initial begin
        // displaying all the default values
        $display("\n-------- Default Values --------");
        $display("logic data_type l1 : %b", l1);
        $display("bit data_type b1 : %b", b1);
        $display("byte data_type by1 : %d", by1);
        $display("shortint data_type si1 : %d", si1);
        $display("int data_type i1 : %d", i1);
        $display("longint data_type li1 : %d", li1);
        $display("shortreal data_type sr1 : %f", sr1);

        // assigning values to the sv datatypes 
        l1 = 1'b1;
        b1 = 1'b0;
        by1 = 8'hFF; // 255 in hexadecimal
        si1 = -16'sd12345; // negative short integer
        i1 = 32'sd123456789; // positive integer
        li1 = 64'sd1234567890123456789; // long integer
        sr1 = 3.14159; // short real

        // displaying the assigned values
        $display("\n-------- Assigned Values --------");
        $display("logic data_type l1 : %b", l1);
        $display("bit data_type b1 : %b", b1);
        $display("byte data_type by1 : %b", by1);
        $display("shortint data_type si1 : %b", si1);
        $display("int data_type i1 : %b", i1);
        $display("longint data_type li1 : %b", li1);
        $display("shortreal data_type sr1 : %f", sr1);


        $display("\n-------- Maximum Values --------");
        $display("logic data_type max value : %d", $bits(l1));
        $display("bit data_type max value : %d", $bits(b1));
        $display("byte data_type max value : %d", $bits(by1));
        $display("shortint data_type max value : %d", $bits(si1));
        $display("int data_type max value : %d", $bits(i1));
        $display("longint data_type max value : %d", $bits(li1));
        $display("shortreal data_type max value : %d", $bits(sr1));
    end
endmodule : sv_data_types


// main conclusions:
/* 
   verilog datatypes are strict and confusing rules for the port selection,
   so to avoid this confusion, SystemVerilog introduced new datatypes like logic, bit, byte, shortint, int, longint, and shortreal.
   these all are two-state logic types, 0 and 1. except logic, which is a 4-state logic type, 0, 1, z, x.
 */