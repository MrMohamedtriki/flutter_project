import 'package:flutter/material.dart';
import 'package:flutter_project/responsive/mobile.dart';
import 'package:flutter_project/responsive/responsive.dart';
import 'package:flutter_project/responsive/web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light(useMaterial3: true),
      theme: ThemeData.dark(),
      home:
          Responsive(myMobileScreen: MobileScreen(), myWebScreen: WebScreen()),
    );
  }
}
