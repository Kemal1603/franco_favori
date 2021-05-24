import 'package:ff_app/screens/forgot_password/forgot_password.dart';
import 'package:ff_app/screens/forgot_password/recovery_accepted.dart';
import 'package:ff_app/screens/home/home_screen.dart';
import 'package:ff_app/screens/otp/otp_screen.dart';
import 'file:///C:/Users/123/Desktop/Flutter/UDEMY_LAST/udemy/ff_app/lib/screens/sign_up_complete/complete_profile.dart';
import 'package:ff_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:ff_app/screens/sign_in/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/details/details_screen.dart';


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
};

