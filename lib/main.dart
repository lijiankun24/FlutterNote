import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gesture/GestureDemo.dart';

void main() {
  runApp(GestureDemo());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
