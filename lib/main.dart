import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/contacts/bloc/bloc.dart';
import 'package:prologue/contacts/bloc/events.dart';
import 'package:prologue/contacts/sync.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prologue',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<ContactsBloc>(
        create: (context) => ContactsBloc()..add(StartSync()),
        child: SyncContacts(),
      ),
    );
  }
}
