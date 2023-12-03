import 'package:get/get.dart';

// 저장과 관련된 클래스
class StorageController extends GetxController {
  final List<String> weatherList = <String>[].obs.toList();
/*obs는 변수를 관찰 가능한 Rx 타입으로 변환해줍니다. 하지만 여기서는 weatherList를 toList 메소드를 이용하여 일반적인 리스트로 변환하고 있습니다. 이는 변화를 직접 감지할 수 없습니다. 일반적인 리스트를 사용하고 싶다면 아래의 리스트를 변환하는 메소드들에 update 메소드를 추가하거나, 그게 아니라면 weatherList를 RxList로 선언해야 합니다.*/
  void addWeather(String weather) {
    weatherList.add(weather);

    update();
  }

// 날씨를 지우는 함수
  void removeWeather(String weather) {
    weatherList.remove(weather);

    update();
  }

//데이터 저장하는 메소드
  void saveData(String data) {
    addWeather(data);

    update();
  }
}
