import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Fitness',),
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('home');
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
          children: [
            ImagesList(),
            ImageList(),

          ]),
    );
  }
}
