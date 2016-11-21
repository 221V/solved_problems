-module(task).

-export([vc/2]).

vc(Count, Values) ->
  vc(Count, Values, [], <<"aouiey">>).

vc(_, [], Result, _) ->
  lists:reverse(Result);
vc(Count, [ValueHead|ValuesTail], Result, Symbols) ->
  vc(Count - 1, ValuesTail, [lists:flatlength([true || <<Char>> <= ValueHead, binary:match(Symbols,<<Char>>) /= nomatch])|Result], Symbols).
