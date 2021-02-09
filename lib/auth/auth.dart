import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/auth/bloc/bloc.dart';
import 'package:prologue/auth/bloc/states.dart';
import 'package:prologue/auth/screens/mobile_number_screen.dart';
import 'package:prologue/auth/screens/verify_number_screen.dart';

class AuthModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, AuthState state) {
              if (state is WaitingForVerification) {
                return VerifyNumberScreen(
                  mobileNumber: state.mobileNumber,
                  error: state.error,
                  loading: state.authStatus == AuthStatus.LOADING,
                );
              }
              return MobileNumberScreen(
                key: UniqueKey(),
                loading: state.authStatus == AuthStatus.LOADING,
              );
            },
          ),
        ),
      ),
    );
  }
}
