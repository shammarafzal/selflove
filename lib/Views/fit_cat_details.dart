import 'package:flutter/material.dart';

import 'VideosViewer/VideosScreen.dart';

class FitCatDetails extends StatefulWidget {
  const FitCatDetails({Key? key, required this.title, required this.desc, required this.image, required this.videoLink}) : super(key: key);
  final title;
  final desc;
  final image;
  final videoLink;
  @override
  _FitCatDetailsState createState() => _FitCatDetailsState();
}

class _FitCatDetailsState extends State<FitCatDetails> {
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
        // color: Colors.blueAccent,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: Colors.black),),
              ),
            ),
            Container(
                height: 310,
                child: VideosViewer(videoLink: widget.videoLink,)),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.desc, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black), textAlign: TextAlign.center,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
