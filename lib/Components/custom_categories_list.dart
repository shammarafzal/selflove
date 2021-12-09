import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_love/Controllers/category_controller.dart';
import 'package:self_love/Utils/api.dart';

class CategoriesList extends StatefulWidget {
  CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        child: Obx(
          () {
            // if (categoryController.isLoading.value) {
            //   return Center(child: CircularProgressIndicator());
            // } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categoryList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return CategoriesView(
                    title: categoryController.categoryList[index].name,
                    imagePath:
                    API().image_base_url+'${categoryController.categoryList[index].image}',
                    cat_id: categoryController.categoryList[index].id,
                  );
                },
              );
            }
          // },
        ));
  }
}

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key, required this.imagePath, required this.title, required this.cat_id})
      : super(key: key);
  final imagePath;
  final title;
  final cat_id;
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/cat_item_list', arguments: {'cat_id': widget.cat_id});
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
