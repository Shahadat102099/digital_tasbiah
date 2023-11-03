import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  List<Map<String, dynamic>> citiesData = [];

  @override
  void initState() {
    super.initState();
    String jsonData = '''
      [
        {
          "city": "New York",
          "temperature": 20,
          "condition": "Clear",
          "humidity": 60,
          "windSpeed": 5.5
        },
        {
          "city": "Los Angeles",
          "temperature": 25,
          "condition": "Sunny",
          "humidity": 50,
          "windSpeed": 6.8
        },
        {
          "city": "London",
          "temperature": 15,
          "condition": "Partly Cloudy",
          "humidity": 70,
          "windSpeed": 4.2
        },
        {
          "city": "Tokyo",
          "temperature": 28,
          "condition": "Rainy",
          "humidity": 75,
          "windSpeed": 8.0
        },
        {
          "city": "Sydney",
          "temperature": 22,
          "condition": "Cloudy",
          "humidity": 55,
          "windSpeed": 7.3
        }
      ]
    ''';

    List<dynamic> jsonDataList = json.decode(jsonData);

    setState(() {
      citiesData = jsonDataList.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: ListView.builder(
        itemCount: citiesData.length,
        itemBuilder: (BuildContext context, int index) {
          var cityData = citiesData[index];
          return Card(
            child: ListTile(
              title: Text(cityData['city']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Temperature: ${cityData['temperature']}°C'),
                  Text('Condition: ${cityData['condition']}'),
                  Text('Humidity: ${cityData['humidity']}%'),
                  Text('Wind Speed: ${cityData['windSpeed']} km/h'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
