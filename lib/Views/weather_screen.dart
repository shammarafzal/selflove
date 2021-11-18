import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  DateTime _focusedDay = DateTime.now();
  Weather? w;

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
    getCurrentLocation();
    return Container(
      height: 100,
      child: Card(
        elevation: 5,
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
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
              width: 100,
              child: Column(
                children: [
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
