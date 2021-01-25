import 'package:flutter/material.dart';
import 'package:prologue/core/components/full_width_button.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "One Last Bit...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "This information will be displayed to your mutual contacts...",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 36),
              Center(
                child: Container(color: Colors.grey, height: 64, width: 64),
              ),
              SizedBox(height: 36),
              TextField(
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Status"),
              ),
              Expanded(child: Container()),
              FullWidthButton(
                onTap: () {},
                buttonText: "NEXT",
              )
            ],
          ),
        ),
      ),
    );
  }
}
