// file name : 7_dynamic_array.sv
// module name : dynamic_array

/*
        --> size can be set durring the run_time
        --> declared with the empty square brackets "[]", after the array name.
        --> can be resized using the "new" keyword.
        --> dynamic_array methods:
              1. new() - to create a new dynamic array
              2. size() - to get the size of the dynamic array
              3. delete() - to delete the dynamic array completetly.
        --> dynamic arrays are unpacked arrays, so they can be resized.

*/

module dynamic_array();

    // dynamic array declaration
    bit [31:0] d_arr[];
    bit [31:0] d_arr1[];


    initial begin
        $display("\n========= Dynamic Array ============\n");
        
        $display("dynamic array size before --> new() : %0d",d_arr.size());
        $display("dynamic array before initialize : %0p",d_arr);

        d_arr = new[5]; // creating a dynamic array of size 5
        $display("\ndynamic array size after --> new[5] : %0d",d_arr.size()); // 5

        d_arr = '{1,2,3,4,5}; //initialization 

        $display("\ndynamic array size after --> new[5] : %0d",d_arr.size());
        $display("dynamic array after initialize : %0p",d_arr);

        d_arr.delete();
        $display("\ndynamic array size after --> delete() : %0d",d_arr.size());
        $display("dynamic array after delete : %0p",d_arr);

        d_arr = new[3]('{10,20,30});
        $display("\ndynamic array size: %0d",d_arr.size());
        $display("dynamic array : %0p",d_arr);

        //resize
        d_arr = '{100,200,300,400,500};
        $display("\ndynamic array : %0d",d_arr.size());
        $display("dynamic array : %0p",d_arr);

        //without loosing old values
        d_arr = new[10](d_arr);
        $display("\ndynamic array : %0d",d_arr.size());
        $display("dynamic array : %0p",d_arr);

        d_arr[5:9] = '{500,600,700,800,900};
        $display("dynamic array : %0p",d_arr);

        // displaying the dynamic array elements using foreach loop
        $display("\nDisplaying dynamic array elements using foreach loop:");
        foreach(d_arr[i]) begin
            $display("d_arr[%0d] = %0d", i, d_arr[i]);
        end

    end



endmodule : dynamic_array
    