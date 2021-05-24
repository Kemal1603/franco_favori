import 'package:ff_app/screens/sign_up_complete/components/registration_complete.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25.0)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Complete create an account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(23),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              RegistrationCompleteForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
