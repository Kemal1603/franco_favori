import 'package:ff_app/models/Arguments.dart';
import 'package:ff_app/models/provider_models/liked_items_list_model.dart';
import 'package:ff_app/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.6,
            child: ListView.builder(
              itemCount: Provider.of<UsersLikedList>(context).likedItems.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DetailsScreen.routeName, arguments: ScreenArguments(
                   product:  Provider.of<UsersLikedList>(context, listen: false).likedItems[index],
                    page: null
                  ));
                },
                child: Dismissible(
                  secondaryBackground: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)),
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
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
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
                            Provider.of<UsersLikedList>(context)
                                .likedItems[index]
                                .images[0],
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.04,
                        ),
                        Text.rich(
                          TextSpan(
                              text:
                                  '${Provider.of<UsersLikedList>(context).likedItems[index].title} \n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                              children: [
                                TextSpan(
                                  text:
                                      '${Provider.of<UsersLikedList>(context).likedItems[index].price} \$',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ]),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.04,
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      Provider.of<UsersLikedList>(context, listen: false).likedItems[index].isFavourite
                      = !Provider.of<UsersLikedList>(context, listen: false).likedItems[index].isFavourite;
                      Provider.of<UsersLikedList>(context, listen: false).removeCart(index: index);
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
