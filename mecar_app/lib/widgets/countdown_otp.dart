import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              ? Text('Resend code ${startTime}s', style: TextStyle(color: Color(0xFFACACAC)))
              : InkWell(
                  onTap: () {
                    setState(() {
                      startTime = widget.timeCountdown;
                    });
                    startTimer();
                  },
                  child: Text('Resend code', style: TextStyle(color: Color(0xFF007AFC)))),
        ],
      ),
    );
  }
}
