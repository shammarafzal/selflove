import 'package:get/get.dart';
import 'package:self_love/Bindings/data_bindings.dart';
import 'package:self_love/Views/home_page.dart';
import 'package:self_love/Views/signinScreen.dart';

class Routes{
  static final routes = [
    GetPage(
      name: '/login',
      page: () => SignIn(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(title: 'Fitness'),
      binding: DataBinding(),
    ),
  ];
}