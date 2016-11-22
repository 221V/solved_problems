-module(task).

-export([sum3/2]).

sum3(Count, Values) ->
  sum3(Count, Values, []).

sum3(_, [], Result) ->
  lists:reverse(Result);
sum3(Count, [ValueHead|ValuesTail], Result) ->
  {Value1, Value2} = ValueHead,
  Value3 = Value1 + Value2,
  sum3(Count - 1, ValuesTail, [Value3|Result]).
