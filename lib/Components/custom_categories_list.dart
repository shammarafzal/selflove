import 'dart:math';

import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoriesView(imagePath: "https://cdn-icons-png.flaticon.com/128/2647/2647591.png", title: "Fitness",),
          CategoriesView(imagePath: "https://googleflutter.com/sample_image.jpg", title: "ok",),
          CategoriesView(imagePath: "https://googleflutter.com/sample_image.jpg", title: "ok",),
          CategoriesView(imagePath: "https://googleflutter.com/sample_image.jpg", title: "ok",),
          CategoriesView(imagePath: "https://googleflutter.com/sample_image.jpg", title: "ok",),
          CategoriesView(imagePath: "https://googleflutter.com/sample_image.jpg", title: "ok",),
          CategoriesView(imagePath: "https://googleflutter.com/sample_image.jpg", title: "ok",),
          CategoriesView(imagePath: "https://googleflutter.com/sample_image.jpg", title: "ok",),
        ],
      ),
    );
  }
}


class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key, required this.imagePath, required this.title}) : super(key: key);
  final imagePath;
  final title;
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 80,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(widget.imagePath),
                fit: BoxFit.cover)
        ),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 18),)),
      ),
    );
  }
}
