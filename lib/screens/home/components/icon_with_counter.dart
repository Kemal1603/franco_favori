import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';






class IconWithCounter extends StatelessWidget {
  final String icon;
  final int numOfItems;
  final Function press;

  IconWithCounter({this.icon, this.numOfItems = 0, this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(25.0),
      child: Stack(
        children: [
          Container(
            height: getProportionateScreenWidth(46.0),
            width: getProportionateScreenWidth(46.0),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.black.withOpacity(0.4),),
            ),
            child: SvgPicture.asset(icon, fit: BoxFit.scaleDown,),

          ),
          if (numOfItems != 0)
            Positioned(
              right: 1.3,
              child: Container(
                height: getProportionateScreenWidth(15.0),
                width: getProportionateScreenWidth(15.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,),
                ),
                child: Center(
                  child: Text(
                    '$numOfItems',
                    style: TextStyle(
                        height: 1,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
