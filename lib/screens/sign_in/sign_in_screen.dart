import 'package:ff_app/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 230.0),
          child: Text('Sign In'),
        ),
      ),
      body: Body(),
    );
  }
}
