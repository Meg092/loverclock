import 'dart:convert';
import 'dart:typed_data';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SmileMainLogic extends GetxController {
  int currentPage = 0;

  var allowPhoto = true.obs;
  var showSticker = true.obs;

  Uint8List? bgImage0;
  Uint8List? bgImage1;
  Uint8List? bgImage2;
  Uint8List? bgImage3;

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bgImage0 = base64Decode(prefs.getString('bg0') ?? '');
    bgImage1 = base64Decode(prefs.getString('bg1') ?? '');
    bgImage2 = base64Decode(prefs.getString('bg2') ?? '');
    bgImage3 = base64Decode(prefs.getString('bg3') ?? '');
    allowPhoto.value = prefs.getBool('allowPhoto') ?? true;
    showSticker.value = prefs.getBool('showSticker') ?? true;
    update();
  }

  void selectBGImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(
          imageQuality: 90, maxWidth: 1024, source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        switch (currentPage) {
          case 0:
            bgImage0 = imageBytes;
            await prefs.setString('bg0', base64Encode(imageBytes));
            break;
          case 1:
            bgImage1 = imageBytes;
            await prefs.setString('bg1', base64Encode(imageBytes));
            break;
          case 2:
            bgImage2 = imageBytes;
            await prefs.setString('bg2', base64Encode(imageBytes));
            break;
          case 3:
            bgImage3 = imageBytes;
            await prefs.setString('bg3', base64Encode(imageBytes));
        }
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
