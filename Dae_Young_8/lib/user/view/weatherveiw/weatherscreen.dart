import 'package:flutter/material.dart'; //이게원본
import 'package:flutter_cfmid_1/user/view/weatherveiw/weatherlist.dart';
import 'package:get/get.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen(
      {super.key, this.parseWeatherData}); //네임드 argument를 통해서 입력받을 데이터를 전달받는곳
  final parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? temp;
  final MyController myController = Get.put(MyController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toInt();

    cityName = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$cityName',
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$temp',
                style: const TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                onPressed: () {
                  myController.addItemAndGoToSecondPage();
                },
                child: const Text('Add Current Time and Go to Second Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/errorpage');
                },
                child: const Text('errorpage'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Second Page',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // Named Router를 사용하여 '/weatherscreen' 페이지로 이동
            Get.toNamed('/splash');
          } else if (index == 1) {
            // Named Router를 사용하여 '/second' 페이지로 이동
            Get.toNamed('/weatherlist');
          }
        },
      ),
    );
  }
}

class MyController extends GetxController {
  RxList<String> timeList = <String>[].obs;
  RxString cityName = ''.obs;
  RxDouble temp = 0.0.obs;

  void addItemAndGoToSecondPage() {
    DateTime now = DateTime.now();
    String currentTime = '${now.hour}:${now.minute}:${now.second}';
    timeList.add(currentTime);

    Get.to(SecondPage());
  }
}
