import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prologue/auth/bloc/bloc.dart';
import 'package:prologue/auth/bloc/events.dart';
import 'package:prologue/core/components/full_width_button.dart';
import 'package:sms_autofill/sms_autofill.dart';

class MobileNumberScreen extends StatefulWidget {
  MobileNumberScreen({
    Key key,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  @override
  _MobileNumberScreenState createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNumberController;
  bool disabled = true;
  String countryCode = '+91';

  @override
  void initState() {
    super.initState();
    mobileNumberController = TextEditingController(text: '');
    mobileNumberController.addListener(() {
      setState(() {
        disabled = mobileNumberController.text.length != 10;
      });
    });
    autoFillMobileNumber();
  }

  void autoFillMobileNumber() async {
    String result = await SmsAutoFill().hint;
    setState(() {
      countryCode = result.substring(0, result.length - 10);
    });
    mobileNumberController.text = result.substring(result.length - 10);
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
                controller: mobileNumberController,
              ),
            ),
          ],
        ),
        Expanded(child: Container()),
        FullWidthButton(
          disabled: disabled,
          loading: widget.loading,
          onTap: () {
            BlocProvider.of<AuthBloc>(context).add(
              Authenticate(
                '$countryCode${mobileNumberController.text}',
              ),
            );
          },
          buttonText: "NEXT",
        ),
      ],
    );
  }
}
