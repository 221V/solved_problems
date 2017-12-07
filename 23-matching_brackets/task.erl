-module(task).

-export([match_br/2]).


% task:match_br(4, ["(a+[b*c]-{d/3})", "(a + [b * c) - 17]", "(((a * x) + [b] * y) + c", "auf(zlo)men [gy<psy>] four{s}"]).


match_br(Count, Values) ->
  match_br2(Values, Count, []).

match_br2([], _, Result) ->
  lists:reverse(Result);
match_br2([V|ValuesTail], Count, Result) ->
  Filter_B = filter_br(V),
  %io:format("~p~n",[Filter_B]),
  
  Analyze = fun(Item, Acc) ->
    case Acc of
      [err] -> Acc;
      [] ->
        %no waiting brackets in Acc
        case get_close_by_open_code(Item) of
          err -> [err];
          Close -> [Close]
        end;
      _ ->
        %we have waiting brackets in Acc
        case get_close_by_open_code(Item) of
          err ->
            %we have one close bracket
            CloseN = get_close_by_code(Item),
            [Acc_H|Acc_T] = Acc,
            if CloseN =:= Acc_H ->
                case Acc_T of
                  [] -> [];
                  _ -> Acc_T
                end;
              true -> [err]
            end;
          Close ->
            %we have one open bracket
            [Close|Acc]
        end
    end
  end,
  
  Wait = [],
  
  New_Result = case lists:foldl(Analyze, Wait, Filter_B) of
    [] -> 1;
    _ -> 0
  end,
  
  match_br2(ValuesTail, Count - 1, [New_Result|Result]).


filter_br(V) ->
  % filter brackets
  
  % ( 40
  % ) 41
  % [ 91
  % ] 93
  % { 123
  % } 125
  % < 60
  % > 62
  
  % for better performance needs use tail recursion,
  % but list comprehensions are so impressive
  [X || X <- V, Y <- "()[]{}<>", X =:= Y].


get_close_by_open_code(40) -> ")";
get_close_by_open_code(60) -> ">";
get_close_by_open_code(91) -> "]";
get_close_by_open_code(123) -> "}";
get_close_by_open_code(_) -> err.

get_close_by_code(41) ->
  %"("
  ")";
get_close_by_code(62) ->
  %"<"
  ">";
get_close_by_code(93) ->
  %"["
  "]";
get_close_by_code(125) ->
  %"{"
  "}";
get_close_by_code(_) -> err.


