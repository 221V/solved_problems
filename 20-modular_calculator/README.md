# Modular Calculator


This task provides practice for core property of remainder taking operation in arithmetic -
persisting of the remainder over addition and multiplication.

This important property is often used for checking results of calculations,
in competitive programming, in calculation checksums and especially for encryption.


We have a kind of long arithmetic calculation here, and we are asked about the result modulo some number (result % M in many languages).


Input data will have:

    initial integer number in the first line;
    one or more lines describing operations, in form sign value where sign is either + or * and value is an integer;
    last line in the same form, but with sign % instead and number by which the result should be divided to get the remainder.

Answer should give remainder of the result of all operations applied sequentially (starting with initial number) divided by the last number.



Example:


input data:

5

+ 3

* 7

+ 10

* 2

* 3

+ 1

% 11

answer:
1


# result

erlang

task:mod_calc(5, [{"+3"}, {"*7"}, {"+10"}, {"*2"}, {"*3"}, {"+1"}, {"%11"}]).


problem from :
http://www.codeabbey.com/index/task_view/modular-calculator

