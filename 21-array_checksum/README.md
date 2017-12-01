# Array Checksum


Checksums are small values calculated from big amount of data to test whether data are consistent, i.e. whether they contain errors.


To avoid problems with such tasks let us now practice the checksum calculating algorithm which will be involved.



Problem statement

You will be given the array for which checksum should be calculated.

Perform calculation as follows: for each element of the array (starting from beginning)

add this element to result variable and multiply this sum by 113 - this new value taken by modulo 10000007 should become the next value of result, and so on.

Read the article on checksum for detailed description of this algorithm.

An example of calculation also could be found there.

Input data will tell the length of an array in the first line.

Array values themselves follow in the second line, separated by spaces.

Answer should have a single value - calculated checksum.



Example:


input data:

6

3 1 4 1 5 9

answer:

8921379



# result

erlang

task:checksum1(6, [3, 1, 4, 1, 5, 9]).


problem from :
http://www.codeabbey.com/index/task_view/array-checksum

