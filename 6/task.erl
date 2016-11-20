-module(task).

-export([maxmin/1]).

maxmin(Values) ->
  [ValueHead|_] = Values,
  maxmin(Values,ValueHead,ValueHead).

maxmin([], Max, Min) ->
  %%lists:append([[Max], [Min]]);
  [Max|[Min]];
maxmin([ValueHead|ValuesTail], Max, Min) ->
  Max2 = case Max > ValueHead of
    true -> Max;
    false -> ValueHead
  end,
  Min2 = case Min < ValueHead of
    true -> Min;
    false -> ValueHead
  end,
  maxmin(ValuesTail, Max2, Min2).
