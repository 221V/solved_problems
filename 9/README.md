# Vowel Count

This is a simple problem to get introduced to string processing. We will be given several lines of text - and for each of them we want to know the number of vowels (i.e. letters a, o, u, i, e, y).

Note: that y is regarded as vowel for purpose of this task.

Input data contain number of test-cases in the first line.

Then the specified number of lines follows each representing one test-case.

Lines consist only of lowercase English (Latin) letters and spaces.

Answer should contain the number of vowels in each line, separated by spaces.

Example:

input data:

4

abracadabra

pear tree

o a kak ushakov lil vo kashu kakao

my pyx

answer:

5 4 13 2


# result
js

look in console

erlang

task:vc(4,[<<"abracadabra">>, <<"pear tree">>, <<"o a kak ushakov lil vo kashu kakao">>, <<"my pyx">>]).

elixir

Task.vc(4,["abracadabra", "pear tree", "o a kak ushakov lil vo kashu kakao", "my pyx"])


problem from :
http://www.codeabbey.com/index/task_view/vowel-count
