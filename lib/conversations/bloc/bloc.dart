import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/conversations/bloc/events.dart';
import 'package:prologue/conversations/bloc/states.dart';
import 'package:xmpp_stone/xmpp_stone.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationState> {
  Connection _connection;

  ConversationsBloc(ConversationState initialState, this._connection)
      : super(initialState);

  @override
  Stream<ConversationState> mapEventToState(ConversationsEvent event) async* {
    if (event is InitConnection) {
      _connection.connect();
    } else if (event is GetConversations) {
      List<Buddy> roster =
          RosterManager.getInstance(this._connection).getRoster();
      print(roster);
      yield ConversationsLoaded(roster);
    }
  }
}
