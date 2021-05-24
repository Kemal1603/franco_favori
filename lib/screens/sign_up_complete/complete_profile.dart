import 'package:ff_app/screens/sign_up_complete/components/body.dart';
import 'package:flutter/material.dart';


class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/complete_profile';

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

