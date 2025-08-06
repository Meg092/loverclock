import 'package:get/get.dart';

import 'smile_round_logic.dart';

class SmileRoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SmileRoundLogic(),
      permanent: true,
    );
  }
}
