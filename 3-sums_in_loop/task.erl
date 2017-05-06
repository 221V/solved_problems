-module(task).

-export([sum3/2]).

sum3(Count, Values) ->
  sum3(Count, Values, []).

sum3(_, [], Result) ->
  lists:reverse(Result);
sum3(Count, [{Value1, Value2}|ValuesTail], Result) ->
  sum3(Count - 1, ValuesTail, [Value1 + Value2|Result]).
