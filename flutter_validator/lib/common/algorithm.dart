import 'package:flutter/material.dart';
import 'package:otp/otp.dart';
import 'dart:convert';

class Algorithm {
  String generateCode(String secret) {
    var bytes = utf8.encode(secret);
    var encoded = base64Encode(bytes);
    int time = DateTime.now().microsecondsSinceEpoch;
    print('时间戳为：$time');
    String code = OTP.generateTOTPCodeString(encoded, time);
    print('生成谷歌验证码：$code');
    return code;
  return '1243';
  }
}
