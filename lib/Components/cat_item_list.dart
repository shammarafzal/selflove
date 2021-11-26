import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:self_love/Views/fit_cat_details.dart';

class CatItemList extends StatelessWidget {
  const CatItemList({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('home');
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Color.fromRGBO(254,176,149, 1),
        title: Text('Categories List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              child: CatItem(
                  imagePath: 'https://image.freepik.com/free-photo/sporty-young-woman-doing-yoga-practice-isolated-concept-healthy-life-natural-balance-body-mental-development_231208-10353.jpg',
                  title: 'Eating Disorders',
                  desc: 'lorum ipsum tripsum, lorum ipsum',
                  long_desc: 'lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum',
                  story: 'My Love'
              ),
            ),
            Card(
              child: CatItem(
                  imagePath: 'https://cdn-icons-png.flaticon.com/512/3043/3043217.png',
                  title: 'Chest Exercise',
                  desc: 'lorum ipsum tripsum, lorum ipsum',
                  long_desc: 'lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum',
                  story: 'My Love'
              ),
            ),
            Card(
              child: CatItem(
                  imagePath: 'https://image.freepik.com/free-photo/top-view-healthy-food-vs-unhealthy-food_23-2148194603.jpg',
                  title: 'Food',
                  desc: 'lorum ipsum tripsum, lorum ipsum',
                  long_desc: 'lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum',
                  story: 'My Love'
              ),
            ),
            Card(
              child: CatItem(
                  imagePath: 'https://image.freepik.com/free-photo/i-wish-this-moment-could-stay-forever_329181-11286.jpg',
                  title: 'Relax',
                  desc: 'lorum ipsum tripsum, lorum ipsum',
                  long_desc: 'lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum, lorum ipsum tripsum, lorum ipsum',
                  story: 'My Love'
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CatItem extends StatefulWidget {
  const CatItem({Key? key, required this.imagePath, required this.title, required this.desc, required this.long_desc, required this.story}) : super(key: key);
  final imagePath;
  final title;
  final desc;
  final long_desc;
  final story;
  @override
  _CatItemState createState() => _CatItemState();
}

class _CatItemState extends State<CatItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) =>
                  FitCatDetails(title: widget.title, desc: widget.long_desc, image: widget.imagePath, story: widget.story)
          ),
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
                    ]
                )
            )
          ],
        ),
      ),
    );
  }
}
