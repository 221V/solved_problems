-module(task).

-export([wsd/2]).

wsd(Count, Values) ->
  wsd(Count, Values, []).

wsd(_, [], Result) ->
  lists:reverse(Result);
wsd(Count, [ValueHead|ValuesTail], Result) ->
  Res1 = w_sd(ValueHead, erlang:byte_size(erlang:integer_to_binary(ValueHead))),
  wsd(Count - 1, ValuesTail, [erlang:integer_to_binary(Res1)|Result]).

w_sd(A, S) ->
  w_sd(A, S, 0).

w_sd(0, _, Res) ->
  Res;
w_sd(A, _, Res) when A < 10 ->
  Res + A * 1;
w_sd(A, S, Res) ->
  w_sd(A div 10, S - 1, Res + (A rem 10) * S).
