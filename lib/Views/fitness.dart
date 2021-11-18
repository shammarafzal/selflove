import 'package:flutter/material.dart';
import 'package:self_love/Components/custom_categories_list.dart';
import 'package:self_love/Components/custom_fitness_list.dart';
import 'package:self_love/Components/custom_image_list.dart';

class Fitness extends StatefulWidget {
  const Fitness({Key? key}) : super(key: key);

  @override
  _FitnessState createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ImagesList(),
          ImageList(),

        ]);
  }
}
