import 'package:ff_app/components/bottom_nav_bar_widget.dart';
import 'package:ff_app/enums/enums.dart';
import 'package:ff_app/screens/liked_items/components/body.dart';
import 'package:flutter/material.dart';




class LikedItemsScreen extends StatelessWidget {

  static String routeName = '/liked_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(
        userTap: BottomMenuState.favorite,
      ),
      body: Body(),
    );
  }
}
