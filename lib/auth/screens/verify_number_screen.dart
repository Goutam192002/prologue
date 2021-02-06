import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:prologue/core/components/full_width_button.dart';

class VerifyNumberScreen extends StatelessWidget {
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
          onChanged: (value) {},
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
        Center(
          child: FlatButton(
            child: Text("Resend OTP"),
            onPressed: () {},
          ),
        ),
        Expanded(child: Container()),
        FullWidthButton(
          disabled: true,
          loading: false,
          buttonText: 'VERIFY',
          onTap: () {},
        ),
      ],
    );
  }
}
