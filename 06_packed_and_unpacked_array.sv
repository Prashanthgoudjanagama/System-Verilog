// file: 6_packed_and_unpacked_array.sv
// module name: packed_and_unpacked_array

module packed_and_unpacked_array();
    // packed array

    bit [7:0] p_arr; // packed array of 8 bits
    bit [3:0][7:0] p_arr1; // represented in contegeous manner, 4 lacations of 8 bits each.
                           // size represented before the array name.

    // unpacked array
    bit [7:0] u_arr [4]; // unpacked array of 4 locations, each 8 bits wide.
                         // size represented after the array name.

    initial begin
//----------------------------packed array----------------------------
        $display("\n============Packed Array===============");
        p_arr = 8'b10101010; // assigning value to packed array
        p_arr1 = '{8'b00001111, 8'b11110000, 8'b10101010, 8'b01010101}; // assigning values to packed array

        foreach(p_arr1[i]) begin
            $display("p_arr1[%0d] = %0d", i, p_arr1[i]);
        end

        // displaying packed array
        $display("\np_arr = %0p", p_arr);
        $display("\np_arr1 = %0p", p_arr1);


//----------------------------unpacked array----------------------------
        $display("\n============Unpacked Array===============");
        u_arr = '{8'b00001111, 8'b11110000, 8'b10101010, 8'b01010101}; // assigning values to unpacked array
        foreach(u_arr[i]) begin
            $display("u_arr[%0d] = %0d", i, u_arr[i]);
        end
        // displaying unpacked array
        $display("u_arr = %0p", u_arr);
    end

endmodule : packed_and_unpacked_array
