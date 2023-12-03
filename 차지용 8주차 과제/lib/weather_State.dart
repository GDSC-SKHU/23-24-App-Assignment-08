
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'DB/get_controller.dart';
import 'RouterDB/router_go.dart';
import 'package:loginweather/weather.dart';
import 'package:loginweather/main.dart';
import 'package:go_router/go_router.dart';


class WeatherRouterState extends StatelessWidget {
  const WeatherRouterState({Key? key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<Controller>(
          builder: (_controller) => ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${_controller.buffer}"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) =>_onItemTapped(index, context),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Weather'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud), label: 'WeatherState'),
        ],
      ),
    );
  }
}
