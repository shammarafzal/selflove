import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Components/meditation_details.dart';
import 'Routes/route.dart';
import 'dart:async';

late AudioHandler audioHandler;
var mediaUrl = "";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );

  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/intro',
        getPages: Routes.routes),
  );
}
