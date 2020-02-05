import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constraint/constraint_demo2.dart';

void main() {
  runApp(Constraint());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
