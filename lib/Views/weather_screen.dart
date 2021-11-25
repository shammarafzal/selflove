import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  DateTime _focusedDay = DateTime.now();
  Weather? w;
  // final String weatherCode;

  void getCurrentLocation() async {
    double lat = 55.0111;
    double lon = 15.0569;
    String key = '856822fd8e22db5e1ba48c0e7d69844a';
    String cityName = 'Kongens Lyngby';
    WeatherFactory wf = WeatherFactory(key);
    w = await wf.currentWeatherByCityName(cityName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    getCurrentLocation();
    return Container(
      height: 100,
      child: Card(
        elevation: 5,
        color: Color.fromRGBO(254,176,149, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Today', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${_focusedDay.day}-${_focusedDay.month}-${_focusedDay.year}', style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.4,
              child: Column(
                children: [
                  Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: BoxedIcon(WeatherIcons.day_sunny, color: Colors.white,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${w?.temperature}', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
