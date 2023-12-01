import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Root');
// final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Shell');

void main() {
  runApp(const RouteExample());
}

class RouteExample extends StatelessWidget {
  const RouteExample({super.key});

  // final GoRouter _router = GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/First', routes: <RouteBase>[
  //   ShellRoute(
  //       navigatorKey: _shellNavigatorKey,
  //       builder: (context, state, child) => NavBarWidget(child: child),
  //       routes: <RouteBase>[
  //         GoRoute(path: '/First', builder: (context, state) => const FirstPage(), routes: <RouteBase>[
  //           GoRoute(
  //               path: 'details',
  //               parentNavigatorKey: _rootNavigatorKey,
  //               builder: (context, state) => const DetailPage(label: 'A'))
  //         ]),
  //         GoRoute(
  //           path: '/Second',
  //           builder: (context, state) => const SecondPage(),
  //         ),
  //         GoRoute(
  //           path: '/Third',
  //           builder: (context, state) => const ThirdPage(),
  //         ),
  //       ]),
  // ]);

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

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
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

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Column(
            children: [
              Text("First Page"),
            ],
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Column(
            children: [
              Text("Second Page"),
            ],
          ),
        ));
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Column(
            children: [
              Text("Third Page"),
            ],
          ),
        ));
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
        ),
        body: Center(
          child: Text("Detail for $label"),
        ));
  }
}
