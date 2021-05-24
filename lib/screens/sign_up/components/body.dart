import 'package:ff_app/components/social_card.dart';
import 'package:ff_app/screens/sign_up/components/registration_form.dart';
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
                'Create a new account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              RegistrationForm(),
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

            ],
          ),
        ),
      ),
    );
  }
}
