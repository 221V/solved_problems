-module(task).

-export([arr_count/3]).


% task:arr_count(10, 3, "3 2 1 2 3 1 1 1 1 3").


arr_count(_VC, Count, Values) ->
  arr_count2(erlang:list_to_binary(Values), Count, []).


arr_count2(<<"">>, _, Result) ->
  [X || {_X0,X} <- Result];
arr_count2(<<V:1/binary, ValuesRest/binary>>, Count, Result) ->
  if V =:= <<" ">> ->
      arr_count2(ValuesRest, Count, Result);
    true ->
      New_Result = case erlang:length(Result) =:= Count of
        true ->
          [arr_count3(V,X,Y) || {X,Y} <- Result];
        _ ->
          R1 = [D || {_D0,D} <- Result],
          case lists:member(V,R1) of
            true ->
              [arr_count3(V,X,Y) || {X,Y} <- Result];
            _ ->
              [{V,1}|Result]
          end
      end,
      arr_count2(ValuesRest, Count, New_Result)
  end.


%arr_count3(V,X,Y) ->
arr_count3(X,X,Y) ->
  {X, Y + 1};
arr_count3(_,X,Y) ->
  {X,Y}.


