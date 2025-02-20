-module (owl_xmpp_stanza).
-export ([
		make_id/1,
		id/1, set_id/2,
		to/1, set_to/2,
		from/1, set_from/2
	]).

make_id( [ FirstProp | Props ] ) ->
	iolist_to_binary( [
			integer_to_list( erlang:phash2( FirstProp ) )
			| [
					begin [$:, integer_to_list( erlang:phash2( Prop ) )] end
					|| Prop <- Props
				]
		]).

id( Xml ) ->
	exp_node_attrs:attr( <<"id">>, Xml ).

set_id( ID, Xml ) when ID == undefined orelse is_binary( ID ) ->
	exp_node_attrs:set_attr( <<"id">>, ID, Xml ).


from( Xml ) ->
	owl_xmpp_jid:b2j( exp_node_attrs:attr( <<"from">>, Xml ) ).

set_from( From, Xml ) ->
	FromBin = owl_xmpp_jid:j2b( From ),
	exp_node_attrs:set_attr( <<"from">>, FromBin, Xml ).

to( Xml ) ->
	owl_xmpp_jid:b2j( exp_node_attrs:attr( <<"to">>, Xml ) ).

set_to( To, Xml ) ->
	ToBin = owl_xmpp_jid:j2b( To ),
	exp_node_attrs:set_attr( <<"to">>, ToBin, Xml ).
