import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc/BLoCDemo.dart';

void main() {
  runApp(BLoCApp());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}

class BLoCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BLoCProvider(
      child: MaterialApp(
        title: 'scoped',
        theme: ThemeData.dark(),
        home: BLoCDemo(),
      ),
    );
  }
}
