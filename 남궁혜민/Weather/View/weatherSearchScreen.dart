import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management/Weather/Model/Data/TimeInfo.dart';
import 'package:state_management/Weather/Model/Data/picture.dart';
import 'package:state_management/Weather/Model/Data/WeatherData.dart';
import 'package:state_management/Weather/Model/Location_Model.dart';
import 'package:state_management/Weather/View/storageScreen.dart';
import 'package:state_management/Weather/ViewModel/storageController.dart';
import 'package:state_management/Weather/ViewModel/weatherMain.dart';

//검색을 했을 때 나오는 화면
class WeatherSearchScreen extends StatefulWidget {
  final String initialCity;
  const WeatherSearchScreen({Key? key, required this.initialCity})
      : super(key: key);

  @override
  _WeatherSearchScreenState createState() => _WeatherSearchScreenState();
}

class _WeatherSearchScreenState extends State<WeatherSearchScreen> {
  final LocationModel locationModel = LocationModel();
  final WeatherPicture picture = WeatherPicture();
  final TimeInfo time = TimeInfo();
  final WeatherController controller = Get.put(WeatherController());
  final storageController = Get.put(StorageController());

  WeatherData? weatherData;
  String cityName = '';

  @override
  void initState() {
    super.initState();
    controller.getWeatherData(widget.initialCity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (weatherData != null)
                  const SizedBox(
                    height: 80,
                  ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          '도시',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          weatherData != null
                              ? ' ${controller.weatherData.value!.cityName}'
                              : '',
                          style: const TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    if (weatherData != null)
                      controller.picture
                          .getWeatherIcon(weatherData!.condition)!,
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  weatherData != null
                      ? '${controller.weatherData.value!.temp}°C'
                      : '',
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 30),
                const Text(
                  '날씨',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  weatherData != null
                      ? '${controller.weatherData.value!.conditionText}°C'
                      : '',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    storageController.saveData(time.currentTime());
                    //  Get.to(() => StorageScreen()); //GetMaterialApp으로 감싸기
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 150,
                      vertical: 15,
                    ),
                    backgroundColor: Colors.black38,
                  ),
                  child: const Text(
                    '저장',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                if (weatherData == null) const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
