-module(task).

-export([d_roll/2]).

d_roll(Count, Values) ->
  d_roll(Count, Values, []).

d_roll(_, [], Result) ->
  lists:reverse(Result);
d_roll(Count, [ValueHead|ValuesTail], Result) ->
  Res1 = erlang:trunc(ValueHead * 6) + 1,
  d_roll(Count - 1, ValuesTail, [Res1|Result]).
