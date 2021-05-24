import 'package:flutter/material.dart';




class DiscountBanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 23.0
      ),
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.deepPurple,
      ),

      padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0),
      child: Text.rich(
          TextSpan(
              text: "A Summer Surprise \n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                    text: 'Cashback 20%',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )
                )
              ]
          )
      ),
    );
  }
}