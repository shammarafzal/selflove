import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_love/Controllers/suggestion_controller.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:self_love/Utils/api.dart';
import 'fit_cat_details.dart';

class Suggestion_list extends StatelessWidget {
  Suggestion_list({Key? key}) : super(key: key);
  final SuggestionController suggestionController =
      Get.put(SuggestionController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.4,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() {
            // if (categoryController.isLoading.value) {
            //   return Center(child: CircularProgressIndicator());
            // } else {
            return ListView.builder(
              itemCount: suggestionController.suggestionList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: Suggestion(
                      imagePath:
                      API().image_base_url+'${suggestionController.suggestionList[index].thumbnail}',
                      title: suggestionController.suggestionList[index].name,
                      desc: suggestionController.suggestionList[index].description,
                      min: suggestionController.suggestionList[index].duration,
                      typeActive: suggestionController.suggestionList[index].type,
                      videoLink:
                      API().image_base_url+'${suggestionController.suggestionList[index].media}',
                  ),
                );
              },
            );
          }
              // },
              )
          // ListView(
          //   children: [
          //     Card(
          //       child: Suggestion(
          //         imagePath: 'https://image.freepik.com/free-photo/sporty-young-woman-doing-yoga-practice-isolated-concept-healthy-life-natural-balance-body-mental-development_231208-10353.jpg',
          //         title: 'Yoga',
          //         desc: 'lorum ipsum tripsum, lorum ipsum',
          //         min: '12 Min',
          //         typeActive: 'Indoor'
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}

class Suggestion extends StatefulWidget {
  const Suggestion(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.desc,
      required this.min,
      required this.typeActive,
      required this.videoLink})
      : super(key: key);
  final imagePath;
  final title;
  final desc;
  final min;
  final typeActive;
  final videoLink;
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
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
                  desc: widget.desc,
                  image: widget.imagePath,
                  videoLink: widget.videoLink)),
        );
      },
      child: Container(
        color: Color.fromRGBO(246, 247, 249, 1),
        height: SizeConfig.screenHeight * 0.15,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Text('${widget.noOfLesson}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.min}',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.typeActive}',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
