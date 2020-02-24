import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';

import 'provider/model/counter.dart';
import 'provider/model/switcher.dart';
import 'provider/provider_demo1.dart';
import 'net/net_demo2.dart';

void main() {
  runApp(DioDemo());
//  testProvider();

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}

/// Provider 测试
void testProvider() {
  var counter = Counter();
  var switcher = Switcher();
  var provider = Providers();
  provider
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<Switcher>.value(switcher));

  runApp(ProviderNode(child: ProvideDemo(), providers: provider));
}
