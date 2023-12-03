import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//에러 스크린
class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('에러'),
      ),
      body: ListView(children: [
        Text('에러는? $error'),
        ElevatedButton(
          //에러일때 그전 화면으로 돌아가기
          onPressed: () => context.go('/'),
          child: const Text('이전화면으로 돌아가기'),
        )
      ]),
    );
  }
}
