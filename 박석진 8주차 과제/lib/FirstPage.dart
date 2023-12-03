import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late String weatherInfo = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherInfo();
  }

  Future<void> fetchWeatherInfo() async {
    final apiKey = '423e3538b9221108f42027e6edf96df4';
    final city = 'seoul'; // 서울 위치 하드코딩
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body);
        final temperature = weatherData['main']['temp'];
        final description = weatherData['weather'][0]['description'];

        setState(() {
          weatherInfo = 'Temperature: $temperature\nDescription: $description';
        });
      } else {
        setState(() {
          weatherInfo = 'Failed to fetch weather data';
        });
      }
    } catch (e) {
      setState(() {
        weatherInfo = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page", style: TextStyle(color: Colors.teal))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, size: 100, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              "First Page",
              style: TextStyle(fontSize: 20, color: Colors.teal),
            ),
            SizedBox(height: 20),
            if (weatherInfo != null)
              Text(
                weatherInfo,
                style: TextStyle(fontSize: 16),
              ),
            ElevatedButton(
              onPressed: () {
                Storage.weatherList.add(weatherInfo);
                print('Weather info added to the list: $weatherInfo');
              },
              child: Text("날씨 저장"),
            ),
          ],
        ),
      ),
    );
  }
}