import 'package:ff_app/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';


class SignUp extends StatelessWidget {
  static String routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 230.0),
          child: Text('Sign Up'),
        ),
      ),
      body: Body(),
    );
  }
}
