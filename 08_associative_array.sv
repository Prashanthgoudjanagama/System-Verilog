// file name : 8_associative_array.sv
// module name : associative_array

/*
       --> associative arrays are stores entries in the form of sparse matrix.
       --> syntax: <data_type> <array_name> [<key_type>];
            => this key_type can be any data type, including string.
       --> do not have any storage until we are using the location.
       --> associative arrays can be sparse, meaning they can have "holes" where no data is stored.
       --> associative array methods:
            1. size() - to get the size of the associative array
            2. delete() - to delete the associative array entry.
            3. exists() - to check if the entry exists in the associative array
            4. num() - to get the number of entries in the associative array.
            5. first() - to get the first entry in the associative array
            6. last() - to get the last entry in the associative array
            7. next() - to get the next entry in the associative array
            8. prev() - to get the previous entry in the associative array
*/

/*
    interview questions:
        1. What is the difference between dynamic arrays and associative arrays?
        2. How do you declare an associative array?
        3. How do you access an entry in an associative array?
        4. How you can iterate over an associative array?
        5. What are the methods available for associative arrays?   
*/


module associative_array();

    bit [31:0] ass_arr[int]; // associative array declaration, key type is int.
    bit [31:0] ass_arr1[int]; // associative array declaration, key type is int.

    bit [31:0] ass_arr3[string]; // associative array declaration, key type is string.

    string ass_arr2[string]; // associative array declaration, key type is string.
    string string_index, index, key; // current index for iteration

    initial begin
        
        $display("\n=======associative with int key type===========");
        ass_arr[10] = 12;
        ass_arr[100] = 27;
        ass_arr[1000] = 61;
        ass_arr[10000] = 89;
        ass_arr[100000] = 7;

        ass_arr1 = '{10:12, 100:145, 1000:389, 10000:724, 100000:987};

        $display("\nassociative array : %0p",ass_arr);
        $display("associative array1 : %0p",ass_arr1);


        $display("\n=======associative with string key type===========");
        ass_arr3["banana"] = 50;
        ass_arr3["apple"] = 250;
        ass_arr3["mango"] = 60;
        ass_arr3["orange"] = 130;
        ass_arr3["kiwi"] = 500;

        // ass_arr3 = '{"banana":50, "apple":250, "mango":60, "orange":130, "kiwi":500};

        $display("\nassociative array with string key type : %0p",ass_arr3);


        $display("\n=======associative with string key type and string data_type===========");
        ass_arr2["banana"] = "yellow";
        ass_arr2["apple"] = "red";
        ass_arr2["mango"] = "green";
        ass_arr2["orange"] = "orange";
        ass_arr2["kiwi"] = "yellow";

        // ass_arr2 = '{"banana":"yellow", "apple":"red", "mango":"green", "orange":"orange", "kiwi":"yellow"};

        $display("\nassociative array with string key type and string data type : %0p",ass_arr2);


//-----------------------------------associative array methods---------------------------------------------
        $display("\n==============size()===================");
        $display("size of ass_arr : %0d", ass_arr.size());
        $display("size of ass_arr1 : %0d", ass_arr1.size());
        $display("size of ass_arr2 : %0d", ass_arr2.size());
        $display("size of ass_arr3 : %0d", ass_arr3.size());


        $display("\n==============num()===================");
        $display("num of ass_arr : %0d", ass_arr.num());
        $display("num of ass_arr1 : %0d", ass_arr1.num());
        $display("num of ass_arr2 : %0d", ass_arr2.num());
        $display("num of ass_arr3 : %0d", ass_arr3.num());


        $display("\n==============exists()===============");
        if(ass_arr2.exists("banana")) begin
            $display("ass_arr2 has key 'banana'");
        end else begin
            $display("ass_arr2 does not have key 'banana'");
        end


        $display("\n==============first(), last(), prev(), next()===================");
        $display("\nass_arr2 : %0p\n", ass_arr2);
        ass_arr2.first(string_index);
        $display("ass_arr2 first entry is : %0s", string_index);

        ass_arr2.next(string_index);
        $display("ass_arr2 next entry is : %0s", string_index);

        ass_arr2.last(string_index);
        $display("ass_arr2 last entry is : %0s", string_index);

        ass_arr2.prev(string_index);
        $display("ass_arr2 previous entry is : %0s\n", string_index);


        $display("===============iterating the associative array================");
        if(ass_arr2.first(index)) begin
            do begin
                $display("ass_arr2[%0s] = %0s", index, ass_arr2[index]);
            end
            while(ass_arr2.next(index));
        end
    end

endmodule : associative_array

