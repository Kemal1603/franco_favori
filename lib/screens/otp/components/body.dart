import 'package:ff_app/constants.dart';
import 'package:ff_app/screens/otp/components/otp_form.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25.0)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Text(
                'OTP Verification',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(23),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('We sent code to your phone'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('This code will expired in '),
                  TweenAnimationBuilder(tween: Tween(begin: 60.0, end: 0.0),
                      duration: Duration(seconds: 60), builder: (context, value, child){
                    return Text('${value.round()} second', style: TextStyle(color: kPrimaryColor),);
                      })
                ],
              ),
              OTPForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Text('Resend Code',
              style: TextStyle(
                decoration: TextDecoration.underline
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
