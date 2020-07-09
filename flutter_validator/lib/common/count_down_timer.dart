import 'dart:async';
import 'package:flutter/material.dart';

import './algorithm.dart';

class CountDownTimer extends StatefulWidget {
  CountDownTimer(this.secret,this.blog);
  final String secret;
  final String blog;
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer _timer;
  int seconds = 0;
  String code = '';
  @override
  void initState() {
    super.initState();
    _restartTimer();

  }
  //重启计时器
  _restartTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0){
          seconds --;
          print('$seconds s');
        }else {
          _timer.cancel();
          _timer = null;
          seconds = 30;
          _restartTimer();
          code = Algorithm().generateCode(widget.secret);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '$code',
                  style: TextStyle(color: Colors.blue, fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.blog,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              Text('${seconds}s'),
            ],
          ),
        ],
      ),
    );
  }

}
