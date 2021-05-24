import 'package:flutter/material.dart';
import 'package:ff_app/components/body.dart';
import 'package:ff_app/size_config.dart';


class SplashScreen extends StatelessWidget {
  static String routName = '/splash';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}