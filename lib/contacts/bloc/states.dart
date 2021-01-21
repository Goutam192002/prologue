abstract class ContactsState {}

class ContactsLoadedState extends ContactsState {
  final double timeTaken; // Time taken to finish sync in seconds
  ContactsLoadedState({this.timeTaken});
}

class Contacts extends ContactsState {}
