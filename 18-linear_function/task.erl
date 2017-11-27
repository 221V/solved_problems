-module(task).

-export([linear_func/2]).


linear_func(Count, Values) ->
  linear_func2(Count, Values, []).

linear_func2(_, [], Result) ->
  lists:reverse(Result);
linear_func2(Count, [NR_Values|ValuesTail], Result) ->
  NR = linear_func3(NR_Values),
  linear_func2(Count - 1, ValuesTail, [NR|Result]).

%linear_func3({X1, Y1, X2, Y2}) ->
  % Y = A*X + B
  %N1B = fun(A,X,Y) -> Y - A * X end,
  %N1A = fun(B,X,Y) -> (Y - B)/X end,
  %N1AB = fun(X01, Y01, X02, Y02) ->
  %  B01 = Y01 - A * X01,
  %  A01 = (Y02 - B01)/X02,
  
  %  B01 = Y01 - ((Y02 - B01)/X02) * X01, =>> B + ((Y02 - B)/X02) * X01 = Y01 =>> ((B / X01)* X01) + ((Y02 - B)/X02) * X01 = Y01 =>>
  %    (B / X01) + ((Y02 - B)/X02) = Y01/X01 =>> (B * (X02/X01*X02)) + ((Y02 - B)*(X01/X01*X02) = Y01/X01 =>> 
  %    (B * X02) + ((Y02 - B)*X01) = (Y01/X01)*(X01*X02) =>> (B * X02) - B*X01 = (Y01/X01)*(X01*X02) - Y02*X01 =>>
  %    B = ((Y01/X01)*(X01*X02) - Y02*X01)/(X02-X01)
  %    A = (Y02 - (((Y01/X01)*(X01*X02) - Y02*X01)/(X02-X01)))/X02
  
  %  A01 = (Y02 - Y01 + A01 * X01)/X02 =>> A01 * X02 = Y02 - Y01 + (A01 * X01) =>> A01 * (X02 - X01) = Y02 - Y01 =>>
  %    A01 = (Y02 - Y01)/(X02 - X01)
  %  B01 = Y01 - ((Y02 - Y01)/(X02 - X01)) * X01
  %  
linear_func3({_, Y1, _, Y2}) when Y1 =:= 0, Y2 =:= 0 ->
  % we run X
  {0,0};
linear_func3({X1, _, X2, _}) when X1 =:= 0, X2 =:= 0 ->
  % we run Y
  {"any","y = b"};
linear_func3({X1, Y1, X2, Y2}) when X1 =:= X2; Y1 =:= Y2 ->
  {0,"y = b"};
linear_func3({X1, Y1, X2, Y2}) ->
  A = (Y2 - Y1)/(X2 - X1),
  B = Y1 - ((Y2 - Y1)/(X2 - X1)) * X1,
  {erlang:round(A),erlang:round(B)}.

