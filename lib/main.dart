import 'package:flutter/material.dart';
// import 'package:layout_app/ho.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:layout_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.grey[400], animate: true);
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
