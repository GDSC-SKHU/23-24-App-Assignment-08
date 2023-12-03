import 'package:get/get.dart';
import 'package:state_management/Weather/Model/Data/TimeInfo.dart';
import 'package:state_management/Weather/Model/Data/picture.dart';
import 'package:state_management/Weather/Model/Data/weatherData.dart';
import 'package:state_management/Weather/Model/location_Model.dart';

//일단 지워보자 우리 ,,
class WeatherMain {
  String city = '';
  LocationModel currentLocation = LocationModel();
  WeatherData? weatherData;
  final WeatherPicture picture = WeatherPicture();

  void fetchCity() async {
    city = await currentLocation.getMyCurrentLocation1();
  }
}

class WeatherController extends GetxController {
  final LocationModel locationModel = LocationModel();
  final WeatherPicture picture = WeatherPicture();
  final TimeInfo time = TimeInfo();

  var city = ''.obs;
  var weatherData = Rx<WeatherData?>(null);
  var searchCity = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCityName();
  }

  void fetchCityName() async {
    city.value = await locationModel.getMyCurrentLocation1();
  }

  Future<WeatherData?> getWeatherData(String cityName) async {
    try {
      var data = await locationModel.getWeather(cityName);
      searchCity.value = cityName; // 검색한 도시 이름을 저장합니다.
      return weatherData.value;
    } catch (e) {
      rethrow;
    }
  }
}
