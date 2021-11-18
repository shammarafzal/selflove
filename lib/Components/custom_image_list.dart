import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';

class ImagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth * 1,
      height: SizeConfig.screenHeight * 0.2,
      child: ImagesListView(
        image_location: 'assets/sp-1.png',
      ),
    );
  }
}

class ImagesListView extends StatelessWidget {
  final String image_location;

  ImagesListView({
    required this.image_location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: SizeConfig.screenWidth * 1,
        child: ListTile(
          title: Image.asset(
            image_location,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
