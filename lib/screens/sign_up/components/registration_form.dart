import 'file:///C:/Users/123/Desktop/Flutter/UDEMY_LAST/udemy/ff_app/lib/screens/sign_up_complete/complete_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';



showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Incorrect Information"),
    content: Text("The forms was filled incorrect"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _email = 'tony@starkindustries.com';
  String _enteredPassword;

  bool isCorrectEmail = true;
  bool isCorrectPassword = true;
  bool isPasswordsMatch = true;


  void isCorrectEmailSwitcher(String userInput) {

   setState(() {
     isCorrectEmail = RegExp(
         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
         .hasMatch(userInput) ? true : false;
   });
  }

  void isCorrectPasswordSwitcher(String userInput) {

    setState(() {
      isCorrectPassword = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$")
          .hasMatch(userInput) ? true   :  false;
      _enteredPassword = userInput;
    });
  }

  void isPasswordsMatchSwitcher(String userInput){
    setState(() {
      isPasswordsMatch = _enteredPassword == userInput ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20.0),
            ),
            TextFormField(
              controller: _emailController,
              onChanged: (value) {
                _email = value;
                isCorrectEmailSwitcher(_email);
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
              height: SizeConfig.screenHeight * 0.04,
            ),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(color: isCorrectPassword ? null : Colors.red),
              onChanged: (value){
                isCorrectPasswordSwitcher(value);
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: isCorrectPassword ? 'Password'
                    : 'Min 6 characters, 1 Big, 1 Small letter, 1 digit',
                hintText: 'Enter Your Password',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SvgPicture.asset('assets/icons/Lock.svg',
                    color: isCorrectPassword ? null : Colors.red,),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            TextFormField(
              style: TextStyle(color: isPasswordsMatch ? null : Colors.red),
              onChanged: (value){
                isPasswordsMatchSwitcher(value);
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: isPasswordsMatch ? 'Re-Enter Password'
                    : 'Not match entered password',
                hintText: 'Re-Enter Your Password',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SvgPicture.asset('assets/icons/Lock.svg',
                    color: isPasswordsMatch ? null : Colors.red,),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.08,
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
                  /*(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty
                      && isCorrectEmail && isCorrectPassword && isPasswordsMatch) ?
                   Navigator.pushNamed(context, CompleteProfileScreen.routeName)
                      : showAlertDialog(context);*/
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
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

          ],
        ));
  }
}











