// 현재 시간 정보를 출력하기 위해 생성한 클래스
class TimeInfo {
  DateTime dt = DateTime.now();
  String datetime = '';

  String currentTime() {
    datetime = '$dt';
    return datetime;
  }
}
