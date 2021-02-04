import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/auth/bloc/bloc.dart';
import 'package:prologue/auth/bloc/states.dart';
import 'package:prologue/core/components/full_width_button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, AuthState state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your mobile number",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Please enter your 10 digit mobile number below..",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Text(state.countryCode),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          key: UniqueKey(),
                          autofocus: true,
                          maxLengthEnforced: true,
                          initialValue: state.mobileNumber,
                          maxLength: 10,
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            counterText: '',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  FullWidthButton(
                    onTap: () {},
                    buttonText: "NEXT",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
