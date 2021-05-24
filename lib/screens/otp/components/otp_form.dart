import 'package:ff_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class OTPForm extends StatefulWidget {
  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {

  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }


  void nextNode ({String value, FocusNode focusNode}){

    if(value.length == 1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            SizedBox(
              width: getProportionateScreenWidth(70.0),
              child: TextFormField(
                onChanged: (value){
                  nextNode(value: value, focusNode: pin2FocusNode);
                },
                autofocus: true,
                keyboardType: TextInputType.number,
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(15.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(70.0),
              child: TextFormField(
                focusNode: pin2FocusNode,
                autofocus: true,
                onChanged: (value){
                  nextNode(value: value, focusNode: pin3FocusNode);
                },
                keyboardType: TextInputType.number,
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(15.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(70.0),
              child: TextFormField(
                focusNode: pin3FocusNode,
                autofocus: true,
                onChanged: (value){
                  nextNode(value: value, focusNode: pin4FocusNode);
                },
                keyboardType: TextInputType.number,
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(15.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(70.0),
              child: TextFormField(
                focusNode: pin4FocusNode,
                autofocus: true,
                onChanged: (value){
                  pin4FocusNode.unfocus();
                },
                keyboardType: TextInputType.number,
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(15.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),

          ],
        ),

        SizedBox(
          height: SizeConfig.screenHeight * 0.18,
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
