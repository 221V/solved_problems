-module(task).

-export([f_to_c/2, c_to_f/2]).

f_to_c(Count, Values) ->
  f_to_c(Count, Values, []).

f_to_c(_, [], Result) ->
  lists:reverse(Result);
f_to_c(Count, [ValueHead|ValuesTail], Result) ->
  f_to_c(Count - 1, ValuesTail, [erlang:round((5/9) * (ValueHead - 32))|Result]).

c_to_f(Count, Values) ->
  c_to_f(Count, Values, []).

c_to_f(_, [], Result) ->
  lists:reverse(Result);
c_to_f(Count, [ValueHead|ValuesTail], Result) ->
  c_to_f(Count - 1, ValuesTail, [erlang:round(((9/5) * ValueHead) + 32)|Result]).
