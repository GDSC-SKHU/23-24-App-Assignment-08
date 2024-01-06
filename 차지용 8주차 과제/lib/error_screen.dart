
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


class ErrorScreen extends StatelessWidget {
    final String error; 

  ErrorScreen({required this.error}); 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Column(children: [
        ElevatedButton(
          onPressed: () => context.go('/weather'),
          child: Text('Error Screen'),
        ),

      ]),)
    );
  }
}


