import 'package:flutter/material.dart';

import 'package:flutter_cfmid_1/user/view/splash_screen.dart';
import 'package:flutter_cfmid_1/user/view/weatherveiw/errorpage.dart';
import 'package:flutter_cfmid_1/user/view/weatherveiw/weatherlist.dart';
import 'package:flutter_cfmid_1/user/view/weatherveiw/weatherscreen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'NotoSnas'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/weather', page: () => const WeatherScreen()),
        GetPage(name: '/weatherlist', page: () => SecondPage()),
        GetPage(name: '/errorpage', page: () => const ErrorPage()),
      ],
    );
  }
}
