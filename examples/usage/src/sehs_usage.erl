%%%-------------------------------------------------------------------
%%% Created : 27 Oct 2012 by Anton I Alferov <casper@ubca-dp>
%%%-------------------------------------------------------------------

-module(sehs_usage).

-export([start/0, stop/0]).

-export([listen/1, close/0]).
-export([set_handler/1]).

-export([handle_request/2]).
-export([set_log_file/1, log_report/1]).

-define(Headers, "Content-Type: text/plain; charset=\"utf-8\"\r\n").

start() -> application:start(?MODULE).
stop() -> application:stop(?MODULE).

listen(Port) -> gen_server:call(?MODULE, {listen, Port}).
close() -> gen_server:call(?MODULE, close).

set_handler(Handler) -> gen_server:call(?MODULE, {set_handler, Handler}).

handle_request(Rid, Request) ->
	io:format("Request: ~p ~p~n", [Rid, Request]),
	{ok, {?Headers, "OK"}}.

set_log_file(FileName) -> io:format("Set log file: ~p~n", [FileName]).
log_report(Report) -> io:format("~p ~ts~n",
	[calendar:local_time(), list_to_binary(Report)]).
