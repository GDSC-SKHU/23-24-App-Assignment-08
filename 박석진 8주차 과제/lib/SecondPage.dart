
import 'package:flutter/material.dart';
import 'main.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Second Page", style: TextStyle(color: Colors.orange))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 100, color: Colors.orange),
            SizedBox(height: 20),
            Text(
              "Second Page",
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            SizedBox(height: 20),
            Text(
              "날씨 저장 리스트:",
              style: TextStyle(fontSize: 16),
            ),
            for (String weather in Storage.weatherList)
              Text(
                weather,
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
