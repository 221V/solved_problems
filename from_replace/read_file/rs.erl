-module(rs).
-compile([export_all, nowarn_export_all]).

%do(FileName) ->
do() ->
  %{ok, File} = file:open(FileName, [read]),
  {ok, File} = file:open("file.txt", [read]),
  do2(File).

do2(File) ->
  case io:get_line(File, "") of
    eof ->
      file:close(File), io:format("all ok!~n",[]);
    Line ->
      Z = string:split(Line, "	\n", all), % second argument also can be [9] , because code of tab-symbol = 9 , so "	" =:= [9] equals true, "\n" =:= [10]
      do3(Z, 0),
      do2(File)
  end.

do3([],_) -> ok;
do3([[]|T], N) -> do3(T, N);
do3([H|T], 0) ->
  w2f(["Street: ", H, "\n"]),
  do3(T, 1);
do3([H|_T], 1) ->
  w2f(["House: ", H, "\n\n"]), ok.

w2f(V) -> file:write_file("data2.txt", io_lib:fwrite("~s", [unicode:characters_to_binary(V, utf8, latin1)]), [append]).


