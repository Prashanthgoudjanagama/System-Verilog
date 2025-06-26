// file name : 10_array_manipulation_methods.sv
// module name : array_manipulation_methods


/*
    ---> array manipulation methods are 3 types:
            1. Array Locator Methods.
            2. Array Ordering Methods.
            3. Array Reduction Methods.

    
    --> Array Locator Methods:
        ==> we use "with" keyword to access the array locator methods.
            1. find() - return all elements that match the given value.
            2. find_first() - return the first element that matches the given value.
            3. find_last() - return the last element that matches the given value.
            4. find_index() - return the index of the element that matches the given value.
            5. find_first_index() - return the index of the first element that matches the given value.
            6. find_last_index() - return the index of the last element that matches the given value.
            4. min() - return the minimum value in the array.
            5. max() - return the maximum value in the array.
            6. unique() - return the unique elements in the array.

    --> Array Ordering Methods:
            1. sort() - sort the array in ascending order.
            2. rsort() - sort the array in descending order.
            3. shuffle() - shuffle the elements in the array randomly.
            4. reverse() - reverse the order of elements in the array.

    --> Array Reduction Methods:
            1. and() - perform bitwise AND operation on all elements.
            2. or() - perform bitwise OR operation on all elements.
            3. xor() - perform bitwise XOR operation on all elements.
            4. sum() - return the sum of all elements in the array.
            5. product() - return the product of all elements in the array.
*/

/*
        interview questions:
                1. What are array locator methods in SystemVerilog?
                2. In array, find all elemets that are greater than 5 and less than 8.
                3. In array. find all elements that are greater than 7.
                4. In array, find all even and odd elements.
                5. How do you find the index of an element in an array?
                6. In array, find the index of elements that matches the given value?
                7. How do you find the first and last element in an array that matches the given value?
                8. How do you find the first and last index of an element in an array that matches the given value?
                9. How do you find the minimum and maximum value in an array?
                10. How do you find the unique elements in an array?
                11. How do you sort an array in ascending and descending order?
                12. How do you shuffle the elements in an array randomly?
                13. How do you reverse the order of elements in an array?
                14. How do you perform bitwise AND, OR, XOR operations on all elements in an array?
                15. How do you find the sum and product of all elements in an array?

*/

module array_manipulation_methods();

        int array[] = '{6,12,34,7,8,9,2,5,45,99,13,1,8,3,12,34,99};
        longint string_array[] = {"apple", "banana", "cherry", "date", "berry"};
        int red_array[$] = '{1,2,3,4,5,6,7,8,9,10};

        int f_queue[$]; // queue to store the found elements
        
        initial begin
                $display("\n===== Array Locator Methods =====\n");

//---------------------------------------Array Locator Methods-----------------------------------------------------

                $display("\n------- find() -------\n");
                
                // in array, find all elements that is greater than 7
                f_queue = array.find(item) with (item > 7); 
                $display("Elements greater than 7: %p", f_queue);

                // in array, find all elements that greater than 5 and less than 8
                f_queue = array.find(item) with (item > 5 && item < 8);
                $display("Elements greater than 5 and less than 8: %p", f_queue);

                // in array, find all even elements
                f_queue = array.find(item) with (item % 2 == 0);
                $display("Even elements: %p", f_queue);

                // in array, find all odd elements
                f_queue = array.find(item) with (item % 2 != 0);
                $display("Odd elements: %p", f_queue);

//-----------------------------------------find_index()----------------------------------------------------

                $display("\n------- find_index() -------\n");

                // find index of elements that are that match the given value
                $display("array: %p\n", array);
                f_queue = array.find_index(item) with (item < 7);
                $display("Indices of elements less than 7: %p", f_queue);

                // find index that matches the given string value
                foreach(string_array[i]) begin
                   $display("string_array[%0d] = %s", i, string_array[i]);
                end
                f_queue = string_array.find_index(x) with (x == "date");
                $display("\nIndex of 'date' in string_array: %p", f_queue);

//------------------------------------------find_first()---------------------------------------------------

                $display("\n------- find_first() -------\n");

                // find first element that matches the given value
                $display("array: %p\n", array);
                f_queue = array.find_first(item) with (item > 5);
                $display("First element greater than 5: %p", f_queue);

//--------------------------------------------find_last()-------------------------------------------------

                $display("\n------- find_last() -------\n");   

                // find last element that matches the given value
                $display("array: %p\n", array);
                f_queue = array.find_last(item) with (item > 5);  
                $display("Last element greater than 5: %p", f_queue);       

//-----------------------------------------find_first_index()----------------------------------------------------

                $display("\n------- find_first_index() -------\n");

                // find first index of element that matches the given value
                $display("array: %p\n", array);
                f_queue = array.find_first_index(item) with (item > 5);
                $display("First index of element greater than 5: %p", f_queue);

//--------------------------------------------find_last_index()-------------------------------------------------

                $display("\n------- find_last_index() -------\n");

                // find last index of element that matches the given value
                $display("array: %p\n", array);
                f_queue = array.find_last_index(item) with (item > 5);
                $display("Last index of element greater than 5: %p", f_queue);

//--------------------------------------------min()-------------------------------------------------

                $display("\n------- min() -------\n");

                // find minimum value in the array
                $display("array: %p\n", array);
                //$display("Minimum value in the array: %0p", array.min());
                f_queue = array.min();
                $display("Minimum value in the array: %0p", f_queue);

//--------------------------------------------max()-------------------------------------------------

                $display("\n------- max() -------\n");

                // find maximum value in the array
                $display("array: %p\n", array);
                //$display("Maximum value in the array: %0p", array.max());
                f_queue = array.max();
                $display("Maximum value in the array: %0p", f_queue);

//--------------------------------------------unique()-------------------------------------------------

                $display("\n------- unique() -------\n");

                // find unique elements in the array
                $display("array: %p\n", array);
                //$display("Unique elements in the array: %p", array.unique());
                f_queue = array.unique();
                $display("Unique elements in the array: %p", f_queue);

//--------------------------------------------sort(),rsort(),shuffle(),reverse()-------------------------------------------------

                $display("\n===== Array Ordering Methods =====\n");

                $display("\n------- sort() -------\n");
                // sort the array in ascending order
                $display("array: %p\n", array);
                array.sort();
                $display("Sorted array in ascending order: %p", array);


                $display("\n------- rsort() -------\n");
                // rsort to descending order
                $display("array: %p\n", array);
                array.rsort();
                $display("rSorted array in descending order: %p", array);

                $display("\n------- shuffle() -------\n");
                // shuffle the array randomly
                $display("array: %p\n", array);
                array.shuffle();        
                $display("Shuffled array: %p", array);

                $display("\n------- reverse() -------\n");
                // reverse the order of elements in the array   
                $display("array: %p\n", array);
                array.reverse();
                $display("Reversed array: %p", array);

//--------------------------------------------and(),or(),xor(),sum(),product()-------------------------------------------------

                $display("\n===== Array Reduction Methods =====\n");

                $display("red_array: %p\n", red_array);
                $display("sum of all elements in the red_array: %0d", red_array.sum());
                $display("product of all elements in the red_array: %0d", red_array.product());
                $display("bitwise AND of all elements in the red_array: %0d", red_array.and());
                $display("bitwise OR of all elements in the red_array: %0d", red_array.or());
                $display("bitwise XOR of all elements in the red_array: %0d", red_array.xor());
                
        end

endmodule : array_manipulation_methods