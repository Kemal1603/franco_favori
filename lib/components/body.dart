import 'package:ff_app/screens/sign_in/sign_in_screen.dart';
import 'package:ff_app/screens/splash/splash_contact.dart';
import 'package:flutter/material.dart';
import 'package:ff_app/constants.dart';
import 'package:ff_app/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {'image': 'assets/images/splash_1.png'},
    {'image': 'assets/images/splash_2.png'},
    {'image': 'assets/images/splash_3.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index]['image'],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length, (index) => buildDot(index: index)),
                  ),
                  Spacer(),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(color: kPrimaryColor)
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(18.0)
                          ),
                        ),
                      )
                  ),
                  Spacer()
                ],
              )),
        ],
      ),
    );
  }

  Container buildDot({int index}) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      height: 6.0,
      width: 6.0,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3.0)),
    );
  }
}
