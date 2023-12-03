import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Login/View/Loginscreen.dart';
import 'package:state_management/Login/ViewModel/Token.dart';
import 'package:get/get.dart';
import 'package:state_management/Weather/View/MainScreen.dart';
import 'package:go_router/go_router.dart';
//import 'package:state_management/Login/View/Loginscreen.dart';
import 'package:state_management/Weather/View/storageScreen.dart';
import 'package:state_management/Weather/View/weatherSearchScreen.dart';
import 'package:state_management/Weather/View/ErrorScreen.dart';

void main() {
  runApp(const MyApp());
}

//bottomnavigationbar에 인덱스에 따라 다른 경로명 리턴
String getPathForIndex(int index) {
  switch (index) {
    case 0:
      return '/WeatherSearch';
    case 1:
      return '/mains';
    case 2:
      return '/storage';
    default:
      return '/';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //constructor

  @override
  Widget build(BuildContext context) {
    //create: (context) => LoginToken();
    final router = GoRouter(
      redirect: (context, state) {
        return '/'; //기본 화면으로 return
      },
      //Go_Router의 속성을 이용해서 경로 지정
      routes: [
        ShellRoute(
          routes: <RouteBase>[
            GoRoute(
                path: "/", builder: (context, state) => const LoginScreen()),
            GoRoute(
                path: '/WeatherSearch',
                builder: (context, state) => WeatherSearchScreen(
                      initialCity: state.toString(),
                    )),
            GoRoute(
              path: '/storage',
              builder: (context, state) => StorageScreen(),
            ),
            GoRoute(
              path: '/login',
              builder: (context, state) => const LoginScreen(),
            ),
            GoRoute(
                path: '/mains',
                builder: (context, state) => const MainScreen()),
          ],
          builder: (context, state, child) => Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search Page'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'MainScreen Page'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.storage), label: 'Storaged Page'),
              ],
              onTap: (index) {
                context.go(getPathForIndex(index));
              },
            ),
          ),
        ),
      ],
      errorBuilder: (context, state) => ErrorScreen(
        error: state.error.toString(),
      ),
      debugLogDiagnostics: true,
    );

    return GetMaterialApp.router(
      // bottomnavigatorbar의 상태를 관리하기 위한 설정
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 227, 242, 255),
        appBarTheme: const AppBarTheme(
          shadowColor: Color.fromARGB(255, 227, 242, 255),
        ),
      ),
    );
  }
}
