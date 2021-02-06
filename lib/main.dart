import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prologue/auth/bloc/bloc.dart';

import 'auth/auth.dart';
import 'auth/bloc/events.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prologue',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.greenAccent,
        ),
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc()..add(InitAuth()),
        child: AuthModule(),
      ),
    );
  }
}
