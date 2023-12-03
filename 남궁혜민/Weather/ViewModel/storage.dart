import 'package:flutter/widgets.dart';
import 'package:state_management/Weather/Model/Data/TimeInfo.dart';
import 'package:state_management/Weather/View/MainScreen.dart';
import 'package:state_management/Weather/Model/Location_Model.dart';

class Storage extends ChangeNotifier {
  // 현재시간 저장
  String? time;
  final TimeInfo _ti = TimeInfo();
  // 메소드 이름 더 정확하게 적기
  void saveCurrentData(time) {
    this.time = time;
    notifyListeners();
  }

// locationModel로 받아온 정보들 배열에 저장
  List<LocationModel> saveLocation = [];
}
