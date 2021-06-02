import 'package:ff_app/models/Product.dart';
import 'package:ff_app/screens/cart/components/body.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';


class CartScreen extends StatelessWidget {

  static String routName = '/cart';
  final List<Product> cartList;

  CartScreen({this.cartList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 230.0),
          child: Text('Your Cart'),
        ),
      ),
      body: Body(),
      bottomNavigationBar: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0,
              color: Colors.black.withOpacity(0.2),
            ),
          ]
        ),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                text: 'Total: \n',style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.black),
                children: [
                  TextSpan(
                    text: '\$234.5\n',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,
                  color: Colors.black)
                  )
                ]
              )
            ),
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
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(18.0)
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}



