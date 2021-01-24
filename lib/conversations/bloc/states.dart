import 'package:xmpp_stone/xmpp_stone.dart';

abstract class ConversationState {}

class ConverationsUninitialized extends ConversationState {}

class ConversationsLoaded extends ConversationState {
  List<Buddy> conversations;
  ConversationsLoaded(this.conversations);
}
