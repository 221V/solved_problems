-module(task).

-export([avg/2]).

avg(Count, Values) ->
  avg(Count, Values, []).

avg(_, [], Result) ->
  lists:reverse(Result);
avg(Count, [ValueHead|ValuesTail], Result) ->
  Res1 = avg_(ValueHead, 0, 0),
  avg(Count - 1, ValuesTail, [erlang:integer_to_binary(Res1)|Result]).

avg_([], Count, Sum) ->
  erlang:round(Sum / Count);
avg_([AHead|ATail], Count, Sum) ->
  avg_(ATail, Count + 1, Sum + AHead).
