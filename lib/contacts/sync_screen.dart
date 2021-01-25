import 'package:flutter/material.dart';

class SyncContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/logo.png')),
            SizedBox(height: 36),
            Text(
              "Getting Ready...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 48),
            Container(width: 256, child: LinearProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
