import 'package:ff_app/components/cart_item.dart';
import 'package:ff_app/models/Arguments.dart';
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
                Navigator.popAndPushNamed(context, DetailsScreen.routeName,
                    arguments: ScreenArguments(
                        product: Provider.of<UsersCartList>(context, listen: false).items[index],
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
                  product: Provider.of<UsersCartList>(context).items[index],
                  quantity: Provider.of<UsersCartList>(context).items[index].pickedQuantity,
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

