import 'package:ff_app/models/Arguments.dart';
import 'package:ff_app/models/provider_models/detail_screen_model.dart';
import 'package:ff_app/screens/cart/cart.dart';
import 'package:ff_app/screens/details/components/body.dart';
import 'package:ff_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details_screen';

  @override
  Widget build(BuildContext context) {
    final dynamic tappedProduct =
    ModalRoute.of(context).settings.arguments as ScreenArguments;

    return Scaffold(
      backgroundColor: Provider.of<DetailScreenModel>(context).color,
      appBar: AppBar(
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.66),
          child: Container(
            child: Row(
              children: [
                Text('${tappedProduct.product.rating}'),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                )
              ],
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            tappedProduct.page == 'Home'
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  )
                : tappedProduct.page == 'Cart'
                ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            ) :
            tappedProduct.page  ?? Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Body(
        product: tappedProduct.product,
        screen: tappedProduct.page,
      ),
    );
  }
}
