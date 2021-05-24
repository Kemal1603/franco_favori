import 'package:flutter/material.dart';
import '../../constants.dart';



class SplashContent extends StatelessWidget {
  final String image;

  SplashContent({this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'Franco Favori',
          style: TextStyle(
            fontSize: 36.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Image.asset(
          image,
          height: 265.0,
        )
      ],
    );
  }
}
