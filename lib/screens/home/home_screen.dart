import 'package:ff_app/constants.dart';
import 'package:ff_app/screens/home/components/body.dart';
import 'package:flutter/material.dart';





class HomeScreen extends StatelessWidget {

  static String routName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
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
              child: BottomNavigationBar(
                selectedItemColor: Colors.deepPurple,
                unselectedItemColor: kSecondaryColor,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: 'Profile',
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps),
                    label: 'Settings',
                  ),
                ],
              ),
            )
        ),
        body: Body(),
      ),
    );
  }
}

