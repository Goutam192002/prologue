import 'package:flutter/material.dart';
import 'package:prologue/core/components/full_width_button.dart';

class MobileNumberForm extends StatelessWidget {
  MobileNumberForm({
    Key key,
    @required this.countryCode,
    @required this.mobileNumber,
  }) : super(key: key);

  final String countryCode;
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
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
            Text(countryCode),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                autofocus: true,
                maxLengthEnforced: true,
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
  }
}
