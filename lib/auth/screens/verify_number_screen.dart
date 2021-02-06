import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:prologue/auth/bloc/bloc.dart';
import 'package:prologue/auth/bloc/events.dart';
import 'package:prologue/core/components/full_width_button.dart';

class VerifyNumberScreen extends StatefulWidget {
  VerifyNumberScreen({
    @required this.mobileNumber,
    this.error = '',
    this.loading = false,
  });

  final String mobileNumber;
  final String error;
  final bool loading;

  @override
  _VerifyNumberScreenState createState() => _VerifyNumberScreenState();
}

class _VerifyNumberScreenState extends State<VerifyNumberScreen> {
  String code = '';
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Verify it's you",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Enter the 4 digit otp received on your mobile number...",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 32),
        PinCodeTextField(
          appContext: context,
          length: 4,
          onChanged: (String value) {
            setState(() {
              disabled = value.length != 4;
              code = value;
            });
          },
          backgroundColor: Colors.transparent,
          keyboardType: TextInputType.number,
          enablePinAutofill: true,
          autoDismissKeyboard: true,
          useHapticFeedback: true,
          autoFocus: true,
          pinTheme: PinTheme(
            activeColor: Colors.white,
            selectedColor: Colors.greenAccent,
            inactiveColor: Colors.white24,
          ),
          textStyle: TextStyle(color: Colors.white),
        ),
        Text(
          widget.error ?? '',
          style: TextStyle(color: Colors.red),
        ),
        // Center(
        //   child: FlatButton(
        //     child: Text("Resend OTP"),
        //     onPressed: () {},
        //   ),
        // ),
        Expanded(child: Container()),
        FullWidthButton(
          disabled: disabled,
          loading: widget.loading,
          buttonText: 'VERIFY',
          onTap: () {
            BlocProvider.of<AuthBloc>(context).add(
              VerifyMobileNumber(
                mobileNumber: widget.mobileNumber,
                code: code,
              ),
            );
          },
        ),
      ],
    );
  }
}
