import 'package:ff_app/screens/details/components/body.dart';
import 'package:flutter/material.dart';





class DetailsScreen extends StatelessWidget {
  static String routName = '/details_screen';


  @override
  Widget build(BuildContext context) {

    final dynamic tappedProduct = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.66),
          child: Container(
            child: Row(
              children: [
                Text('${tappedProduct.rating}'),
                Icon(Icons.star, color: Colors.amber,)
              ],
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Body(
        product: tappedProduct,
      ),
    );
  }
}
