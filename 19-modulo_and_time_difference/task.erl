-module(task).

-export([time_diff/2]).


% task:time_diff(3, [{1, 0, 0, 0, 2, 3, 4, 5}, {5, 3, 23, 22, 24, 4, 20, 45}, {8, 4, 6, 47, 9, 11, 51, 13}]).


time_diff(Count, Values) ->
  time_diff2(Count, Values, []).

time_diff2(_, [], Result) ->
  lists:reverse(Result);
time_diff2(Count, [NR_Values|ValuesTail], Result) ->
  NR = time_diff3(NR_Values),
  time_diff2(Count - 1, ValuesTail, [NR|Result]).

time_diff3({Day1, Hour1, Minit1, Sec1, Day2, Hour2, Minit2, Sec2}) ->
  % datetime() = {date(), time()}
  % date() = {year(), month(), day()}
  % time() = {hour(), minute(), second()}
  calendar:time_difference({{0,1,Day1},{Hour1, Minit1, Sec1}},{{0,1,Day2},{Hour2, Minit2, Sec2}}). %{Days, Time} %{days, {hours, minutes, seconds}


