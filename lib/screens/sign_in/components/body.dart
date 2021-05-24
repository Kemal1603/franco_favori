import 'package:ff_app/components/social_card.dart';
import 'package:ff_app/constants.dart';
import 'package:ff_app/screens/sign_in/components/sign_in_form.dart';
import 'package:ff_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:ff_app/size_config.dart';

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
                'Welcome back!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              SignForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account? ",
                    style:
                        TextStyle(fontSize: getProportionateScreenWidth(16.0)),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, SignUp.routeName);
                    },
                    child: Text(
                      "Sign UP ",
                      style:
                      TextStyle(fontSize: getProportionateScreenWidth(16.0),
                      color: kPrimaryColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
