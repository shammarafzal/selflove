import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_love/Controllers/category_controller.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        child: Obx(
          () {
            if (categoryController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categoryList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return CategoriesView(
                    title: categoryController.categoryList[index].name,
                    imagePath:
                        "https://cdn-icons-png.flaticon.com/512/6146/6146236.png",
                  );
                },
              );
            }
          },
        ));
  }
}

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key, required this.imagePath, required this.title})
      : super(key: key);
  final imagePath;
  final title;

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('cat_item_list');
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.imagePath), fit: BoxFit.cover)),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
