-module(task).

-export([sq_root/2]).


% task:sq_root(3, [{150, 0}, {5, 1}, {10, 3}]).


sq_root(Count, Values) ->
  sq_root2(Values, Count, []).

sq_root2([], _, Result) ->
  lists:reverse(Result);
sq_root2([{V1,V2}|ValuesTail], Count, Result) ->
  New_Result = sq_root3(V1,V2,1),
  sq_root2(ValuesTail, Count - 1, [New_Result|Result]).


%sq_root3(Value, Count, Result) ->
sq_root3(_,0,Result) ->
  Result;
sq_root3(Value, Count, Result) ->
  D = Value / Result,
  %Diff = erlang:abs(Result - D), % difference, less or bigger?
  Result_New = (Result + D) / 2,
  sq_root3(Value, Count - 1, Result_New).

