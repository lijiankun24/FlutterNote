import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'navigator/navigator_demo1.dart';

void main() {
  runApp(DemoApp());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
