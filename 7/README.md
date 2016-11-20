# Rounding

There are several pairs of numbers. For each pair you are to divide first by second and return the result, rounded to the nearest integer.

In cases, when result contains exactly 0.5 as a fraction part, value should be rounded up (i.e. by adding another 0.5). Note that for negative values "greater" means "closer to zero". Refer to the Wikipedia page on Rounding for more thorough explanations.

In any further problems, when rounding is mentioned - just the same rounding algorithm is supposed (unless other is explicitly specified).

Input data will give a number of test-cases in the first line.
Next lines will contain one test-case (i.e. the pair of numbers) each.
Answer should contain division-and-rounding results for each pair, separated with spaces

Example:

input data:

3

12 8

11 -3

400 5

answer:

2 -4 80


# result
js

look in console

erlang

task:round(3,[{12, 8}, {11, -3}, {400, 5}]).

elixir

Task.round(3, [{12, 8}, {11, -3}, {400, 5}])


problem from :
http://www.codeabbey.com/index/task_view/rounding
