import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  String locationState = ''; // 위치
  String tempData = ''; // 현재 날씨 상태를 저장하는 변수
  String timeState = ''; // 현재 시간의 상태를 저장하는 변수

  // 뉴욕의 위도와 경도 값 설정
  double newYorkLatitude = 40.7128;
  double newYorkLongitude = -74.0060;
  List<dynamic> buffer = []; // 현재 시간, 위치, 날씨 정보를 리스트에 저장할 변수

  String locationMessage = '';

  List<dynamic> buffer2 = []; // 특정 지역의 정보를 저장할 변수

void saveState() {
  List<String> stateInfo = [
    "위치 ${locationState}",
    "날씨: ${tempData}",
    "시간: ${timeState}",
  ];
  buffer.clear();
  buffer.addAll(stateInfo);
  update(); 
  print(buffer);
}
    void newyorkState(){ //  뉴욕 지역정보를 저장하고 해당 지역의 정보를 받아올 함수
    locationMessage = "뉴욕의 위치 - 위도: $newYorkLatitude, 경도: $newYorkLongitude";
    buffer2.clear();
    buffer2.add(locationMessage);
    update();
    print(buffer2);
  }
}