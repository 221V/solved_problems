-module(task).

-export([round/2]).

round(Count, Values) ->
  round(Count, Values, []).

round(_, [], Result) ->
  lists:reverse(Result);
round(Count, [ValueHead|ValuesTail], Result) ->
  {Value1, Value2} = ValueHead,
  round(Count - 1, ValuesTail, [erlang:round(Value1 / Value2)|Result]).
