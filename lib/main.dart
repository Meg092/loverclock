import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_time/pages/smile_main/binding.dart';
import 'package:smile_time/pages/smile_main/item_change.dart';
import 'package:smile_time/pages/smile_main/view.dart';
import 'package:smile_time/pages/smile_round/smile_round_binding.dart';
import 'package:smile_time/pages/smile_round/smile_round_view.dart';
import 'package:smile_time/pages/smile_setting/binding.dart';
import 'package:smile_time/pages/smile_setting/view.dart';

Color primaryColor = const Color(0xffa6b500);
Color bgColor = const Color(0xfff2f2f2);

Future<Uint8List> assetImageToUInt8List(String assetPath) async {
  final ByteData data = await rootBundle.load(assetPath);
  return data.buffer.asUint8List();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final allowPhoto = prefs.getBool('allowPhoto');

  if (allowPhoto == null) {
    await prefs.setBool('allowPhoto', true);
    await prefs.setBool('showSticker', true);
    for(int i = 0; i < 4; i++) {
      final img = await assetImageToUInt8List('assets/bg$i.png');
      await prefs.setString('bg$i', base64Encode(img));
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Umile,
      initialRoute: '/',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          colorScheme: ColorScheme.light(
            primary: primaryColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: primaryColor,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          )),
    );
  }
}
List<GetPage<dynamic>> Umile = [
  GetPage(name: '/', page: () => SmileRoundView(), binding: SmileRoundBinding()),
  GetPage(name: '/smile_init', page: () => const SmileMainPage(), binding: SmileMainBinding()),
  GetPage(name: '/smile_change', page: () => ItemChange()),
  GetPage(name: '/smile_setting', page: () => SmileSettingPage(), binding: SmileSettingBinding()),
];