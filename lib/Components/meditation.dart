import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_love/Controllers/fetchMeditations_controller.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:self_love/Utils/api.dart';
import 'meditation_details.dart';

class MedicationList extends StatelessWidget {
  final MeditationController meditationController =
      Get.put(MeditationController());
  MedicationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.5,
      child: Obx(() {
        return ListView.builder(

          itemCount: meditationController.meditationList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return Meditation(
              imagePath: API().image_base_url +
                  '${meditationController.meditationList[index].thumbnail}',
              title: meditationController.meditationList[index].title,
              desc: meditationController.meditationList[index].description,
              long_desc: meditationController.meditationList[index].description,
              media: API().image_base_url +
                  '${meditationController.meditationList[index].media}',
            );
          },
        );
      }),
    );
  }
}

class Meditation extends StatefulWidget {
  const Meditation(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.desc,
      required this.long_desc,
      required this.media})
      : super(key: key);
  final imagePath;
  final title;
  final desc;
  final long_desc;
  final media;
  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => MeditationDetails(
                    title: widget.title,
                    desc: widget.desc,
                    long_desc: widget.long_desc,
                    imagePath: widget.imagePath,
                    media: widget.media,
                  )),
        );
      },
      child: Column(
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.8,
            height: SizeConfig.screenHeight * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(widget.imagePath), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.title}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.desc}',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                )),
          ),
        ],
      ),
    );
  }
}
