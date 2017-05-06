-module(task).

-export([bmIndex/2]).

bmIndex(Count, Values) ->
  bmIndex(Count, Values, []).

bmIndex(_, [], Result) ->
  lists:reverse(Result);
bmIndex(Count, [{Value1, Value2}|ValuesTail], Result) ->
  BMI = bm_Index(erlang:round(Value1 / (Value2 * Value2) * 10) / 10),
  bmIndex(Count - 1, ValuesTail, [BMI|Result]).

bm_Index(A) when A < 18.5 ->
  <<"under">>;
bm_Index(A) when A < 25.0, A >= 18.5 ->
  <<"normal">>;
bm_Index(A) when A < 30.0, A >= 25.0 ->
  <<"over">>;
bm_Index(_) -> <<"fat">>.
