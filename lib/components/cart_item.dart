import 'package:ff_app/models/Product.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';



class CartItem extends StatelessWidget {
  final Product product;
  final int quantity;

  CartItem({this.product, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.10,
            width: SizeConfig.screenWidth * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kSecondaryColor.withOpacity(0.25),
            ),
            child: Image.asset(
              product.images[0],
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.04,
          ),
          Text.rich(TextSpan(
              text: '${product.title} \n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              children: [
                TextSpan(
                  text: '${product.price} \$',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                TextSpan(
                  text: ' x $quantity',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ]),),
          SizedBox(
            width: SizeConfig.screenWidth * 0.04,
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
