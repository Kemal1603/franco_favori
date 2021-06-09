import 'package:ff_app/enums/enums.dart';
import 'package:ff_app/screens/home/home_screen.dart';
import 'package:ff_app/screens/liked_items/liked_item_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';



class BottomNavBarWidget extends StatelessWidget {
  final BottomMenuState userTap;

  BottomNavBarWidget({this.userTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Container(
            height: 60.0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  color: userTap == BottomMenuState.home ? Colors.deepPurpleAccent : kSecondaryColor,
                  onPressed: ()=>Navigator.pushNamed(context, HomeScreen.routeName),
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: userTap == BottomMenuState.favorite ? Colors.deepPurpleAccent : kSecondaryColor,
                  onPressed: () => Navigator.pushNamed(context, LikedItemsScreen.routeName),
                ),
                IconButton(
                  icon: Icon(Icons.chat),
                  color: userTap == BottomMenuState.chat ? Colors.deepPurpleAccent : kSecondaryColor,
                  onPressed: (){},
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  color: userTap == BottomMenuState.profile ? Colors.deepPurpleAccent : kSecondaryColor,
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ));
  }
}
