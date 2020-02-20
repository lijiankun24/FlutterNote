import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc/bloc_demo2.dart';

void main() {
  runApp(BLoCDemo());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}


