import 'package:flutter/material.dart';
import 'package:flutter_cfmid_1/user/view/weatherveiw/weatherscreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SecondPage extends StatelessWidget {
  final MyController myController = Get.find<MyController>();

  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: myController.timeList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(myController.timeList[index]),
            );
          },
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
