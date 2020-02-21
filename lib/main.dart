import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc/bloc_rxdart.dart';

void main() {
  runApp(RxDartDemo());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
