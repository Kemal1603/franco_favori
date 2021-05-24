import 'package:flutter/material.dart';

import '../../../size_config.dart';


class SpecialOfferCard extends StatelessWidget {

  final String category, image;
  final int numOfItems;
  final GestureTapCallback press;


  SpecialOfferCard({
    @required this.category,
    @required this.image,
    @required this.numOfItems,
    @required this.press
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: getProportionateScreenWidth(242.0),
        height: getProportionateScreenHeight(100),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF343434).withOpacity(0.1),
                            Color(0xFF343654),
                          ]
                      )
                  ),
                ),

                Text.rich(
                    TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: '$category \n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0
                            ),
                          ),
                          TextSpan(
                              text: '$numOfItems Items',
                              style: TextStyle(fontSize: 18.0)
                          )
                        ]

                    )
                )


              ],
            )
        ),
      ),
    );
  }
}