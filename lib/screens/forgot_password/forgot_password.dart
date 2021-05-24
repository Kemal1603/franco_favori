import 'package:ff_app/screens/forgot_password/recovery_accepted.dart';
import 'package:ff_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../size_config.dart';


class ForgotPassword extends StatefulWidget {
  static String routeName = '/forgot_password';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = 'tony@starkindustries.com';
  bool isCorrectEmail = true;
  bool formFilled;

  void isCorrectEmailSwitcher(String userInput) {

    setState(() {
      isCorrectEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(userInput) ? true : false;
      formFilled = isCorrectEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 200.0),
          child: Text('Password recovery',
          style: TextStyle(
            fontSize: 13.0
          ),),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25.0)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Text(
                  'Enter Your Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.18,
                ),

                TextFormField(
                  onChanged: (value) {
                    email = value;
                    isCorrectEmailSwitcher(email);
                  },
                  style: TextStyle(
                    color: isCorrectEmail ? null : Colors.red,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: isCorrectEmail ? 'Email' : 'Incorrect Email',
                    hintText: 'Enter Your Email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        'assets/icons/Mail.svg',
                        color: isCorrectEmail ? null : Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.13,
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
                      if (formFilled){
                        Navigator.pushNamed(context, RecoveryApply.routeName);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 55.0),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(18.0)),
                      ),
                    )),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      style:
                      TextStyle(fontSize: getProportionateScreenWidth(16.0)),
                    ),
                    GestureDetector(
                      onTap: (){
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
