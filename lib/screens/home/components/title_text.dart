import 'package:flutter/material.dart';

import '../../../size_config.dart';


class TitleText extends StatelessWidget {
  final String text;
  final GestureTapCallback press;


  TitleText({
    @required this.text,
    @required this.press
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$text',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18.0),
              color: Colors.black
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            'See More!',
            style: TextStyle(
                color: Colors.black
            ),
          ),
        ),
      ],
    );
  }
}