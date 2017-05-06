-module(task).

-export([median3/2]).

median3(Count, Values) ->
  median3(Count, Values, []).

median3(_, [], Result) ->
  lists:reverse(Result);
median3(Count, [{Value1, Value2, Value3}|ValuesTail], Result) ->
  median3(Count - 1, ValuesTail, [median_3(Value1, Value2, Value3)|Result]).

median_3(A,B,C) when A < B, A > C; A > B, A < C ->
  A;
median_3(A,B,C) when B < A, B > C; B > A, B < C ->
  B;
median_3(A,B,C) when C < A, C > B; C > A, C < B ->
  C;
median_3(_,_,_) -> <<"null">>.
