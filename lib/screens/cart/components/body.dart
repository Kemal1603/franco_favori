import 'package:ff_app/constants.dart';
import 'package:ff_app/models/Arguments.dart';
import 'package:ff_app/models/Product.dart';
import 'package:ff_app/models/provider_models/cart_list_model.dart';
import 'package:ff_app/screens/details/details_screen.dart';
import 'package:ff_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.6,
          child: ListView.builder(
            itemCount: Provider.of<UsersCartList>(context, listen: false).items.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, DetailsScreen.routName,
                    arguments: ScreenArguments(
                        product: Provider.of<UsersCartList>(context, listen: false).items[index].product,
                        page: 'Cart'),);
              },
              child: Dismissible(
                secondaryBackground: Container(
                  decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete_forever,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
                key: UniqueKey(),
                background: Container(color: Colors.redAccent),
                child: CartItem(
                  product: Provider.of<UsersCartList>(context).items[index].product,
                  quantity: Provider.of<UsersCartList>(context).items[index].quantity,
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    Provider.of<UsersCartList>(context, listen: false).removeCart(
                      index:  index,
                    );
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

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
