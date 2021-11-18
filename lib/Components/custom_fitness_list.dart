import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'dart:math';

class ImageList extends StatelessWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.55,
      child: ListView(
        children: [
          FitnessListView(title: 'Dancing for Beginners', cal: '430', mintues: '30',image_location: 'assets/sp-1.png'),
          FitnessListView(title: 'Dancing for Beginners', cal: '430', mintues: '30',image_location: 'assets/sp-1.png')
        ],
      ),
    );
  }
}



class FitnessListView extends StatefulWidget {
  const FitnessListView({Key? key, required  this.title, required this.cal, required this.mintues, required this.image_location}) : super(key: key);
  final String title;
  final String cal;
  final String mintues;
  final String image_location;
  @override
  _FitnessListViewState createState() => _FitnessListViewState();
}

class _FitnessListViewState extends State<FitnessListView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: (){

      },
      child: Card(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.45,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.left,),
                  ),
                  ListTile(leading: Icon(Icons.bolt, color: Colors.white,),title: Text(widget.cal, style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.left,),),
                  ListTile(leading: Icon(Icons.access_alarm,color: Colors.white,),title: Text(widget.mintues, style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.left,),),

                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.45,
              child: Image.asset(
                widget.image_location,
                // fit: BoxFit.fill,
              ),
            ),
          ],
        )
      ),
    );
  }
}
