import 'package:ff_app/screens/cart/cart.dart';
import 'package:ff_app/screens/forgot_password/forgot_password.dart';
import 'package:ff_app/screens/forgot_password/recovery_accepted.dart';
import 'package:ff_app/screens/home/home_screen.dart';
import 'package:ff_app/screens/otp/otp_screen.dart';
import 'package:ff_app/screens/sign_in/sign_in_screen.dart';
import 'package:ff_app/screens/sign_up/sign_up_screen.dart';
import 'package:ff_app/screens/sign_up_complete/complete_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'models/provider_models/cart_list_model.dart';
import 'models/provider_models/detail_screen_model.dart';
import 'screens/details/details_screen.dart';
import 'screens/splash/splash_screen.dart';


final Map<String, WidgetBuilder> routes = {


  SplashScreen.routName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  RecoveryApply.routeName: (context) => RecoveryApply(),
  SignUp.routeName: (context) => SignUp(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OTPScreen.routeName: (context) => OTPScreen(),
  HomeScreen.routName: (context) => HomeScreen(),
  DetailsScreen.routName:(context) => DetailsScreen(),

  CartScreen.routName:(context) =>  CartScreen(),
};

