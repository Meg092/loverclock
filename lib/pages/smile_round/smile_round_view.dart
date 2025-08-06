import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'smile_round_logic.dart';

class SmileRoundView extends GetView<SmileRoundLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.cruickshank.value
              ? const CircularProgressIndicator(color: Colors.pinkAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.avhezkw();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
