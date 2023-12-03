import 'package:flutter/material.dart';
import 'package:state_management/Weather/Model/Data/WeatherData.dart';
import 'package:state_management/Weather/Model/Data/picture.dart';
import 'package:state_management/Weather/Model/Location_Model.dart';
import 'package:state_management/Weather/View/weatherSearchScreen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management/main.dart';

// 로그인하고 바로 이동하는 페이지
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController searchEditingController = TextEditingController();

  final LocationModel _weatherLocation = LocationModel();
  WeatherData? _weatherData;
  final WeatherPicture _picture = WeatherPicture();
// 현재 위치를 받아온 것을 바탕으로 저장되어있던 position을  도시 이름에 저장
  _fetchWeather() async {
    String cityName = await _weatherLocation.getMyCurrentLocation1();

    try {
      _weatherData = await _weatherLocation.getWeather(cityName);
      setState(() {});
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: searchEditingController,
                  decoration: InputDecoration(
                      helperText: '도시 입력',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          context.go('$searchEditingController.value.text');
                          /*  Get.to(() => WeatherSearchScreen(
                              initialCity: searchEditingController.value.text));*/
                        }, //weatherScreen으로 searchEditingController의 text값을 보냄
                        icon: const Icon(Icons.search),
                      )),
                ),
              ),
              if (_weatherData != null)
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      '도시',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      ' ${_weatherData!.cityName}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 50),
                    if (_weatherData != null)
                      _picture.getWeatherIcon(_weatherData!.condition)!,
                    Text(
                      '${_weatherData!.temp}°C',
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      '날씨',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      _weatherData!.conditionText,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              if (_weatherData == null) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
