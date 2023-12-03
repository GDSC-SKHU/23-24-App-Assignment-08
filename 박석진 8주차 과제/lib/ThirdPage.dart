// ThirdPage.dart
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Third Page", style: TextStyle(color: Colors.deepPurple))),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 100, color: Colors.deepPurple),
            SizedBox(height: 20),
            Text(
              "Third Page",
              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}
