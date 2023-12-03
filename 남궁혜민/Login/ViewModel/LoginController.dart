import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs; //.obs를 이용해 변수들 상태관리
  var idErrorText = ''.obs;
  var pwErrorText = ''.obs;

  void login() {
    isLoggedIn.value = true; // 로그인 상태 변경
  }

  void clearIdErrorText() {
    idErrorText.value = '';
  }

  void clearPwErrorText() {
    pwErrorText.value = '';
  }
}
