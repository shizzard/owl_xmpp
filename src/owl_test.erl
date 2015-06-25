-module (owl_test).
-export ([prepare/0]).
-include_lib("eunit/include/eunit.hrl").

prepare() ->
	% application:start(sasl),
	catch lager:start(),
	ok.

stream_tcp_tests_test() ->
	owl_stream_tcp_test:test().


session_tests_test() ->
	owl_session_test:test().




