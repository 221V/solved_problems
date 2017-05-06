-module(task).

-export([sum_digit/2]).

sum_digit(Count, Values) ->
  sum_digit(Count, Values, []).

sum_digit(_, [], Result) ->
  lists:reverse(Result);
sum_digit(Count, [{Value1, Value2, Value3}|ValuesTail], Result) ->
  Res1 = digit_sum(Value1 * Value2 + Value3, 10),
  sum_digit(Count - 1, ValuesTail, [Res1|Result]).

digit_sum(A, B) ->
  digit_sum(A, B, 0).

digit_sum(0, _, Res) ->
  Res;
digit_sum(A, B, Res) when A < B ->
  Res + A;
digit_sum(A, B, Res) ->
  digit_sum(A div B, B, Res + (A rem B)).
