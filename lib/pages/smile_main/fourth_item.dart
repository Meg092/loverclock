import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

class FourthItem extends StatefulWidget {
  const FourthItem(this.bgImage, {this.showSticker = true, super.key});

  final Uint8List? bgImage;
  final bool showSticker;

  @override
  State<FourthItem> createState() => _FourthItemState();
}

class _FourthItemState extends State<FourthItem>
    with AutomaticKeepAliveClientMixin {
  Timer? _timer;

  var timeStr = "".obs;

  void startTimer() {
    getDate();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getDate();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void getDate() {
    final now = DateTime.now();
    timeStr.value = DateFormat('HH:mm').format(now);
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.bgImage == null
        ? const SizedBox()
        : Container(
      width: double.infinity,
      height: double.infinity,
      child: <Widget>[
        Visibility(
            visible: widget.showSticker,
            child: Image.asset(
              'assets/left3.png',
              fit: BoxFit.cover,
            ).marginOnly(right: 26)),
        Obx(() {
          return Text(
            timeStr.value.substring(0, 1),
            style: const TextStyle(
                fontSize: 96, fontWeight: FontWeight.bold),
          );
        }),
        const SizedBox(
          width: 5,
        ),
        Obx(() {
          return Text(
            timeStr.value.substring(1, 2),
            style: const TextStyle(
                fontSize: 96, fontWeight: FontWeight.bold),
          );
        }),
        const SizedBox(
          width: 5,
        ),
        Obx(() {
          return Text(
            timeStr.value.substring(2, 3),
            style: const TextStyle(
                fontSize: 96, fontWeight: FontWeight.bold),
          );
        }),
        const SizedBox(
          width: 5,
        ),
        Obx(() {
          return Text(
            timeStr.value.substring(3, 4),
            style: const TextStyle(
                fontSize: 96, fontWeight: FontWeight.bold),
          );
        }),
        const SizedBox(
          width: 5,
        ),
        Obx(() {
          return Text(
            timeStr.value.substring(4),
            style: const TextStyle(
                fontSize: 96, fontWeight: FontWeight.bold),
          );
        }),
        Visibility(
            visible: widget.showSticker,
            child: Image.asset(
              'assets/right3.png',
              fit: BoxFit.cover,
            ).marginOnly(left: 26))
      ].toRow(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center),
    ).decorated(
      image: DecorationImage(
          image: MemoryImage(widget.bgImage!), fit: BoxFit.fill),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
