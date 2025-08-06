import 'package:get/get.dart';

import 'logic.dart';

class SmileMainBinding extends Bindings {
  @override
  void dependencies() {
    return Get.lazyPut(() => SmileMainLogic());
  }
}