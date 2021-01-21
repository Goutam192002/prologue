import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/contacts/bloc/bloc.dart';
import 'package:prologue/contacts/bloc/states.dart';

class SyncContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: BlocBuilder<ContactsBloc, ContactsState>(
            builder: (BuildContext context, ContactsState state) {
              if (state is ContactsLoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Contacts synced"),
                    Text("Time taken: ${state.timeTaken.toString()}s")
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("Syncing your contacts")],
              );
            },
          ),
        ),
      ),
    );
  }
}
