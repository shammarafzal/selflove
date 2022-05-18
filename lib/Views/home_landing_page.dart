import 'package:flutter/material.dart';
import 'Components/custom_categories_list.dart';
import 'Components/suggestions_list.dart';
import 'package:self_love/Views/weather_screen.dart';

class HomeLanding extends StatefulWidget {
  const HomeLanding({Key? key}) : super(key: key);

  @override
  _HomeLandingState createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          WeatherScreen(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
          ),
          CategoriesList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Suggestions Today', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
          ),

          Suggestion_list()

        ]);
  }
}
