import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:prologue/contacts/bloc/events.dart';
import 'package:prologue/contacts/bloc/states.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final Dio _dio = new Dio();
  ContactsBloc() : super(Contacts());

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if (event is StartSync) {
      var start = DateTime.now();
      List<Contact> contacts = await FlutterContacts.getFullContacts(
        deduplicateEmailsAndPhones: true,
        withPhotos: false,
      );
      var phoneNumbersNamesMap = {};
      contacts.forEach((contact) {
        contact.phones.forEach((phone) {
          phoneNumbersNamesMap[phone.normalizedNumber] = contact.displayName;
        });
      });
      var response = await _dio
          .post("http://9bd3d9f52f53.ngrok.io/api/v1/rosters/sync", data: {
        "username": "1",
        "mobile_numbers_names_map": phoneNumbersNamesMap
      });
      print(response.data);
      var end = DateTime.now();
      var timeTaken =
          (end.millisecondsSinceEpoch - start.millisecondsSinceEpoch) / 1000;
      yield ContactsLoadedState(timeTaken: timeTaken);
    } else {
      throw UnimplementedError();
    }
  }
}
