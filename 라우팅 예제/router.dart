import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/main.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Shell');

final GoRouter router = GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/First', routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => NavBarWidget(child: child),
        routes: <RouteBase>[
          GoRoute(path: '/First', builder: (context, state) => const FirstPage(), routes: <RouteBase>[
            GoRoute(
                path: 'details',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const DetailPage(label: 'A'))
          ]),
          GoRoute(
            path: '/Second',
            builder: (context, state) => const SecondPage(),
          ),
          GoRoute(
            path: '/Third',
            builder: (context, state) => const ThirdPage(),
          ),
        ]),
  ]);
