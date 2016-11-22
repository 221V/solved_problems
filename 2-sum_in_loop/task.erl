-module(task).

-export([sum2/2]).

sum2(Count, Values) ->
  sum2(Count, binary:split(Values, <<" ">>, [global]), 0).

sum2(_, [], Result) ->
  Result;
sum2(Count, [ValueHead|ValuesTail], Result) ->
  sum2(Count - 1, ValuesTail, Result + list_to_integer(binary_to_list(ValueHead))).
