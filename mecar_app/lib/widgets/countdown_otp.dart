import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mecar_app/constants/key_translate.dart';

class CountdownOTP extends StatefulWidget {
  CountdownOTP({Key? key, required this.timeCountdown}) : super(key: key);
  int timeCountdown;

  @override
  State<CountdownOTP> createState() => _CountdownOTPState();
}

class _CountdownOTPState extends State<CountdownOTP> {
  late Timer timer;
  int startTime = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTime == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            startTime--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTime = widget.timeCountdown;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          startTime > 0
              ? Text('${RESEND_CODE_KEY.tr()}${startTime}s',
                  style: const TextStyle(color: Color(0xFFACACAC)))
              : InkWell(
                  onTap: () {
                    setState(() {
                      startTime = widget.timeCountdown;
                    });
                    startTimer();
                  },
                  child:
                      Text(RESEND_CODE_KEY.tr(), style: const TextStyle(color: Color(0xFF007AFC)))),
        ],
      ),
    );
  }
}
