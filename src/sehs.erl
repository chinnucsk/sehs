%%%-------------------------------------------------------------------
%%% @author Anton I Alferov <casper@ubca-dp>
%%% @copyright (C) 2012, Anton I Alferov
%%%
%%% Created: 18 Nov 2012 by Anton I Alferov <casper@ubca-dp>
%%%-------------------------------------------------------------------

-module(sehs).

-export([start/0, stop/0]).
-export([listen/1, close/0]).

start() -> application:start(?MODULE).
stop() -> application:stop(?MODULE).

listen(Port) -> sehs_server:listen(Port).
close() -> sehs_server:close().