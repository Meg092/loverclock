import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SmileSettingLogic extends GetxController {

  var allowPhoto = true.obs;
  var showSticker = true.obs;
  var appVersion = "1.0.0".obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    allowPhoto.value = prefs.getBool('allowPhoto') ?? true;
    showSticker.value = prefs.getBool('showSticker') ?? true;
    var info = await PackageInfo.fromPlatform();
    appVersion.value = info.version;
    super.onInit();
  }

}
