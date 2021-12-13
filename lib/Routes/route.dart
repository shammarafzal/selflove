import 'package:get/get.dart';
import 'package:self_love/Components/cat_item_list.dart';
import 'package:self_love/Views/fitness.dart';
import 'package:self_love/Views/home_page.dart';
import 'package:self_love/Views/in_app_purchase.dart';
import 'package:self_love/Views/intro_screen.dart';
import 'package:self_love/Views/otp_verification.dart';
import 'package:self_love/Views/signinScreen.dart';
import 'package:self_love/Views/signupScreen.dart';

class Routes{
  static final routes = [
    GetPage(
      name: '/intro',
      page: () => IntroScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignUp(),
    ),
    GetPage(
      name: '/verify_code',
      page: () => VerificationCode(),
    ),
    GetPage(
      name: '/in_app_purchase',
      page: () => InAppPurchase(),
    ),
    GetPage(
      name: '/login',
      page: () => SignIn(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(title: 'Fitness'),
    ),
    GetPage(
      name: '/cat_item_list',
      page: () => CatItemList(),
    ),
    GetPage(
      name: '/fitness',
      page: () => Fitness(),
    ),
  ];
}
