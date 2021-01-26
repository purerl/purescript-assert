% module Test.Assert
-module(test_assert@foreign).
-export(['assert\''/1, checkThrows/1]).

'assert\''(Message) ->
  fun (Success) ->
    fun () ->
      case Success of
        false -> erlang:error(Message);
        true -> unit
      end
    end
  end.

checkThrows(F) ->
  fun () ->
    try
      F(unit),
      false
    catch
      _ -> true
    end
  end.
