
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AdminloginController extends GetxController {

  final cEmail = TextEditingController();
  RxString email = ''.obs;
  bool isValidEmail = false;

  final cPassword = TextEditingController();
  RxString password = ''.obs;
  bool isValidPassword = false;

  RxBool isValidForm = false.obs;
  RxBool isLoading = false.obs;

  void setEmail(String value) {
    email(value);
    if (email.value.isNotEmpty) {
      isValidEmail = true;
    } else {
      isValidEmail = false;
    }
    validateForm();
  }

  void setPassword(String value) {
    password(value);
    if (password.value.isNotEmpty) {
      isValidPassword = true;
    } else {
      isValidPassword = false;
    }
    validateForm();
  }

  void validateForm() {
    if (isValidEmail && isValidPassword) {
      isValidForm(true);
    } else {
      isValidForm(false);
    }
  }

  // Future<void> login() async {
  //   try {
  //     AppUtils.dismissKeyboard();
  //     isLoading(true);
  //
  //     final firebaseAuth = FirebaseAuth.instance;
  //
  //     await firebaseAuth.signInWithEmailAndPassword(
  //       email: email.value,
  //       password: password.value,
  //     );
  //
  //     await Future.delayed(const Duration(seconds: 1));
  //
  //     isLoading(false);
  //
  //     await Future.delayed(const Duration(milliseconds: 220));
  //
  //     await Get.offNamed(Routes.HOME);
  //   } catch (e) {
  //     isLoading(false);
  //     showPopUpInfo(title: 'Error', description: e.toString());
  //     logSys(e.toString());
  //   }
  // }
}