import 'package:flutter/material.dart';
import 'package:prologue/core/components/full_width_button.dart';

class MobileNumberForm extends StatefulWidget {
  MobileNumberForm({
    Key key,
    @required this.countryCode,
    @required this.mobileNumber,
  }) : super(key: key);

  final String countryCode;
  final String mobileNumber;

  @override
  _MobileNumberFormState createState() => _MobileNumberFormState();
}

class _MobileNumberFormState extends State<MobileNumberForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNumberController;
  bool valid = false;

  @override
  void initState() {
    super.initState();
    mobileNumberController = TextEditingController(text: widget.mobileNumber);
    mobileNumberController.addListener(() {
      setState(() {
        valid = mobileNumberController.text.length == 10;
      });
    });
    super.initState();
  }

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
            Text(widget.countryCode),
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
                controller: mobileNumberController,
              ),
            ),
          ],
        ),
        Expanded(child: Container()),
        FullWidthButton(
          onTap: valid ? () {} : null,
          buttonText: "NEXT",
        ),
      ],
    );
  }
}
