import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginweather/main.dart';
import 'package:loginweather/weather.dart';
import 'package:loginweather/weather_State.dart';
import 'package:loginweather/error_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Shell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/weather',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => Weather(),
      routes: <RouteBase>[
        GoRoute(
          path: '/weather',
          builder: (context, state) => Weather(),
          routes: <RouteBase>[
            GoRoute(
              path: 'weatherState',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => WeatherRouterState(),
            ),
          ],
        ),
        // 추가: /weatherState 경로에 대한 라우트
        GoRoute(
          path: '/weatherState',
          builder: (context, state) => WeatherRouterState(),
        ),
        
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()
  ),
  debugLogDiagnostics: true,
);

