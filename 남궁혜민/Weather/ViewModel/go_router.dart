import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// 확장으로 goRouter에 go 메소드 호출
extension GoRouterContextExtensions on BuildContext {
  void go(String path) {
    GoRouter.of(this).go(path);
  }
}
