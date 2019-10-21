-module(u10).
-compile([export_all, nowarn_export_all]).

% get 10 urls from google search by request "форум програмістів"
% https://replace.org.ua/topic/998/

do() ->
  ssl:start(),
  %inets:start(),
  application:start(inets),
  
  get_data().

get_data() ->
  Part = <<"форум програмістів"/utf8>>,
  Url = "https://www.google.com.ua/search?hl=uk&q=" ++ escape_uri(Part),
  %io:format("~p~n",[escape_uri(Part)]),
  Headers = [{"Host", "www.google.com.ua\r\n"},
             {"User-Agent", "Mozilla/5.0 (X11; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0\r\n"},
             {"Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n"},
             {"Accept-language", "uk,uk_UA\r\n"}, {"Cookie", "\r\n"}, {"Connection", "keep-alive\r\n"},
             {"Upgrade-Insecure-Requests", "1\r\n"}, {"Cache-Control", "max-age=0\r\n"}],
  case httpc:request(get, {Url, Headers}, [{ssl,[{verify,0}]}], []) of
    {ok,{_Status, _Headers , Content}} ->
      %parse_urls1(Content);
      parse_urls2(Content);
    _ ->
      get_data()
  end.

parse_urls1(Data) ->
  Regex = "<div class=\"r\"><a href=\"([^\"]*)\".*?<h3.*?>(.*?)<\/h3>.*?<\/a>",
  case re:run(Data, Regex, [ global, {capture, all, list}]) of
    { match, MatchList } ->
      lists:foreach(
        fun(El) ->
          El3 = unicode:characters_to_binary( lists:nth(3, El), utf8, latin1), % names
          El2 = unicode:characters_to_binary( lists:nth(2, El), utf8, latin1), % urls
          io:format("~ts~n", [El2]),
          io:format("~ts~n", [El3]),
          %io:format("~ts~n", [El])
          %io:format("~ts~n", [unicode:characters_to_binary([El], utf8, latin1)])
          
          file:write_file("top10_names.txt", io_lib:fwrite("~s", [unicode:characters_to_binary([lists:nth(3, El), "\n"], utf8, latin1)]), [append]),
          file:write_file("top10_urls.txt", io_lib:fwrite("~s", [unicode:characters_to_binary([lists:nth(2, El), "\n"], utf8, latin1)]), [append])
        end,
        MatchList);
  NoMatch ->
    io:format("Nothing found: ~p~n", [NoMatch])
  end.

% mask for search
% <div class="r"><a href="https://replace.org.ua/" onmousedown="return rwt(this,'','','','1','AOvVaw330b2J7_UJPUW_UVnlZHvp','','28ahUKEiorY-Xv6zlAhXFcJoKHUUOBGMsFjAAegQIABAB','','',event)"><h3 class="LC20lb">Український форум програмістів</h3><br><div class="TbwUpd"><cite class="iUh30">https://replace.org.ua</cite></div></a>

parse_urls2(Content) -> parse_urls2( unicode:characters_to_list([Content], utf8), 0, []).

%parse_urls2(Content, Type, Acc) ->
parse_urls2([], _, _) ->
  ssl:stop(),
  %inets:stop(),
  application:stop(inets),
  ok;
parse_urls2([60,100,105,118,32,99,108,97,115,115,61,34,114,34,62,60,
  97,32,104,114,101,102,61,34|T], 0, Acc) -> parse_urls2(T, 1, Acc); % "<div class=\"r\"><a href=\""
parse_urls2([_|T], 0, Acc) -> parse_urls2(T, 0, Acc);
parse_urls2([34|T], 1, Acc) -> % "\""
  Z0 = lists:reverse(Acc),
  Z = unicode:characters_to_binary(Z0, utf8, latin1), % url
  io:format("~ts~n", [Z]),
  file:write_file("top10_urls.txt", io_lib:fwrite("~s", [unicode:characters_to_binary([Z, "\n"], latin1, latin1)]), [append]),
  parse_urls2(T, 2, []);
parse_urls2([H|T], 1, Acc) -> parse_urls2(T, 1, [H|Acc]);
parse_urls2([60,104,51,32,99,108,97,115,115,61,34,76,67,50,48,108,98,
  34,62|T], 2, Acc) -> parse_urls2(T, 3, Acc); % "<h3 class=\"LC20lb\">"
parse_urls2([_|T], 2, Acc) -> parse_urls2(T, 2, Acc);
parse_urls2([60,47,104,51,62|T], 3, Acc) -> % "</h3>"
  Z0 = lists:reverse(Acc),
  Z = unicode:characters_to_binary(Z0, utf8, latin1), % name
  io:format("~ts~n", [Z]),
  file:write_file("top10_names.txt", io_lib:fwrite("~s", [unicode:characters_to_binary([Z, "\n"], latin1, latin1)]), [append]),
  parse_urls2(T, 0, []);
parse_urls2([H|T], 3, Acc) -> parse_urls2(T, 3, [H|Acc]).


escape_uri(<<C, Cs/binary>>) when C >= $a, C =< $z -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C >= $A, C =< $Z -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C >= $0, C =< $9 -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C =:= 32 -> <<"+", (escape_uri(Cs))/binary>>; % space to +
escape_uri(<<C, Cs/binary>>) when C =:= $- -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C =:= $_ -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C =:= 46 -> <<C, (escape_uri(Cs))/binary>>; % .
escape_uri(<<C, Cs/binary>>) when C =:= $! -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C =:= $~ -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C =:= $* -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C =:= 39 -> <<C, (escape_uri(Cs))/binary>>; % '
escape_uri(<<C, Cs/binary>>) when C =:= $( -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) when C =:= $) -> <<C, (escape_uri(Cs))/binary>>;
escape_uri(<<C, Cs/binary>>) -> <<(escape_byte(C))/binary, (escape_uri(Cs))/binary>>;
escape_uri(<<>>) -> <<>>.
hex_octet(N) when N =< 9 -> $0 + N;
hex_octet(N) when N =< 15 -> $a + N - 10.
escape_byte(C) -> <<"%", (hex_octet(C bsr 4)), (hex_octet(C band 15))>>.

