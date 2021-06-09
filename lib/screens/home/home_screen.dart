import 'package:ff_app/components/bottom_nav_bar_widget.dart';
import 'package:ff_app/enums/enums.dart';
import 'package:ff_app/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(
        userTap: BottomMenuState.home,
      ),
      body: Body(),
    );
  }
}

