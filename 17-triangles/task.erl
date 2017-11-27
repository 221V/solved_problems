-module(task).

-export([is_triangle/2]).


is_triangle(Count, Values) ->
  is_triangle2(Count, Values, []).

is_triangle2(_, [], Result) ->
  lists:reverse(Result);
is_triangle2(Count, [{V1, V2, V3}|ValuesTail], Result) when V1 >= V2 + V3; V2 >= V1 + V3; V3 >= V1 + V2 ->
  is_triangle2(Count - 1, ValuesTail, [0|Result]);
is_triangle2(Count, [{V1, V2, V3}|ValuesTail], Result) ->
  is_triangle2(Count - 1, ValuesTail, [1|Result]).

