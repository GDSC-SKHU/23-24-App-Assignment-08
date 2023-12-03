// main.dart
import 'package:flutter/material.dart';
import 'router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const RouteExample());
}

class Storage {
  static final Storage _instance = Storage._internal();

  factory Storage() {
    return _instance;
  }

  Storage._internal();

  static List<String> weatherList = [];
}

class RouteExample extends StatelessWidget {
  const RouteExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

// NavBarWidget
class NavBarWidget extends StatelessWidget {
  const NavBarWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.teal),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.orange),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.deepPurple),
            label: 'Third',
          ),
        ],
        onTap: (index) => _onItemTapped(index, context),
        currentIndex: _calculateIndex(context),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/First');
        break;
      case 1:
        GoRouter.of(context).go('/Second');
        break;
      case 2:
        GoRouter.of(context).go('/Third');
        break;
    }
  }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location == '/First') {
      return 0;
    }
    if (location == '/Second') {
      return 1;
    }
    if (location == '/Third') {
      return 2;
    }
    return 0;
  }
}
