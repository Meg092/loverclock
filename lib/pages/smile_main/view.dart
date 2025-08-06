import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_time/pages/smile_main/first_item.dart';
import 'package:smile_time/pages/smile_main/fourth_item.dart';
import 'package:smile_time/pages/smile_main/second_item.dart';
import 'package:smile_time/pages/smile_main/third_item.dart';
import 'package:styled_widget/styled_widget.dart';

import 'logic.dart';

class SmileMainPage extends StatefulWidget {
  const SmileMainPage({super.key});

  @override
  State<SmileMainPage> createState() => _SmileMainPageState();
}

class _SmileMainPageState extends State<SmileMainPage> {
  SmileMainLogic controller = Get.find();

  final _pageController = PageController();

  void _onPageChanged(int index) {
    controller.currentPage = index;
    controller.update();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == controller.currentPage
              ? Colors.white
              : Colors.white.withAlpha(89),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmileMainLogic>(builder: (_) {
      var items = [
        Obx(() {
          return FirstItem(
            controller.bgImage0,
            showSticker: controller.showSticker.value,
          );
        }),
        Obx(() {
          return SecondItem(
            controller.bgImage1,
            showSticker: controller.showSticker.value,
          );
        }),
        Obx(() {
          return ThirdItem(
            controller.bgImage2,
            showSticker: controller.showSticker.value,
          );
        }),
        Obx(() {
          return FourthItem(
            controller.bgImage3,
            showSticker: controller.showSticker.value,
          );
        })
      ];
      return Scaffold(
        body: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: items,
          ),
          Positioned(
              top: 20,
              right: MediaQuery
                  .of(context)
                  .padding
                  .right + 20,
              child: <Widget>[
                Obx(() {
                  return Visibility(
                      visible: controller.allowPhoto.value,
                      child: Image.asset(
                        'assets/icon0.png',
                        fit: BoxFit.cover,
                      ).gestures(onTap: () {
                        controller.selectBGImage();
                      }));
                }),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/icon1.png',
                  fit: BoxFit.cover,
                ).gestures(onTap: () {
                  Get.toNamed('/smile_setting')?.then((_) {
                    controller.getData();
                  });
                }),
              ].toRow(mainAxisAlignment: MainAxisAlignment.end)),
          Positioned(
            bottom: MediaQuery
                .of(context)
                .padding
                .bottom,
            left: 0,
            right: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  items.length,
                      (index) => _buildDot(index),
                )),
          ),
        ].toStack(),
      );
    });
  }
}
