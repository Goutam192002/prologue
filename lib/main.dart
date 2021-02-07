import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prologue/auth/bloc/bloc.dart';
import 'package:prologue/conversations/screen.dart';
import 'package:prologue/splash/screen.dart';

import 'auth/auth.dart';
import 'auth/bloc/events.dart';
import 'auth/bloc/states.dart';

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
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState state) {
            if (state is AuthStateUnknown) {
              return SplashScreen();
            } else if (state is Authenticated) {
              return ConversationsScreen();
            }
            return AuthModule();
          },
        ),
      ),
    );
  }
}
