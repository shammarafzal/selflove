import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';

class MeditationDetails extends StatefulWidget {
  const MeditationDetails({Key? key, required this.imagePath, required this.title, required this.desc, required this.long_desc,}) : super(key: key);
  final imagePath;
  final title;
  final desc;
  final long_desc;
  @override
  _MeditationDetailsState createState() => _MeditationDetailsState();
}

class _MeditationDetailsState extends State<MeditationDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: Container(
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(widget.imagePath), fit: BoxFit.cover)),
        child: Container(
          // width: SizeConfig.screenWidth * 0.6,
          // height: SizeConfig.screenHeight * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${widget.title}', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${widget.desc}', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal, fontSize: 14),textAlign: TextAlign.center,),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${widget.long_desc}', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal, fontSize: 18),textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}