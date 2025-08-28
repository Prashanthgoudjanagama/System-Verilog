
// file name : 25_opps_polymorphism.sv
// module name : top_polymorphism

/*
        Polymorphism:
        ______________________________________________________________________________________________________

            1. Poly means many and morphism means forms.

            2. It is a feature of OOPs that allows methods to do different things
               based on the object that it is acting upon.

            3. In SystemVerilog, polymorphism is achieved through method overriding
               in inheritance.

            4. When a derived class has a method with the same name as a method in
               its base class, the derived class's method overrides the base class's
               method.

            5. This allows for dynamic method resolution, where the method that gets
               called is determined at runtime based on the type of the object being
               referenced, rather than the type of the reference itself.

        ______________________________________________________________________________________________________

*/
//___________________________example-1___________________________

class parent;
   int data;
   int id;

   virtual function void display();
      $display("[Parent] class - Data: %0d, ID: %0d", data, id);
   endfunction: display

endclass: parent


class child_a extends parent;

   function void display();
      $display("[Child_a] class - Data: %0d, ID: %0d", data, id);
   endfunction: display

endclass: child_a

class child_b extends parent;

   function void display();
      $display("[Child_b] class - Data: %0d, ID: %0d", data, id);
   endfunction: display

endclass: child_b

class child_c extends parent;

   function void display();
      $display("[Child_c] class - Data: %0d, ID: %0d", data, id);
   endfunction: display

endclass: child_c

module example_1();

   parent p1,p2,p3;
   child_a c1;
   child_b c2;
   child_c c3;

   initial begin
      $display("\n\t__________ Polymorphism example-1 __________\n");

      c1 = new();
      c2 = new();
      c3 = new();

      c1.data = 200; c1.id = 2;
      c2.data = 300; c2.id = 3;
      c3.data = 400; c3.id = 4;

      p1 = c1;
      p2 = c2;
      p3 = c3;


      p1.display();
      p2.display();
      p3.display();

   end
endmodule : example_1


//________ example-2 : both have same name of properties _________________________________

class base_class;
   int data;
   int id;

   function void display();
      $display("[Base_class] - Data: %0d, ID: %0d", data, id);
   endfunction : display

endclass : base_class

class derived_class extends base_class;
   int data;
   int id;

   function void display();
      $display("[Derived_class] - Data: %0d, ID: %0d", data, id);
   endfunction : display

endclass : derived_class

module example_2();

   base_class p;
   derived_class c;

   initial begin
      $display("\n\t__________ Polymorphism example-2: both have same properties __________\n");
      c = new();
      p = c;

      p.data = 100; p.id = 1;
      c.data = 200; c.id = 2;

      p.display();   // 100, 1

   end

endmodule : example_2


//________ example-3 : only parent have properties _________________________________

class parent_class;
   int data;
   int id;

   function void display();
      $display("[Base_class] - Data: %0d, ID: %0d", data, id);
   endfunction : display

endclass : parent_class

class child_class extends parent_class;

   function void display();
      $display("[Child_class] - Data: %0d, ID: %0d", data, id);
   endfunction : display

endclass : child_class

module example_3();

   parent_class p_3;
   child_class c_3;

   initial begin
      $display("\n\t__________ Polymorphism example-3: only parent has properties __________\n");
      c_3 = new();
      p_3 = c_3;

      p_3.data = 100; p_3.id = 1;
      c_3.data = 200; c_3.id = 2;

      p_3.display();   //200, 2

   end

endmodule : example_3

// ______ example_4 : base class handle assigned to child class object ______________________________
module example_4();

   parent_class p_4;
   child_class c_4;

   initial begin
      $display("\n\t__________ Polymorphism example-4: base class handle assigned to child class object __________\n");
      p_4 = new();
      p_4.data = 500; p_4.id = 5;
      c_4 = new();

      // method-1 : fail
      // error will get
      // c_4 = p_4; // base class handle assigned to child class object --> we will get error
      // use $cast to avoid this

      // method-2 : failed --> bad_handle reference
      // $cast(c_4, p_4);

      // method-3 : success
      p_4 = c_4; // child class object assigned to base class handle
      $cast(c_4, p_4); 

      c_4.display(); // Calls child display due to polymorphism

   end
endmodule : example_4




// ____________________________________________________ top _________________________________________
module top_polymorphism();

   example_1 ex1();
   example_2 ex2();
   example_3 ex3();
   example_4 ex4();

endmodule : top_polymorphism


/*
__________ Polymorphism example-1 __________
# 
# [Child_a] class - Data: 200, ID: 2
# [Child_b] class - Data: 300, ID: 3
# [Child_c] class - Data: 400, ID: 4
# 
# 	__________ Polymorphism example-2: both have same properties __________
# 
# [Base_class] - Data: 100, ID: 1
# 
# 	__________ Polymorphism example-3: only parent has properties __________
# 
# [Base_class] - Data: 200, ID: 2
*/