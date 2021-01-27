import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prologue/chat/screen.dart';

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
      home: ChatScreen(),
    );
  }
}
