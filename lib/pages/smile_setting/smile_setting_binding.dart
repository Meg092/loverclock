import 'package:get/get.dart';

import 'smile_setting_logic.dart';

class SmileSettingBinding extends Bindings {
  @override
  void dependencies() {
    return Get.lazyPut(() => SmileSettingLogic());
  }
}