// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project/responsive/mobile.dart';
import 'package:flutter_project/responsive/web.dart';

class Responsive extends StatefulWidget {
  final myMobileScreen;
  final myWebScreen;

  const Responsive(
      {super.key, required this.myMobileScreen, required this.myWebScreen});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext, BoxConstraints) {
        if (BoxConstraints.maxWidth > 600) {
          return widget.myWebScreen;
        } else {
          return widget.myMobileScreen;
        }
      },
    );
  }
}
