import 'package:flutter/material.dart';
import 'package:loginweather/weather.dart';
import 'package:loginweather/login2.dart';
import 'DB/data.dart';
import 'package:loginweather/splash_screen.dart';
import 'package:loginweather/weather_State.dart';
import 'RouterDB/router_go.dart';
import 'package:go_router/go_router.dart'; 

void main() {
  runApp(const RouteExample());
}

class RouteExample extends StatelessWidget {
  const RouteExample({super.key});
  @override
  Widget build(BuildContext context) {
    //MaterialApp.router로 최상위 위젯을 감싸는 경우 라우팅의 방식이 달라진다.
    //일반적인 MaterialApp은 스택으로 라우팅을 관리하지만, MaterialApp.router는 Page 객체의 목록을 사용하여 라우팅을 관리한다.
    //더욱 세밀한 라우팅 제어를 가능하게 한다.
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router, //라우터 설정
    );
  }
}