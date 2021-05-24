import 'package:ff_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';


class RecoveryApply extends StatelessWidget {
  static String routeName = '/recovery_apply';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.08,
            ),
            Text(
              'Done!',
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Text('Your application is accepted check your email!'),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Image.asset('assets/images/success.png'),
            SizedBox(
              height: SizeConfig.screenHeight * 0.06,
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: kPrimaryColor)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 6.0),
                  child: Text(
                    'Back to Login Page',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(18.0)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
