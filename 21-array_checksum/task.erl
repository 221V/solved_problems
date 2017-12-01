-module(task).

-export([checksum1/2]).


% task:checksum1(6, [3, 1, 4, 1, 5, 9]).


checksum1(Count, Values) ->
  checksum12(Values, Count, 0).

checksum12([], _, Result) ->
  Result;
checksum12([V|ValuesTail], Count, Result) ->
  Result0 = (Result + V) * 113,
  New_Result = if Result0 < 10000007 ->
      Result0;
    true ->
      Result0 rem 10000007
  end,
  checksum12(ValuesTail, Count - 1, New_Result).




