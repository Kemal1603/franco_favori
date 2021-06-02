import 'package:ff_app/constants.dart';
import 'package:ff_app/routes.dart';
import 'package:ff_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/provider_models/cart_list_model.dart';
import 'models/provider_models/detail_screen_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailScreenModel()),
        ChangeNotifierProvider(create: (context) => UsersCartList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Muli',
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(
              headline6: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0),
              borderSide: BorderSide(color: kTextColor),
              gapPadding: 10.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0),
              borderSide: BorderSide(color: kTextColor),
              gapPadding: 10.0,
            ),
          ),
          textTheme: TextTheme(
              bodyText1: TextStyle(color: kTextColor),
              bodyText2: TextStyle(color: kTextColor)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: SplashScreen.routName,
        routes: routes,
      ),
    );
  }
}
