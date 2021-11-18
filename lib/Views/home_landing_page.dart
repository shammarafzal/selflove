import 'package:flutter/material.dart';
import 'package:self_love/Components/custom_categories_list.dart';
import 'package:self_love/Components/custom_image_list.dart';
import 'package:self_love/Views/weather_screen.dart';

class HomeLanding extends StatefulWidget {
  const HomeLanding({Key? key}) : super(key: key);

  @override
  _HomeLandingState createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          WeatherScreen(),
          CategoriesList()

        ]);
  }
}
