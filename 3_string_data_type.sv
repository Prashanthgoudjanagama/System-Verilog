
// File: 3_string_data_type.sv
// module name: string_data_type

module string_data_type();

    // ======= string data type ==========
    string str1; // string data type
    string str2 = "Hello, SystemVerilog!"; // initialized string
    string str3 = "PRASHANTH"; // another initialized string

    string str = "Hello World!"; // string for basic methods
    string tmp; // temporary string for operations


    int ati; // integer for string conversion methods
    int athex; // hexadecimal for string conversion methods
    int atoct; // octal for string conversion methods
    int atbin; // binary for string conversion methods
    real atreal; // real for string conversion methods
    

    initial begin
        // displaying the default value of the string
        $display("\n-------- Default String Value --------");
        $display("string data_type str1 : '%s'", str1);

        // displaying the initialized string
        $display("\n-------- Initialized String Value --------");
        $display("string data_type str2 : '%s'", str2);
        $display("string data_type str3 : '%s'", str3);
        $display("string data_type str : '%s'", str);

        // assigning a new value to the string
        str1 = "Welcome to SystemVerilog!";
        $display("\n-------- Assigned String Value --------");
        $display("string data_type str1 : '%s'", str1);

        // ----------basic string methods----------
        $display("\n-------- Basic String Methods --------");

        $display("string data_type str = '%s'", str);
        $display("\n------len() method------");
        // Print length of string "str"
        $display ("str.len() = %0d", str.len());

        // Assign to tmp variable and put char "d" at index 3
        $display("\n------putc() method------");
        tmp = str;
        tmp.putc (3,"d");
        $display ("str.putc(3, d) = %s", tmp);

        // Get the character at index 2
        $display("\n------getc() method------");
        $display ("str.getc(0) = %s (%0d)", str.getc(0), str.getc(0));

        $display("\n------toupper() method------");
        // Convert all characters to upper case
        $display("str.toupper() = %s", str.toupper());

        $display("\n------tolower() method------");
        // Convert all characters to lower case
        $display ("str.tolower() = %s", str.tolower());

        // Comparison
        $display("\n------compare() method------");
        // Compare two strings
        tmp = "Hello World!";
        $display("tmp = %s", tmp);
        $display("str = %s", str);
        $display ("[tmp,str are same] str.compare(tmp) = %0d", str.compare(tmp));
        tmp = "How are you ?";
        $display("tmp = %s", tmp);
        $display ("[tmp,str are diff] str.compare(tmp) = %0d", str.compare(tmp));

        // Ignore case comparison
        tmp = "hello world!";
        $display ("\n[tmp is in lowercase] str.compare(tmp) = %0d", str.compare(tmp));
        tmp = "Hello World!";
        $display ("[tmp,str are same] str.compare(tmp) = %0d", str.compare(tmp));

        // Extract new string from i to j
        $display("\n-----substr(i,j) method------");
        // Extract substring from index 4 to 8
        $display ("str.substr(4,8) = %s", str.substr (4,8));

    end
endmodule : string_data_type


//conclusions:
/*
    basic string methods in SystemVerilog include:
        - len(): Returns the length of the string.  
        - putc(index, char): Replaces the character at the specified index with the given character.
        - getc(index): Returns the character at the specified index.
        - toupper(): Converts all characters in the string to uppercase.
        - tolower(): Converts all characters in the string to lowercase.
        - compare(other): Compares the string with another string.
        - substr(i, j): Extracts a substring from the string starting at index i and ending at index j.
    
    string convertion methods in SystemVerilog include:
        - str.atoi(): Converts a string to an integer.
        - str.atohex(): Converts a string to a hexadecimal value.
        - str.atooct(): Converts a string to an octal value.
        - str.atobin(): Converts a string to a binary value.
        - str.atoreal(): Converts a string to a real number.
      note : vice-versa also possible.

*/
