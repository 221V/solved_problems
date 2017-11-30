-module(task).

-export([mod_calc/2]).


% task:mod_calc(5, [{"+3"}, {"*7"}, {"+10"}, {"*2"}, {"*3"}, {"+1"}, {"%11"}]).


mod_calc(Number, Values) ->
  mod_calc2(Values, Number).

mod_calc2([], Result) ->
  Result;
mod_calc2([{V}|ValuesTail], Result) ->
  [V1|V2] = V,
  New_Result = mod_calc3(V1,erlang:list_to_integer(V2),Result),
  mod_calc2(ValuesTail, New_Result).

%mod_calc3(Action,V2,Acc) ->
mod_calc3(43,V2,Acc) ->
  % +
  Acc + V2;
mod_calc3(45,V2,Acc) ->
  % -
  Acc - V2;
mod_calc3(42,V2,Acc) ->
  % *
  Acc * V2;
mod_calc3(47,V2,Acc) ->
  % /
  erlang:round(Acc / V2);
mod_calc3(37,V2,Acc) ->
  % %
  Acc rem V2.


