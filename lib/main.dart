import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'animation/animation_demo2.dart';

void main() {
  runApp(LogoApp());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
