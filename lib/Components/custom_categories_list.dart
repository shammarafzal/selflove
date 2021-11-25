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
          CategoriesView(imagePath: "https://image.freepik.com/free-photo/sporty-young-woman-model-wearing-white-sleeveless-t-shirt-leggins-doing-sport-exercise-biceps-triceps-with-sport-fitness-rubber-bands-isolated-color-background_176532-13645.jpg", title: "Fitness",),
          CategoriesView(imagePath: "https://image.freepik.com/free-photo/young-pregnant-woman-smiling-with-happiness_1150-18141.jpg", title: "Pregnancy",),
          CategoriesView(imagePath: "https://image.freepik.com/free-vector/organic-flat-people-meditating-illustration_23-2148906556.jpg", title: "Health",),
          CategoriesView(imagePath: "https://image.freepik.com/free-photo/love-yourself-self-acceptance-gentle-lovely-afro-american-woman-crosses-hands-embraces-own-body-tilts-head-closes-eyes_273609-39190.jpg", title: "Self Love",),
          CategoriesView(imagePath: "https://image.freepik.com/free-photo/top-view-healthy-food-vs-unhealthy-food_23-2148194603.jpg", title: "Nutrition",),
          CategoriesView(imagePath: "https://cdn-icons-png.flaticon.com/512/6146/6146236.png", title: "Life",),
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
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(widget.imagePath),
                fit: BoxFit.cover)
        ),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
      ),
    );
  }
}
