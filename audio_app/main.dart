import 'package:flutter/material.dart';
import 'package:task_one/home.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color.fromRGBO(80, 0, 0, 0.4),
        animate: true);

    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
