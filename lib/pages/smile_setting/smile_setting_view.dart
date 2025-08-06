import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'smile_setting_logic.dart';

class SmileSettingPage extends GetView<SmileSettingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Setting',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              width: double.infinity,
              height: 51,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: <Widget>[
                const Text('Wallpaper replacement is allowed'),
                Obx(() {
                  return Switch(
                      value: controller.allowPhoto.value,
                      activeTrackColor: Colors.green,
                      onChanged: (v) async {
                        controller.allowPhoto.value = v;
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('allowPhoto', v);
                      });
                })
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ).decorated(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffeaeaea)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 51,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: <Widget>[
                const Text('Display texture'),
                Obx(() {
                  return Switch(
                      value: controller.showSticker.value,
                      activeTrackColor: Colors.green,
                      onChanged: (v ) async {
                        controller.showSticker.value = v;
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('showSticker', v);
                      });
                })
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ).decorated(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffeaeaea)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 51,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: <Widget>[
                const Text('Version'),
                Obx(() {
                  return Text(
                    controller.appVersion.value,
                    style: const TextStyle(color: Colors.grey),
                  );
                })
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ).decorated(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffeaeaea)),
            )
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
