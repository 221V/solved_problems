-module(task).

-export([min2/2]).

min2(Count, Values) ->
  min2(Count, Values, []).

min2(_, [], Result) ->
  lists:reverse(Result);
min2(Count, [{Value1, Value2}|ValuesTail], Result) ->
  Value3 = case Value1 < Value2 of
    true -> Value1;
    false -> Value2
  end,
  min2(Count - 1, ValuesTail, [Value3|Result]).
