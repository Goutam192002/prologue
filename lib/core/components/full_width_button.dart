import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;

  const FullWidthButton({Key key, this.buttonText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      buttonColor: Colors.greenAccent,
      child: RaisedButton(
        onPressed: this.onTap,
        child: Text(
          this.buttonText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
