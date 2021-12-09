import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_love/Controllers/fitness_controller.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:self_love/Utils/api.dart';
import 'package:self_love/Views/fit_cat_details.dart';

class CatItemList extends StatelessWidget {

  // final arguments = Get.arguments as Map;

    CatItemList({
    Key? key,
  }) : super(key: key);
  FitnessController fitnessController = Get.put(FitnessController('24'));
  @override
  Widget build(BuildContext context) {
    // FitnessController fitnessController = Get.put(FitnessController('${arguments['cat_id']}'));
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('home');
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Color.fromRGBO(254, 176, 149, 1),
        title: Text('Categories List'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() {
            // if (categoryController.isLoading.value) {
            //   return Center(child: CircularProgressIndicator());
            // } else {

            return ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: fitnessController.fitnessList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: CatItem(
                      imagePath:
                             API().image_base_url+'${fitnessController.fitnessList[index].thumbnail}',
                      title: fitnessController.fitnessList[index].name,
                      desc: fitnessController.fitnessList[index].description,
                      long_desc:
                      fitnessController.fitnessList[index].description,
                      videoLink: API().image_base_url+'${fitnessController.fitnessList[index].media}',)
                );
              },
            );
          }
// },
              )),
    );
  }
}

class CatItem extends StatefulWidget {
  const CatItem(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.desc,
      required this.long_desc,
      required this.videoLink})
      : super(key: key);
  final imagePath;
  final title;
  final desc;
  final long_desc;
  final videoLink;

  @override
  _CatItemState createState() => _CatItemState();
}

class _CatItemState extends State<CatItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => FitCatDetails(
                  title: widget.title,
                  desc: widget.long_desc,
                  image: widget.imagePath,
                  videoLink: widget.videoLink)),
        );
      },
      child: Container(
        color: Color.fromRGBO(246, 247, 249, 1),
        height: SizeConfig.screenHeight * 0.12,
        width: SizeConfig.screenWidth * 0.9,
        child: Row(
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.imagePath),
                      fit: BoxFit.cover)),
            ),
            Container(
                width: SizeConfig.screenWidth * 0.65,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.title}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.desc}',
                          style: TextStyle(fontSize: 14),
                        )),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
