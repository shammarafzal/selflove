import 'package:get/get.dart';
import 'package:self_love/Components/cat_item_list.dart';
import 'package:self_love/Views/home_page.dart';
import 'package:self_love/Views/signinScreen.dart';

class Routes{
  static final routes = [
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
  ];
}
