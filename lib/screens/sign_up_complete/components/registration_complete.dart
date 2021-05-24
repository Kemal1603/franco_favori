import 'package:ff_app/constants.dart';
import 'package:ff_app/screens/otp/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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


class RegistrationCompleteForm extends StatefulWidget {
  @override
  _RegistrationCompleteFormState createState() =>
      _RegistrationCompleteFormState();
}

class _RegistrationCompleteFormState extends State<RegistrationCompleteForm> {

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  String firstName;
  String lastName;

  bool isCorrectNameFiled = true;
  bool isCorrectLastNameFiled = true;

  void isCorrectNameFiledSwitcher(String userInput) {
    setState(() {
      isCorrectNameFiled = userInput.contains(RegExp(r'[0-9]')) ? false : true;
    });
  }

  void isCorrectLastNameFiledSwitcher(String userInput) {
    setState(() {
      isCorrectLastNameFiled =
          userInput.contains(RegExp(r'[0-9]')) ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(

      children: [

        TextFormField(
          controller: _nameController,
          onChanged: (value) {
            isCorrectNameFiledSwitcher(value);
          },
          style: TextStyle(
            color: isCorrectNameFiled ? null : Colors.red,
          ),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: isCorrectNameFiled ? 'First Name' : 'Name can not contain a digit',
            hintText: 'Enter Your First Name',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'assets/icons/User.svg',
                color: isCorrectNameFiled ? null : Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        TextFormField(
          controller: _lastNameController,
          keyboardType: TextInputType.name,
          style: TextStyle(color: isCorrectLastNameFiled ? null : Colors.red),
          onChanged: (value) {
            isCorrectLastNameFiledSwitcher(value);
          },
          decoration: InputDecoration(
            hintText: 'Enter Your Last Name',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: isCorrectLastNameFiled ? 'Last Name'
                : 'Last name cannot contain a digit',
            suffixIcon: Padding(
              padding: EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'assets/icons/User.svg',
                color: isCorrectLastNameFiled ? null :  Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          onChanged: (value) {},
          decoration: InputDecoration(
            labelText: 'Phone Number',
            hintText: 'Enter Your Phone Number',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'assets/icons/Phone.svg',
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        TextFormField(
          controller: _addressController,
          onChanged: (value) {},
          decoration: InputDecoration(
            labelText: 'Address',
            hintText: 'Enter Your Address',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'assets/icons/Location point.svg',
              ),
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

              /*(_nameController.text.isNotEmpty &&
              _lastNameController.text.isNotEmpty &&
              _phoneController.text.isNotEmpty &&
              _addressController.text.isNotEmpty &&
              isCorrectNameFiled&&
              isCorrectLastNameFiled) ?
                  Navigator.pushNamed(context, OTPScreen.routeName) :
                  showAlertDialog(context);*/
              Navigator.pushNamed(context, OTPScreen.routeName);
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
