-module(task).

-export([min3/2]).

min3(Count, Values) ->
  min3(Count, Values, []).

min3(_, [], Result) ->
  lists:reverse(Result);
min3(Count, [ValueHead|ValuesTail], Result) ->
  {Value1, Value2, Value3} = ValueHead,
  ValueMin = mini3(Value1, Value2, Value3),
  min3(Count - 1, ValuesTail, [ValueMin|Result]).

mini3(A,B,C) when A < B, A < C ->
  A;
mini3(A,B,C) when B < A, B < C ->
  B;
mini3(A,B,C) when C < A, C < B ->
  C;
mini3(_,_,_) -> 0.
