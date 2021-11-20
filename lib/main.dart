import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Views/fitness.dart';
import 'Views/home_page.dart';
import 'Views/in_app_purchase.dart';
import 'Views/intro_screen.dart';
import 'Views/signinScreen.dart';
import 'Views/signupScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
      ? false
      : prefs.getBool('isLoggedIn');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: isLoggedIn! ? 'home' : 'home',
      initialRoute: 'intro_screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        'login': (context) => SignIn(),
        'signup_screen': (context) => SignUp(),
        'intro_screen': (context) => IntroScreen(),
        'in_app_purchases': (context) => InAppPurchase(),
        'home': (context) => HomePage(),
        'fitness': (context) => Fitness(),

      },
    ),
  );
}