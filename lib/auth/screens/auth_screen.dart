import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/auth/bloc/bloc.dart';
import 'package:prologue/auth/bloc/states.dart';
import 'package:prologue/auth/components/mobile_number_form.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, AuthState state) {
              return MobileNumberForm(
                key: UniqueKey(),
                countryCode: state.countryCode,
                mobileNumber: state.mobileNumber,
              );
            },
          ),
        ),
      ),
    );
  }
}
