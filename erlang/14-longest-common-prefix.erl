-module(common_prefix).
-export([main/1]).
-import(unicode, []).

main(_) ->
    io:format("~p~n", [longest_common_prefix([<<"flower">>, <<"flow">>, <<"fl">>])]),
    io:format("~p~n", [longest_common_prefix([<<"aa">>, <<"ww">>, <<"do">>])]).

longest_common_prefix(Strs) ->
    unicode:characters_to_binary(common_prefix([unicode:characters_to_list(X) || X <- Strs]  )).

common_prefix([]) ->
    [];
common_prefix([Word|Rest]) ->
    common_prefix(Word, Rest).

common_prefix(H, []) -> H;
common_prefix(LeftWord, [RightWord | Rest]) ->
    common_prefix(common_word_prefix(LeftWord, RightWord), Rest).

common_word_prefix([], []) -> [];
common_word_prefix(_, []) -> [];
common_word_prefix([], _) -> [];
common_word_prefix([H1|T1], [H2|T2]) ->
    if 
       H1 =:= H2 -> [H1 | common_word_prefix(T1, T2)];
       true -> []
    end.
  
