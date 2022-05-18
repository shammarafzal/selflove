import 'package:flutter/material.dart';
import 'customButton.dart';


class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key, required this.title, required this.desc, required this.long_desc, required this.day, required this.challenge_msg1, required this.challenge_msg2, required this.challenge_msg3,}) : super(key: key);
  final title;
  final desc;
  final long_desc;
  final day;
  final challenge_msg1;
  final challenge_msg2;
  final challenge_msg3;
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('${widget.title}'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(254,176,149, 1),
      ),
      body: Container(
        color: Colors.cyan,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.day, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.desc, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white), textAlign: TextAlign.center,),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.long_desc, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white), textAlign: TextAlign.center,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(title: 'Challenge 1', onPress: (){
                // alertScreen().showAlertBtnDialog(context, widget.challenge_msg1);
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(title: 'Challenge 2', onPress: (){
                // alertScreen().showAlertBtnDialog(context, widget.challenge_msg2);
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(title: 'Challenge 3', onPress: (){
                // alertScreen().showAlertBtnDialog(context, widget.challenge_msg3);
              }),
            )

          ],
        ),
      ),
    );
  }
}
