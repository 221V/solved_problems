-module(dd).
-compile([export_all, nowarn_export_all]).

% beauty-print data difference, task from "форум програмістів"
% https://replace.org.ua/topic/1021/

% do(1571882864) % timestamp
% do({ {2018, 3, 1}, {5, 21, 51} }) % { {Year, Month, Day}, {Hour, Minute, Second} }
do(T0) when is_integer(T0) ->
  T1 = erlang:system_time(second), % second | millisecond | microsecond | nanosecond ...
  do2(T1 - T0);
do({{_Year, _Month, _Day},{_Hour, _Minute, _Second}} = T0) ->
  T1 = calendar:now_to_datetime(erlang:timestamp()), % { {Year, Month, Day}, {Hour, Minute, Second} }
  Z = calendar:time_difference(T0, T1),
  do3(Z);
do(_) -> io:format("~ts~n",[<<"Ви щось переплутали!"/utf8>>]).


do2(T) when is_integer(T) andalso T < 0 ->
  io:format("~ts~n",[<<"Назад у майбутнє!"/utf8>>]);
do2(T) when T =:= 0 ->
  io:format("~ts~n",[<<"Вітання Вам у моменті \"зараз\"!"/utf8>>]);
do2(T) ->
  Z = calendar:seconds_to_daystime(T), % {Days, {Hour, Minute, Second}}
  do3(Z). % helper function
  % here we also can use next functions:
  % calendar:gregorian_seconds_to_datetime(Seconds)
  % calendar:datetime_to_gregorian_seconds({ {Year, Month, Day}, {Hour, Minute, Second} })
  % calendar:time_difference(T1, T2)


do3({Days, {_, _, _}}) when Days < 0 ->
  io:format("~ts~n",[<<"Назад у майбутнє!"/utf8>>]);
do3({0, {0, 0, 0}}) ->
  io:format("~ts~n",[<<"Вітання Вам у моменті \"зараз\"!"/utf8>>]);
do3({0, {0, 0, Second}}) ->
  V = num2word(Second, [<<"секунду"/utf8>>, <<"секунди"/utf8>>, <<"секунд"/utf8>>]),
  io:format("~p ~ts ~ts~n",[Second, V, <<"назад"/utf8>>]);
do3({0, {0, Minute, _}}) ->
  V = num2word(Minute, [<<"хвилину"/utf8>>, <<"хвилини"/utf8>>, <<"хвилин"/utf8>>]),
  io:format("~p ~ts ~ts~n",[Minute, V, <<"назад"/utf8>>]);
do3({0, {Hour, _, _}}) ->
  V = num2word(Hour, [<<"годину"/utf8>>, <<"години"/utf8>>, <<"годин"/utf8>>]),
  io:format("~p ~ts ~ts~n",[Hour, V, <<"назад"/utf8>>]);
do3({Days, {_Hour, _Minute, _Second}}) when Days < 30 ->
  V = num2word(Days, [<<"день"/utf8>>, <<"дні"/utf8>>, <<"днів"/utf8>>]),
  io:format("~p ~ts ~ts~n",[Days, V, <<"назад"/utf8>>]);
do3({Days, {_Hour, _Minute, _Second}}) when Days >= 30 andalso Days < 365 ->
  M = Days div 30,
  V = num2word(M, [<<"місяць"/utf8>>, <<"місяці"/utf8>>, <<"місяців"/utf8>>]),
  io:format("~p ~ts ~ts~n",[M, V, <<"назад"/utf8>>]);
%do3({Days, {_Hour, _Minute, _Second}}) when Days >= 365 ->
do3({Days, {_Hour, _Minute, _Second}}) ->
  Y = Days div 365,
  V = num2word(Y, [<<"рік"/utf8>>, <<"роки"/utf8>>, <<"років"/utf8>>]),
  io:format("~p ~ts ~ts~n",[Y, V, <<"назад"/utf8>>]).


% num2word(50, ["рік", "роки", "років"]) % ["хвилину", "хвилини", "хвилин"]
num2word(Num, Words) ->
  N0 = Num rem 100,
  N = if N0 > 19 -> N0 rem 10; true -> N0 end,
  case N of
    1 -> lists:nth(1, Words);
    2 -> lists:nth(2, Words);
    3 -> lists:nth(2, Words);
    4 -> lists:nth(2, Words);
    _ -> lists:nth(3, Words)
  end.
  
  
