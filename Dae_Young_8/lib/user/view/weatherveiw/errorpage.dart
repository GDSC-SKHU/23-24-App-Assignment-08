import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Get.toNamed('/splash');
        },
        child: const Text('home'),
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
