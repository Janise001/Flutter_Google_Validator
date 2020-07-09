import 'package:flutter/material.dart';
import './home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home', //初始路由
      routes: {
        '/home': (context) => Home(),
      },
    );
  }
}

