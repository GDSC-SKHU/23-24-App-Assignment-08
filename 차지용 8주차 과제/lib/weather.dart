import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'DB/get_controller.dart';
import 'RouterDB/router_go.dart';
import 'package:go_router/go_router.dart'; 
import 'package:loginweather/weather_State.dart';



class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  static String weatherState = '';
  String API_KEY = '5a271a50327b9a021ef3cc5f04d3ca02';
  IconData weatherIcon = Icons.cloud;
  final Controller _controller = Controller();

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/weather');
        break;
      case 1:
        GoRouter.of(context).go('/weather/weatherState');
        break;
    }
  }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location == '/weather') {
      return 0;
    }
    if (location.startsWith('/weatherState')) {
      return 1;
    }
    return 0;
  }

  Future<void> getPosition() async {
    print('Getting position...');
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permission denied');
    } else if (permission == LocationPermission.deniedForever) {
      print('Location permission denied forever');
    } else {
      print('Location permission granted');
    }
    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    getWeather(
        lat: currentPosition.latitude.toString(),
        lon: currentPosition.longitude.toString());
  }

  Future<void> getWeather({required String lat, required String lon}) async {
    print('날씨 정보 가져오는 중...');
    var response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$API_KEY&units=metric'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      DateTime currentTime = DateTime.now();
      _controller.timeState = currentTime.toString();

      setState(() {
        _controller.locationState = '${data['name']}';
        weatherState = '${data['main']['temp']}°C ';
        _controller.tempData = '${data['weather'][0]['description']}';
        weatherIcon = getWeatherIcon(data['weather'][0]['id']);
      });

      // Controller 클래스의 buffer 리스트를 업데이트
      _controller.saveState();
    } else {
      throw Exception('날씨 데이터를 불러오는 데 실패했습니다');
    }
  }

  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return Icons.bolt;
    } else if (condition < 400) {
      return Icons.umbrella;
    } else if (condition < 600) {
      return Icons.beach_access;
    } else if (condition < 700) {
      return Icons.snowing;
    } else if (condition < 800) {
      return Icons.foggy;
    } else if (condition == 800) {
      return Icons.wb_sunny;
    } else if (condition <= 804) {
      return Icons.cloud;
    } else {
      return Icons.error_outline;
    }
  }

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  void updateState(String location, String temp, String time) {
    setState(() {
      _controller.locationState = location;
      _controller.tempData = temp;
      _controller.timeState = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.cloud,
              size: 20,
              color: Colors.lightBlue,
            ),
            const SizedBox(height: 10),
            Text(
              _controller.timeState,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _controller.locationState,
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 30),
            Icon(
              weatherIcon,
              size: 70,
              color: Colors.yellow,
            ),
            const SizedBox(height: 30),
            Text(
              weatherState,
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(height: 10),
            Text(
              _controller.tempData,
              style: TextStyle(fontSize: 20),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controller.saveState();
                    print(_controller.buffer);
                  });
                },
                child: Text(
                  "상태 정보 저장",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: controller.newyorkState,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent),
                ),
                child: Text(
                  "특정 지역 정보",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            getPosition();
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Weather'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud), label: 'WeatherState'),
        ],
      ),
    );
  }
}
