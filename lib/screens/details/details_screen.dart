import 'package:flutter/material.dart';
import 'package:ff_app/models/Product.dart';

class DetailsScreen extends StatelessWidget {
  static String routName = '/details_screen';
  final Product product;

  DetailsScreen({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.66),
          child: Container(
            child: Row(
              children: [
                Text('4.5'),
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
    );
  }
}
