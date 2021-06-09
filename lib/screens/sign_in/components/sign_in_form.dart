  import 'package:ff_app/screens/forgot_password/forgot_password.dart';
import 'package:ff_app/screens/home/home_screen.dart';
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


  class SignForm extends StatefulWidget {
    @override
    _SignFormState createState() => _SignFormState();
  }

  class _SignFormState extends State<SignForm> {
    String email = 'tony@starkindustries.com';
    bool isCorrectEmail = true;

    bool isCorrectPassword = true;
    bool isChecked = false;

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

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
                height: SizeConfig.screenHeight * 0.05,
              ),
              Row(
                children: [
                  Checkbox(value: isChecked,
                      activeColor: kPrimaryColor,
                      onChanged: (value){
                        setState(() {
                          isChecked = value;
                        });
                      }),
                  Text('Remember Me'),
                  Spacer(),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, ForgotPassword.routeName);

                    },
                    child: Text('Forgot Password ?',
                      style: TextStyle(
                          decoration: TextDecoration.underline
                      ),),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20.0),
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
                    /*(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty &&
                    isCorrectEmail && isCorrectPassword) ?
                        Navigator.pushNamed(context, HomeScreen.routName) :
                        showAlertDialog(context);*/
                    Navigator.pushNamed(context, HomeScreen.routeName);

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