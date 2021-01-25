import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prologue/core/components/full_width_button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
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
                  Text("+91"),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Mobile Number"),
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
          ),
        ),
      ),
    );
  }
}
