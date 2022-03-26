import 'package:biometric_authtentication/App/Controller/Controller.dart';
import 'package:get/get.dart';

class Biometric extends Bindings {
  @override
  void dependencies() {
    Get.put(ViewPageController());
  }
}
