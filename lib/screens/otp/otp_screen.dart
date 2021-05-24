import 'package:ff_app/screens/otp/components/body.dart';
import 'package:flutter/material.dart';




class OTPScreen extends StatelessWidget {

  static String routeName = '/otp_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 230.0),
          child: Text('OTP'),
        ),
    ),

      body: Body(),
    );
  }
}
