// file name: 9_queue_array.sv
// module name: queue_array

/*
    --> Queue is a collection of homogeneous elements.
    --> Queue is represeted with $, after the array name.
    --> Queue can be grow and shrink dynamically.
    --> In Queue we can add and remove elements from both ends.
    --> syntax: <data_type> <array_name> [$];
    --> Queue supported methods:
            1. size() - returns the number of elements in the queue.
            2. delete() - removes the element from the queue.
            3. insert() - adds the element to the queue.
            4. push_front() - adds the element to the front of the queue.
            5. push_back() - adds the element to the back of the queue.
            6. pop_front() - removes the element from the front of the queue.
            7. pop_back() - removes the element from the back of the queue.
    --> Queue automatically supports :
            1. FIFO (First In First Out) order. 
                --> use push_front() and pop_back() methods.
            2. LIFO (Last In First Out) order.
                --> use push_back() and pop_front() methods.
            3. FILO (First In Last Out) order.
                --> use push_front() and pop_front() methods.
            4. LILO (Last In Last Out) order.
                --> use push_back() and pop_back() methods.            
*/

/*

    interview questions:
            1. What is a queue in SystemVerilog?
            2. How do you declare a queue in SystemVerilog?
            3. What are the methods available for queues in SystemVerilog?
            4. How does a queue maintain the order of elements?
            5. can we access elements in a queue using an index?

*/

module queue_array();

    bit [7:0] queue[$]; // Declare a queue of 8-bit elements

    initial begin
        $display("\n===== size() =====\n");
        $display("Initial size of queue: %0d", queue.size());

        //------- queue intialization --------
        queue = '{12, 23, 34, 45, 56}; // Initialize the queue with some values
        $display("Queue after initialization: %p", queue);
        $display("Size of queue after initialization: %0d", queue.size());
        $display("First element in queue: %0d", queue[0]);


        $display("\n===== insert() =====\n");
        queue.insert(2, 99); // Insert 99 at index 2
        $display("Queue after inserting 99 at index 2: %p", queue);

        foreach(queue[i]) begin
            $display("queue[%0d] = %0d", i, queue[i]);
        end

        $display("Size of queue after insert: %0d", queue.size());


        $display("\n===== delete() =====\n");
        queue.delete(2); // Delete element at index 3
        $display("Queue after deleting element at index 2: %p", queue);

        // print using foreach loop
        foreach(queue[i]) begin
            $display("queue[%0d] = %0d", i, queue[i]);
        end

        $display("Size of queue after delete: %0d", queue.size());

        $display("\n===== push_front() =====\n");
        queue.push_front(100); // Push "100" to the front of the queue
        $display("Queue after pushing '100' to the front: %p", queue);
        $display("Size of queue after push_front: %0d", queue.size());


        $display("\n===== push_back() =====\n");
        queue.push_back(200); // Push "200" to the back of the queue
        $display("Queue after pushing '200' to the back: %p", queue);
        $display("Size of queue after push_back: %0d", queue.size());


        $display("\n===== pop_front() =====\n");
        queue.pop_front(); // Pop the front element from the queue
        $display("Queue after popping front element: %p", queue);
        $display("Size of queue after pop_front: %0d", queue.size());


        $display("\n===== pop_back() =====\n");
        queue.pop_back(); // Pop the back element from the queue
        $display("Queue after popping back element: %p", queue);
        $display("Final size of queue: %0d", queue.size());

    end

endmodule : queue_array