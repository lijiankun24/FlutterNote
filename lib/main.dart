import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'animation/animation_demo3.dart';

void main() {
  runApp(AnimationDemo());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
