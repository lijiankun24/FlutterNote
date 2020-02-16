import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'stream/StreamDemo.dart';

void main() {
  runApp(StreamDemo());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
