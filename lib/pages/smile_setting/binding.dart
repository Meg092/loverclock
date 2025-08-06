import 'package:get/get.dart';

import 'logic.dart';

class SmileSettingBinding extends Bindings {
  @override
  void dependencies() {
    return Get.lazyPut(() => SmileSettingLogic());
  }
}