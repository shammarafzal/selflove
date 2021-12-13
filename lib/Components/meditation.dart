import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';

import 'meditation_details.dart';

class MedicationList extends StatelessWidget {
  const MedicationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.5,
      child: ListView(
        children: [
          Meditation(imagePath: 'https://theselflovebible.com.au/wp-content/uploads/2021/02/Asset-1.png', title: 'Inner Power', desc: 'Your Inner Power Runs Deep', long_desc: 'Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim ',),
          Meditation(imagePath: 'https://theselflovebible.com.au/wp-content/uploads/2021/02/Asset-5.png', title: 'Self Worth', desc: 'What do you think about yourself?', long_desc: 'Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim ',),
          Meditation(imagePath: 'https://theselflovebible.com.au/wp-content/uploads/2021/02/Asset-6.png', title: 'Anxiety', desc: 'Anxiety does NOT run our lives', long_desc: 'Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim Lorum ipsim ',),

        ],
      ),
    );
  }
}


class Meditation extends StatefulWidget {
  const Meditation({Key? key, required this.imagePath, required this.title, required this.desc, required this.long_desc}) : super(key: key);
  final imagePath;
  final title;
  final desc;
  final long_desc;
  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) =>
                  MeditationDetails(title: widget.title, desc: widget.desc, long_desc: widget.long_desc, imagePath: widget.imagePath,)
          ),
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
                child: Text('${widget.title}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,bottom: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('${widget.desc}', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),)),
          ),
        ],
      ),
    );
  }
}
