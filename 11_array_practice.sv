// filename: 11_array_practice.
// module name: array_practice

/*
       --> practice set-1:
              Q1. store the elements in array and print it?
              Q2. store the elments and print it in reverse?
              Q3. find sum of all elments in the array?
              Q4. copy one array to another and merge two arrays in one array?
              Q5. count the total num of duplicates?
              Q6. Unique elements in the array?
              Q7. count the freq of each elements?
              Q8. find max and min number?
              Q9. seperate odd and even locations in arrays?
              Q10. sort the elements assending order and dessending order?
              Q11. insert into the sorted and unsorted array?
              Q12. delete a selected position?
              Q13. find 2nd largest and smallest num?

       --> practice set-2:
              Q14. print 2D 3x3 matrix?
              Q15. addition of 2 3x3 matrixs?
              Q16. substraction of 2 3x3 matrixs?
              Q17. multiplication of two matrics?
              Q18. transpose of matrics?
              Q19. sum of right and left diagonals of matrics?
              Q20. sum of rows and columns of matrix?
              Q21. print upper and lower trianguler matrix?
              Q22. caluclate det of 3x3 matrix?
              Q23. given matrix is a sparse matrix are not?
              Q24. set two 2x2 matrices and check they are equal are not?
              Q25. check identity matrix?

       --> practice set-3:
              Q26. sum of any two value in a array to be expected value? 
              Q27. majority element in the array? (n - size, appears more then n/2 times)
              Q28. search element in row and column wise?
              Q29. find the row with max num of ones?
              Q30. find the missing num from the array and there are no duplicates in array?
              Q31. segregate 0's, 1's ?
              Q32. merge two sorted arrays in one sorted array?
              Q33. rorate array by N-position?
              Q34. move all zeros to the end?
              Q35. segregate even and odd elements in array (all even, all odd)?
              Q36. find the smallest missing element from sorted array?
              Q37. repeating elemts in the array?
              Q38. find the sum of two elments near to zero?
              Q39. generates random elements in the range 10-100 in a array?

       --> practice set-4:
              Q40. fibbinacci series in array?
              Q41. factorial?
              Q42. prime num?
              Q43. even and odd?
              Q44. leap year?
              Q45. palindrome num?
              Q46. GCD of two num's?
              Q47. LCM of two num's?
              Q48. Armstrong num?
              Q49. check the perfect square?
              Q50. sum of digits in the num?
              Q51. convert dec to bin?
              Q52. count the num of digits in a num?
              Q53. Swap two num without using a third variable?
              
*/

module PS1();

	bit[31:0] Q1[];

	initial begin
		$display("---------------------------------------------------------------------------\n");

		$display("---------- Q1. print the array-----------");

		Q1 = new[10];
		for(int i=0; i<10; i++) begin
			Q1[i] = i+1;
		end
		$display("Q1 : %0p", Q1);	

	end

	bit[31:0] Q2[$];
	bit[31:0] Q2_temp[5];

	initial begin
		$display("\n---------------------------------------------------------------------------\n");

		$display("---------- Q2. print the array in reverse order-----------");

		Q2 = '{1,2,3,4,5};
		$display("Q2 : %0p", Q2);
		foreach(Q2[i]) begin
			Q2_temp[i] = Q2[(Q2.size)-1-i];
		end
		$display("Q2_temp : %0p", Q2_temp);
		Q2.reverse();
		$display("using reverse method --> Q2 : %0p", Q2);

	end



	bit[31:0] Q3[$];
	int sum_q3;

	initial begin
		$display("\n---------------------------------------------------------------------------\n");

		$display("---------- Q3. find the sum off all elements-----------");

		Q3 = '{1,2,3,4,5,6,7,8,9,10};
		$display("Q3 : %0p", Q3);

		sum_q3 = 0;

		foreach(Q3[i]) begin
			sum_q3 = Q3[i] + sum_q3;		
		end
		$display("sum : %0d", sum_q3);	
		// using sum method
		$display("using sum method --> sum : %0d", Q3.sum());	
	end


	int Q4[3];
	int q4_s[3];
	int q4_s1[3];
	int q4[6];

	initial begin
		$display("\n---------------------------------------------------------------------------\n");

		$display("---------- Q4. copy one array into another and two into one merge-----------");

		Q4 = '{1,2,3};
		$display("Q4 : %0p", Q4);

		//one-one
		q4_s = Q4;
		$display("Q4 to --> q4_s : %0p", q4_s);

		q4_s1 = '{4,5,6};
		$display("q4_s1 : %0p", q4_s1);

		//two to one
		q4 = {q4_s, q4_s1};
		$display("{q4_s,q4_s1} --> q4  : %0p", q4);

	end


	int Q5[$];
	int dupl[int]; // used to store the duplicate elements
	int dupl_count; // used to count the number of duplicates

	initial begin
		$display("\n---------------------------------------------------------------------------\n");

		$display("---------- Q5. find the duplicate num in the array-----------");

		Q5 = '{1,2,3,4,5,2,4,5};  // repeated elements are 2,4,5 and these are duplicates.
		$display("Q5 : %0p", Q5);
		dupl_count = 0;

		for(int i=0; i<Q5.size(); i++) begin   
			for(int j = i+1; j<Q5.size(); j++) begin
				if(Q5[i] == Q5[j]) begin  // if i, j elements are same then it is a duplicate.
					dupl[i] = Q5[i];
					dupl_count++;
				end
			end
		end
		$display("dupl : %0p", dupl);
		$display("dupl_count : %0d", dupl_count);
	end


	int Q6[$];
	int unq[$];
	bit is_unq;

	initial begin
		$display("\n---------------------------------------------------------------------------\n");

		$display("---------- Q6. unique element in the array-----------");

		Q6 = '{1,2,3,4,3,4,5};
		$display("Q6 : %0p", Q6);

		for(int i=0; i<Q6.size(); i++) begin
			is_unq = 1; //assume is is a unq num.
			for(int j = i+1; j<Q6.size(); j++) begin
				if(Q6[i] == Q6[j]) begin
					is_unq = 0;
					break;
				end
			end

			if(is_unq) begin // if is_unq = 1 then it is a unq num.
				unq.push_back(Q6[i]);
			end
		end
		$display("unq : %0p", unq);
		// using unique method
		Q6.unique();
		$display("using unique method --> Q6 : %0p", Q6);
	end


	int Q7[$];
	int freq[int];

	initial begin
		$display("\n---------------------------------------------------------------------------\n");

		$display("---------- Q7. freq of each num-----------");
		Q7 = '{1,2,3,1,2,3,4,5,4};
		$display("Q7 : %0p", Q7);
		for(int i=0; i<Q7.size(); i++) begin
			freq[Q7[i]]++;
		end

		foreach(freq[i]) begin
			$display("element : %0d frequency is %0d times", i, freq[i]);
		end

	end


	int Q8[$];
	int min, max;
	int temp_q8;

	initial begin
		$display("\n---------------------------------------------------------------------------\n");
		$display("---------- Q8. find the min and max num-----------");

		Q8 = '{2,34,5,1,33,67,28,78,31};
		$display("Q8 : %0p", Q8);

		for(int i=0; i<Q8.size(); i++) begin
			for(int j=0; j<Q8.size-1-i; j++) begin // bubble sort
				if(Q8[j] > Q8[j+1]) begin	// assending order
					temp_q8 = Q8[j];
					Q8[j] = Q8[j+1];
					Q8[j+1] = temp_q8;
				end
			end
		end

		$display("after sort Q8 : %0p", Q8);
		max = Q8[Q8.size()-1];
		$display("max num in this Q8 : %0d", max);
		min = Q8[0];
		$display("min num in this Q8 : %0d", min);

	end

	int Q9[$];
	int odd[int];
	int even[int];

	initial begin
		$display("\n---------------------------------------------------------------------------\n");
		$display("---------- Q9. separate odd and even locations in diff arrays-----------");

		Q9 = '{65,78,98,103,56,71,68,81,122,178,191,209,279,301,356};
		$display("Q9 : %0p", Q9);

		foreach(Q9[i]) begin
			if(i%2==0) begin
				even[i] = Q9[i];
			end
			else begin
				odd[i] = Q9[i];
			end
		end

		$display("even : %0p", even);
		$display("odd : %0p", odd);
	end


	int Q10[$];
	int temp_ass;
	int sorted_arr[$];
	int desorted_arr[$];
	int temp_dess;

	initial begin
		$display("\n---------------------------------------------------------------------------\n");

		$display("---------- Q10. assending and dessending order-----------");
		Q10 = '{1,8,6,3,4,2,5,7,9};
		$display("Q10 : %0p", Q10);


		foreach(Q10[i]) begin
			sorted_arr.push_back(Q10[i]);
			desorted_arr.push_back(Q10[i]);
		end

		for(int i=0; i<sorted_arr.size(); i++) begin
			for(int j=0; j<(sorted_arr.size()-1-i); j++) begin
				if(sorted_arr[j] > sorted_arr[j+1]) begin
					temp_ass = sorted_arr[j];
					sorted_arr[j] = sorted_arr[j+1];
					sorted_arr[j+1] = temp_ass;
				end
			end
		end

		for(int i=0; i<desorted_arr.size(); i++) begin
			for(int j=0; j<(desorted_arr.size()-1-i); j++) begin
				if(desorted_arr[j] < desorted_arr[j+1]) begin
					temp_dess = desorted_arr[j];
					desorted_arr[j] = desorted_arr[j+1];
					desorted_arr[j+1] = temp_dess;
				end
			end
		end

		$display("sorted_arr : %0p", sorted_arr);
		$display("desorted_arr : %0p", desorted_arr);

		Q10.sort();
		$display("using Q10.sort : %0p", Q10);

		Q10.rsort();
		$display("using Q10.rsort : %0p", Q10);
	end


	int Q11[$];
	int Q11_un[$];
	
	initial begin
		$display("\n---------------------------------------------------------------------------\n");
		$display("---------- Q11. insert into sorted and unsorted arrays-----------");

		Q11 = '{12,14,15,17,16,20,19,18};
		$display("Q11 : %0p", Q11);
		Q11.sort();
		$display("after sort Q11 : %0p", Q11);

		Q11.insert(1,13);
		$display("Q11 after insert: %0p", Q11);

		Q11_un = '{2,3,41,21,67,1,27,34};
		$display("Q11_un : %0p", Q11_un);

		Q11_un.insert(7,10000);
		$display("Q11_un after insert : %0p", Q11_un);
	end

	int Q12[$];

	initial begin
		$display("\n---------------------------------------------------------------------------\n");
		$display("---------- Q12. delete a element at disired position-----------");

		Q12 = '{23,34,45,56,78};
		$display("Q12 : %0p", Q12);

		Q12.delete(2);
		$display("Q12 after delete(2) : %0p", Q12);

	end


	int Q13[$];
       int s_min, s_max;
	int temp_q13;	

	initial begin
		$display("\n---------------------------------------------------------------------------\n");
		$display("---------- Q13. find 2nd largest and 2nd smallest num-----------");

		Q13 = '{65,78,98,103,56,71,68,81,122,178,191,209,279,301,356};

		$display("Q13 : %0p", Q13);

		for(int i=0; i<Q13.size; i++) begin
			for(int j=0; j<Q13.size-1-i; j++) begin
				if(Q13[j] < Q13[j+1]) begin
					temp_q13 = Q13[j];
					Q13[j] = Q13[j+1];
					Q13[j+1] = temp_q13;
				end
			end
		end

		s_min = Q13[Q13.size-2];
		s_max = Q13[1];
		$display("after rsort Q13 : %0p", Q13);
		$display("2nd min : %0d", s_min);
		$display("2nd max : %0d", s_max);

	end

endmodule : PS1


module PS2();

    int Q14[3][3];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q14. print the matrix 3x3----------\n");

		Q14 = '{'{1,2,3},'{4,5,6},'{7,8,9}};

		for(int i=0; i<3; i++) begin
			for(int j=0; j<3; j++) begin
				$write("\t%0d", Q14[i][j]);
			end
			$write("\n");
		end
	end


	int Q15_a[3][3];
	int Q15_b[3][3];

	int Q15_sum[3][3];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q15. addition of two matrix 3x3----------\n");

		foreach(Q15_a[i,j]) begin
			Q15_a[i][j] = i*j;
			Q15_b[i][j] = (i+1)*(j+1);
		end

		foreach(Q15_a[i,j]) begin
			Q15_sum[i][j] = Q15_a[i][j] + Q15_b[i][j];
		end
		$display("*********matrix A************");
		foreach(Q15_a[i,j]) begin
			$write("	%0d", Q15_a[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end


		$display("\n*********matrix B************");
		foreach(Q15_b[i,j]) begin
			$write("	%0d", Q15_b[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end


		$display("\n*********matrix sum************");
		foreach(Q15_sum[i,j]) begin
			$write("	%0d", Q15_sum[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end

	end

	int Q16_a[3][3];
	int Q16_b[3][3];

	int Q16_sub[3][3];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q16. substraction of two matrix 3x3----------\n");

		foreach(Q16_a[i,j]) begin
			Q16_a[i][j] = (8*i)*(j+1);
			Q16_b[i][j] = (i+1)*(j+1);
		end

		foreach(Q16_a[i,j]) begin
			Q16_sub[i][j] = Q16_a[i][j] - Q16_b[i][j];
		end
		$display("*********matrix A************");
		foreach(Q16_a[i,j]) begin
			$write("	%0d", Q16_a[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end


		$display("\n*********matrix B************");
		foreach(Q16_b[i,j]) begin
			$write("	%0d", Q16_b[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end


		$display("\n*********matrix sub************");
		foreach(Q16_sub[i,j]) begin
			$write("	%0d", Q16_sub[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end
	end

	int Q17_a[3][3];
	int Q17_b[3][3];
	int Q17_mult[3][3];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q17. multiplication of two matrix 3x3----------\n");

		Q17_a = '{'{1,2,3},'{4,5,6},'{7,8,9}};
		Q17_b = '{'{1,1,1},'{2,2,2},'{3,3,3}};
		Q17_mult = '{default:0};

		for(int i=0; i<3; i++) begin
			for(int j=0; j<3; j++) begin
				for(int k=0; k<3; k++) begin
					Q17_mult[i][j] = Q17_mult[i][j] + (Q17_a[i][k] * Q17_b[k][j]);
				end
			end
		end
		
		$display("*********matrix A************");
		foreach(Q17_a[i,j]) begin
			$write("	%0d", Q17_a[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end


		$display("\n*********matrix B************");
		foreach(Q17_b[i,j]) begin
			$write("	%0d", Q17_b[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end


		$display("\n*********matrix mult************");
		foreach(Q17_mult[i,j]) begin
			$write("	%0d", Q17_mult[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end


	end


	int Q18_a[3][3];
	int Q18_aT[3][3];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q18. A transpose a of matrix 3x3----------\n");

		Q18_a = '{'{1,3,5},'{7,9,0},'{2,4,6}};


		foreach(Q18_a[i,j]) begin
			Q18_aT[i][j] = Q18_a[j][i];
		end

		$display("*********matrix A************");
		foreach(Q18_a[i,j]) begin
			$write("	%0d", Q18_a[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end


		$display("\n*********matrix A transpose************");
		foreach(Q18_aT[i,j]) begin
			$write("	%0d", Q18_aT[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end
	end


	int Q19_a[3][3];
	int right_sum;
	int left_sum;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q19. sum right and left diagonals a of matrix 3x3----------\n");

		Q19_a = '{'{1,2,3},'{4,5,6},'{0,8,9}};

		right_sum = 0;
		left_sum = 0;

		for(int i=0; i<3; i++) begin
			right_sum = right_sum + Q19_a[i][i];
			left_sum = left_sum + Q19_a[3-1-i][i];
		end

		foreach(Q19_a[i,j]) begin
			$write("	%0d",Q19_a[i][j]);
			if(j==2) begin
				$write("\n");
			end
		end

		$display("sum of right diagonal : %0d", right_sum);
		$display("sum of left diagonal : %0d", left_sum);


	end

	int Q20_a[3][3];
	int row_sum[3];
	int col_sum[3];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q20. sum each rows and left columns a of matrix 3x3----------\n");

		Q20_a = '{'{12,24,36},'{13,26,39},'{14,28,42}};

		foreach(Q20_a[i,j]) begin
			$write("	%0d", Q20_a[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end
		
		foreach(Q20_a[i,j]) begin
			row_sum[i] = row_sum[i] + Q20_a[i][j];
			col_sum[i] = col_sum[i] + Q20_a[j][i];
		end

		for(int i=0; i<3; i++) begin
			$display("row_sum[%0d] : %0d", i, row_sum[i]);
		end
		for(int i=0; i<3; i++) begin
			$display("col_sum[%0d] : %0d", i, col_sum[i]);
		end
	end



	int Q21_upper[3][3];
	int Q21_lower[3][3];
	bit is_upper, is_lower;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q21. upper and lower triagle of matrix 3x3----------\n");

		Q21_upper = '{'{1,2,3},'{0,4,5},'{0,0,6}};
		Q21_lower = '{'{1,0,0},'{2,3,0},'{4,5,6}};

		$display("\n ***** matrix A ******");
		foreach(Q21_upper[i,j]) begin
			$write("	%0d",Q21_upper[i][j]);
			if(j==2) begin
				$write("\n");
			end
		end

		is_upper = 1;
		is_lower = 1;

		foreach(Q21_upper[i,j]) begin
			if(i>j && Q21_upper[i][j]!=0) begin
				is_upper = 0;
				break;
			end 
		end

		if(is_upper == 1) begin
			$display("\ngiven matrix is a upper triangle matrix");
		end
		else begin
			$display("\ngiven matrix is not a upper triangle matrix");
		end

		$display("\n ***** matrix B ******");
		foreach(Q21_lower[i,j]) begin
			$write("	%0d",Q21_lower[i][j]);
			if(j==2) begin
				$write("\n");
			end
		end
		
		foreach(Q21_lower[i,j]) begin
			if(i<j && Q21_lower[i][j]!=0) begin
				is_lower = 0;
				break;
			end			
		end

		if(is_lower == 1) begin
			$display("given matrix is a lower triangle matrix");
		end
		else begin
			$display("given matrix is not a lower triangle matrix");
		end

	end

	int Q22_a[3][3];
	int det_a;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q22. calculate the det of matrix 3x3----------\n");

		det_a = 0;

		Q22_a = '{'{9,8,7}, '{6,5,4}, '{1,2,1}};

		foreach(Q22_a[i,j]) begin
			$write("	%0d",Q22_a[i][j]);
			if(j==2) begin
				$write("\n");
			end
		end

		det_a = (Q22_a[0][0]*((Q22_a[1][1]*Q22_a[2][2])-(Q22_a[2][1]*Q22_a[1][2]))) - (Q22_a[0][1]*((Q22_a[1][0]*Q22_a[2][2])-(Q22_a[2][0]*Q22_a[1][2]))) + (Q22_a[0][2]*((Q22_a[1][0]*Q22_a[2][1])-(Q22_a[2][0]*Q22_a[1][1])));

		$display("\ndet_a : %0d", det_a);
	end


	int Q23_a[3][3];
	int zero_count;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q23. given matrix 3x3 is sparse matrix or not----------\n");

		Q23_a = '{'{2,0,1},'{1,1,0},'{0,6,0}};

		$display("\n***** matrix A *****\n");	
		foreach(Q23_a[i,j]) begin
			$write("	%0d",Q23_a[i][j]);
			if(j==2) begin
				$write("\n");
			end
		end

		foreach(Q23_a[i,j]) begin
			if(Q23_a[i][j] == 0)begin
				zero_count++;
			end
		end

		if(zero_count > 4) begin
			$display("\nzero count is >4 so : sparse matrix");
		end
		else begin
			$display("\nzero count is not >4 so : not sparse matrix");	
		end

	end


	int Q24_a[2][2];
	int Q24_b[2][2];
	bit is_equal;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q24. check two matrix 2x2 are equal or not----------\n");

		Q24_a = '{'{1,2},'{1,2}};
		Q24_b = '{'{1,2},'{1,2}};

		$display("\n***** matrix A *****\n");	
		foreach(Q24_a[i,j]) begin
			$write("	%0d",Q24_a[i][j]);
			if(j==1) begin
				$write("\n");
			end
		end
		
		$display("\n***** matrix B *****\n");	
		foreach(Q24_b[i,j]) begin
			$write("	%0d",Q24_b[i][j]);
			if(j==1) begin
				$write("\n");
			end
		end

		foreach(Q24_a[i,j]) begin
			if(Q24_a[i][j] == Q24_b[i][j]) begin
				is_equal = 1;
			end	
			else begin
				is_equal = 0;
				break;
			end
		end

		if(is_equal == 1) begin
			$display("\nBoth A and B matrix are equal");
		end
		else begin
			$display("\nBoth A and B matrix are not equal");
		end
	end

	int Q25_a[3][3];
	int is_ident;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q25. check identity matrix----------\n");

		Q25_a = '{'{1,0,0},'{0,1,0},'{0,0,1}};
		
		$display("\n***** matrix A *****\n");	
		foreach(Q25_a[i,j]) begin
			$write("	%0d",Q25_a[i][j]);
			if(j==2) begin
				$write("\n");
			end
		end

		foreach(Q25_a[i,j]) begin
			if(((i==j) && (Q25_a[i][j] == 1)) || ((i!=j)&&(Q25_a[i][j] == 0))) begin
				is_ident = 1;	
			end
			else begin
				is_ident = 0;
				break;
			end
		end

		if(is_ident == 1) begin
			$display("\nGiven matrix is a identity matrix");
		end
		else begin
			$display("\nGiven matrix is not a identity matrix");
		end
	end
endmodule : PS2

module PS3();

	int Q26[$];
	int expected_value;
	bit found;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q26. sum of any two value in a array to be expected value----------\n");

		Q26 = '{1,2,3,4,5,6,7,8,9};
		expected_value = 17;
		found = 0;

		$display("Q26 : %0p", Q26);

		foreach(Q26[i]) begin
			foreach(Q26[j]) begin
				if((Q26[i] + Q26[j]) == expected_value) begin
					$display("Q26[%0d] + Q26[%0d] = %0d", i, j, (Q26[i] + Q26[j]));
					found = 1;
				end
			end
		end

		if(!found) begin
			$display("No two elements found with the expected value %0d", expected_value);
		end
	end

	int Q27[$];
	int count;
	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q27. majority element in the array----------\n");

		Q27 = '{1,2,3,2,2,2,5,6,2,2};
		count = 0;

		$display("Q27 : %0p", Q27);

		for(int i=0; i<Q27.size(); i++) begin
			count = 0;
			for(int j=1; j<Q27.size(); j++) begin
				if(Q27[i] == Q27[j]) begin
					count++;
				end
			end

			if(count > (Q27.size()/2)) begin
				$display("element %0d is a majority element with count %0d", Q27[i], count);
				break;
			end
			else begin
				$display("element %0d is not a majority element with count %0d", Q27[i], count);
			end
		end
	end

	int Q28[3][3];
	int search_element;
	bit is_search;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q28. search element in row and column wise----------\n");

		Q28 = '{'{10,20,30},'{15,25,35},'{27,29,25}};
		search_element = 25;
		is_search = 1;

		foreach(Q28[i,j]) begin
			$write("\t%0d", Q28[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end

		for(int i=0; i<3; i++) begin
			is_search = 0; // reset for each row
			for(int j=0; j<3; j++) begin
				if(Q28[i][j] == search_element) begin
					$display("Element %0d found at position [%0d][%0d]", search_element, i, j);
					is_search = 1;
				end
			end
		end

		if(!is_search) begin
			$display("Element %0d not found in the matrix", search_element);
		end
	end


	int Q29[3][3];
	int max_row;  // to store the row index with max ones
	int max_count; // to store the max count of ones in that row
	int count_29;	// to count the number of ones in each row

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q29. find the row with max num of ones----------\n");

		Q29 = '{'{1,0,1},'{0,1,0},'{1,1,1}};
		max_row = 0;
		max_count = 0;

		foreach(Q29[i,j]) begin
			$write("\t%0d", Q29[i][j]);
			if(j == 2) begin
				$write("\n");
			end
		end

		for(int i=0; i<3; i++) begin
			count_29 = 0;
			for(int j=0; j<3; j++) begin
				if(Q29[i][j] == 1) begin
					count_29++;
				end
			end

			if(count_29 > max_count) begin
				max_count = count_29;
				max_row = i;
			end
		end

		$display("Row %0d has the maximum number of ones: %0d", max_row, max_count);
	end


	int Q30[$];
	int missing_num;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q30. find the missing num from the array----------\n");

		Q30 = '{1,2,3,4,6,7,8,9,10};
		missing_num = 0;

		foreach(Q30[i]) begin
			if(Q30[i] != (i+1)) begin
				missing_num = i+1;
				break;
			end
		end

		if(missing_num == 0) begin
			$display("No missing number in the array");
		end
		else begin
			$display("Missing number in the array is : %0d", missing_num);
		end
	end


	int Q31[$];
	int zero_count;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q31. segregate 0's, 1's----------\n");

		Q31 = '{0,1,0,1,0,1,0,1,0};
		zero_count = 0;

		foreach(Q31[i]) begin
			if(Q31[i] == 0) begin
				zero_count++;
			end
		end

		for(int i=0; i<zero_count; i++) begin
			Q31[i] = 0;
		end

		for(int i=zero_count; i<Q31.size(); i++) begin
			Q31[i] = 1;
		end

		$display("After segregation Q31 : %0p", Q31);
	end


	int Q32[$];
	int Q32_a[$];
	int Q32_b[$];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q32. merge two sorted arrays into one sorted array----------\n");

		Q32_a = '{9,1,7,3,5};
		$display("Q32_a : %0p", Q32_a);
		Q32_a.sort();
		$display("Q32_a after sort : %0p", Q32_a);

		Q32_b = '{2,6,4,8,0};	
		$display("Q32_b : %0p", Q32_b);
		Q32_b.sort();
		$display("Q32_b after sort : %0p", Q32_b);

		Q32 = {Q32_a, Q32_b};
		$display("Q32 : %0p", Q32);
		Q32.sort();
		$display("Q32 after sort : %0p", Q32);
	end

	int Q33[$];
	int N; // number of positions to rotate
	int temp;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q33. rotate array by N-positions ----------\n");

		Q33 = '{1,2,3,4,5,6,7,8,9};
		N = 3; // number of positions to rotate

		$display("Q33 : %0p", Q33);

		for(int i=0; i<N; i++) begin
			temp = Q33[0]; // store the first element
			for(int j=0; j<Q33.size(); j++) begin
				Q33[j] = Q33[j+1]; // shift elements to the left
			end
			Q33[Q33.size()-1] = temp; // place the first element at the end
		end

		$display("Q33 after rotating %0d positions : %0p", N, Q33);

	end


	int Q34[$];
	int q34_res[$]; // to store the result after moving zeros to the end
	int count_q34;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q34. move all zeros to the end----------\n");

		Q34 = '{0,1,0,3,12,0,5,0};
		count_q34 = 0;
		$display("Q34 : %0p", Q34);

		// Count non-zero elements and store them in q34_res
		for(int i=0; i<Q34.size(); i++) begin
			if(Q34[i] != 0) begin
				q34_res[count_q34] = Q34[i]; // store non-zero elements
				count_q34++;
			end
		end

		// Fill the rest of q34_res with zeros
		for(int i=count_q34; i<Q34.size(); i++) begin
			q34_res[i] = 0; // fill the rest with zeros
		end
		
		$display("Q34 after moving all zeros to the end : %0p", q34_res);

	end


	int Q35[$];
	int even[$];
	int odd[$];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q35. segregate array elements into even and odd elements----------\n");

		Q35 = '{1,2,3,4,5,6,7,8,9,10};
		$display("Q35 : %0p", Q35);

		foreach(Q35[i]) begin
			if(Q35[i] % 2 == 0) begin
				even.push_back(Q35[i]);
			end
			else begin
				odd.push_back(Q35[i]);
			end
		end

		$display("Even elements : %0p", even);
		$display("Odd elements : %0p", odd);
	end

/*
			  Q36. find the smallest missing element from sorted array?
              Q37. repeating elemts in the array?
              Q38. find the sum of two elments near to zero?
              Q39. generates random elements in the range 10-100 in a array?
*/
	int Q36[$];
	int smallest_missing;

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q36. find the smallest missing element from sorted array----------\n");

		Q36 = '{1,3,4,6,7,8,9};
		smallest_missing = 0;
		$display("Q36 : %0p", Q36);

		// Assuming Q36 is sorted, we can find the smallest missing number
		foreach(Q36[i]) begin
			if(Q36[i] != (i+1)) begin
				smallest_missing = i+1;
				break;
			end
		end

		if(smallest_missing == 0) begin
			$display("No missing number in the array");
		end
		else begin
			$display("Smallest missing number in the array is : %0d", smallest_missing);
		end
	end

	int Q37[$];
	int repeating[int];	

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q37. find the repeating elements in the array----------\n");

		Q37 = '{1,2,3,4,5,6,7,8,9,1,2,3};
		repeating = '{default:0}; // initialize to zero

		$display("Q37 : %0p", Q37);

		// Count the frequency of each element
		foreach(Q37[i]) begin //
			for(int j=i+1; j<Q37.size(); j++) begin
				if(Q37[i] == Q37[j]) begin
					repeating[Q37[i]]++;
				end
			end
		end

		foreach(repeating[i]) begin
			if(repeating[i] > 0) begin
				$display("Element %0d is repeating %0d times", i, repeating[i]);
			end
		end
	end


	int Q38[$];

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
		$display("\---------Q38. find the some of two elements ina array is near to zero----------\n");

		Q38 = '{23,45,56,78,12,7,1};
		$display("Q38 : %0p", Q38);

		for(int i=0; i<Q38.size(); i++) begin
			for(int j=i+1; j<Q38.size(); j++) begin

			end
		end 

	end

	

endmodule : PS3


module top_level();

	PS1 ps1();
	PS2 ps2();
	PS3 ps3();

	initial begin
		$display("\n--------------------------------------------------------------------------------------\n");
	end
endmodule : top_level