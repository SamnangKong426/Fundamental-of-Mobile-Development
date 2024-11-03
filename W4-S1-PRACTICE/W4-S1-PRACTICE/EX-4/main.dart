import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:const <Widget>[
                  WeatherForecast(
                    condition: WeatherCondition.Sunny,
                    temperature: [15, 3],
                    day: DayOfWeek.Sun,
                  ),
                  SizedBox(width: 10),
                  WeatherForecast(
                    condition: WeatherCondition.Rainy,
                    temperature: [10, 2],
                    day: DayOfWeek.Mon,
                  ),
                  SizedBox(width: 10),
                  WeatherForecast(
                    condition: WeatherCondition.Cloudy,
                    temperature: [12, 4],
                    day: DayOfWeek.Tue,
                  ),
                  SizedBox(width: 10),
                  WeatherForecast(
                    condition: WeatherCondition.Snowy,
                    temperature: [5, -1],
                    day: DayOfWeek.Wed,
                  ),
                  SizedBox(width: 10),
                  WeatherForecast(
                    condition: WeatherCondition.Sunny,
                    temperature: [15, 3],
                    day: DayOfWeek.Thu,
                  ),
                  SizedBox(width: 10),
                  WeatherForecast(
                    condition: WeatherCondition.Rainy,
                    temperature: [10, 2],
                    day: DayOfWeek.Fri,
                  ),
                  SizedBox(width: 10),
                  WeatherForecast(
                    condition: WeatherCondition.Cloudy,
                    temperature: [12, 4],
                    day: DayOfWeek.Sat,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum WeatherCondition {
  Sunny,
  Rainy,
  Cloudy,
  Snowy,
}

enum DayOfWeek {
  Mon, Tue, Wed, Thu, Fri, Sat, Sun
}

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({
    super.key,
    required this.condition,
    required this.temperature,
    required this.day,
  });

  final WeatherCondition condition;
  final List<int> temperature;
  final DayOfWeek day;

  @override
  Widget build(BuildContext context) {
    // Set icon and color based on weather condition
    IconData iconData;
    Color iconColor;

    switch (condition) {
      case WeatherCondition.Sunny:
        iconData = Icons.wb_sunny;
        iconColor = Colors.yellow;
        break;
      case WeatherCondition.Rainy:
        iconData = Icons.umbrella;
        iconColor = Colors.blue;
        break;
      case WeatherCondition.Cloudy:
        iconData = Icons.cloud;
        iconColor = Colors.grey;
        break;
      case WeatherCondition.Snowy:
        iconData = Icons.ac_unit;
        iconColor = Colors.lightBlue;
        break;
    }

    return Container(
      width: 125,
      height: 175,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            iconData,
            color: iconColor,
            size: 75,
          ),
          const SizedBox(height: 10),
          Text(
            "${temperature[0]}° - ${temperature[1]}°",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
