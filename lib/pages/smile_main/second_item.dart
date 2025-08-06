import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

class SecondItem extends StatefulWidget {
  const SecondItem(this.bgImage, {this.showSticker = true,this.textColor = const Color(0xffed584d), super.key});

  final Uint8List? bgImage;
  final bool showSticker;
  final Color textColor;

  @override
  State<SecondItem> createState() => _SecondItemState();
}

class _SecondItemState extends State<SecondItem>
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
                  <Widget>[
                    <Widget>[
                      Image.asset(
                        'assets/img1.png',
                        fit: BoxFit.cover,
                      ),
                      Obx(() {
                        return Text(
                          timeStr.value.substring(0, 1),
                          style: TextStyle(
                            color: widget.textColor,
                              fontSize: 96, fontWeight: FontWeight.bold),
                        );
                      }),
                    ].toStack(alignment: Alignment.center),
                    const SizedBox(
                      width: 5,
                    ),
                    <Widget>[
                      Image.asset(
                        'assets/img1.png',
                        fit: BoxFit.cover,
                      ),
                      Obx(() {
                        return Text(
                          timeStr.value.substring(1, 2),
                          style: TextStyle(
                              color: widget.textColor,
                              fontSize: 96, fontWeight: FontWeight.bold),
                        );
                      }),
                    ].toStack(alignment: Alignment.center),
                    const SizedBox(
                      width: 5,
                    ),
                    <Widget>[
                      Image.asset(
                        'assets/img1.png',
                        fit: BoxFit.cover,
                      ),
                      Obx(() {
                        return Text(
                          timeStr.value.substring(2, 3),
                          style: TextStyle(
                              color: widget.textColor,
                              fontSize: 96, fontWeight: FontWeight.bold),
                        );
                      }),
                    ].toStack(alignment: Alignment.center),
                    const SizedBox(
                      width: 5,
                    ),
                    <Widget>[
                      Image.asset(
                        'assets/img1.png',
                        fit: BoxFit.cover,
                      ),
                      Obx(() {
                        return Text(
                          timeStr.value.substring(3, 4),
                          style: TextStyle(
                              color: widget.textColor,
                              fontSize: 96, fontWeight: FontWeight.bold),
                        );
                      }),
                    ].toStack(alignment: Alignment.center),
                    const SizedBox(
                      width: 5,
                    ),
                    <Widget>[
                      Image.asset(
                        'assets/img1.png',
                        fit: BoxFit.cover,
                      ),
                      Obx(() {
                        return Text(
                          timeStr.value.substring(4),
                          style: TextStyle(
                              color: widget.textColor,
                              fontSize: 96, fontWeight: FontWeight.bold),
                        );
                      }),
                    ].toStack(alignment: Alignment.center),
                  ].toRow(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center),
                  Visibility(visible: widget.showSticker,child: <Widget>[
                    Image.asset(
                      'assets/left1.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 56,
                    ),
                    Image.asset(
                      'assets/right1.png',
                      fit: BoxFit.cover,
                    )
                  ].toRow(mainAxisAlignment: MainAxisAlignment.center))
                ].toColumn(mainAxisAlignment: MainAxisAlignment.center))
            .decorated(
            image: DecorationImage(
                image: MemoryImage(widget.bgImage!), fit: BoxFit.fill),
          );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
