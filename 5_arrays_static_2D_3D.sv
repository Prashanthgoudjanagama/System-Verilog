
// file: 5_arrays_static_2D_3D.sv
// module name: arrays_static_2D_3D

module arrays_static_2D_3D();

    // static array representation
    bit [7:0] s_array [10]; // size is fixed throughout the simulation, once declared it can't change

    // 2D-array representation
    bit [31:0] array_2d [3][3]; // 3 rows and 3 columns, each element is 32 bits wide

    // 3D-array representation
    bit [31:0] array_3d [2][3][3]; // 2 copies, 3 rows, and 3 columns, each element is 32 bits wide

    initial begin
        // Initializing the static array
        $display("\n============Static Array===============");
        s_array = '{11,12,13,14,15,16,17,18,19,20}; // Initialize all elements
        $display("s_array ---> %0p\n", s_array);

        foreach(s_array[i]) begin
            $display("s_array[%0d] = %0d", i, s_array[i]);
        end


        // Initializing the 2D-array
        $display("\n============2D Array===============");
        array_2d = '{'{1,2,3}, '{4,5,6}, '{7,8,9}}; // Initialize all elements
        $display("array_2d ---> %0p\n", array_2d);

        foreach(array_2d[i,j]) begin
            $display("array_2d[%0d][%0d] = %0d", i, j, array_2d[i][j]);
        end

        // matrix printing same 2d array
        $display("\n============2D Array Matrix Printing===============");
        for(int i=0; i<3; i++) begin
            for(int j=0; j<3; j++) begin
                $write("%0d\t",array_2d[i][j]);
            end
            $display(""); // new line after each row
        end

        // Initializing the 3D-array
        $display("\n============3D array prnting===============");
        array_3d = '{
                '{'{1,2,3},'{4,5,6},'{7,8,9}},  // 1st copy or layer
                '{'{90,91,92},'{93,94,95},'{96,97,98}}   // 2nd copy or layer
        };

        $display("array_3d : %0p\n", array_3d);

        foreach(array_3d[i,j,k]) begin
            $display("array_3d[%0d][%0d][%0d] = %0d", i, j, k, array_3d[i][j][k]);
        end
    end 
endmodule : arrays_static_2D_3D