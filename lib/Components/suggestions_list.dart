import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';


class Suggestion_list extends StatelessWidget {
  const Suggestion_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              child: Suggestion(
                imagePath: 'https://googleflutter.com/sample_image.jpg',
                title: 'Vip Yoga',
                desc: 'lorum ipsum tripsum, lorum ipsum',
                min: '12 Min',
                noOfLesson: '12 Lessons',
                typeActive: 'Indoor'
              ),
            ),
            Card(
              child: Suggestion(
                imagePath: 'https://googleflutter.com/sample_image.jpg',
                  title: 'Vip Yoga',
                  desc: 'lorum ipsum tripsum, lorum ipsum',
                  min: '12 Min',
                  noOfLesson: '12 Lessons',
                  typeActive: 'Indoor'
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Suggestion extends StatefulWidget {
  const Suggestion({Key? key,  required this.imagePath, required this.title, required this.desc, required this.min, required this.noOfLesson, required this.typeActive}) : super(key: key);
  final imagePath;
  final title;
  final desc;
  final min;
  final noOfLesson;
  final typeActive;
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushReplacementNamed('fitness');
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
                      image: NetworkImage(widget.imagePath), fit: BoxFit.cover)),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.65,
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${widget.title}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${widget.desc}', style: TextStyle(fontSize: 14),)),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('${widget.noOfLesson}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('${widget.min}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('${widget.typeActive}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),
                      ),
                    ],
                  )
                ]
            )
            )
          ],
        ),
      ),
    );
  }
}
