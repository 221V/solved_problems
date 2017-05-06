-module(task).

-export([ar_pr/2]).

ar_pr(Count, Values) ->
  ar_pr(Count, Values, []).

ar_pr(_, [], Result) ->
  lists:reverse(Result);
ar_pr(Count, [{V1, V2, V3}|ValuesTail], Result) ->
  Res1 = sum_pr(V3, V1, V2, 0),
  ar_pr(Count - 1, ValuesTail, [erlang:integer_to_binary(Res1)|Result]).

sum_pr(0, _, _, Sum) ->
  Sum;
sum_pr(Count, Begin, Step, Sum) ->
  if
    Count > 1 ->
      sum_pr(Count - 1, Begin, Step, Sum + (Begin + Step * (Count - 1)));
    true ->
      sum_pr(Count - 1, Begin, Step, Sum + Begin)
  end.
