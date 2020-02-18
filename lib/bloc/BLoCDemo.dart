import 'dart:async';
import 'package:flutter/material.dart';

class BLoCDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BLoCDemo'),
        ),
        body:,
//        Center(
//          child: StreamBuilder(builder: (context, snapshot) {
//            return Text('$snapshot.data');
//          }, initialData: 0, stream: ,),
//        ),
      ),
    );
  }
}

class CountBLoC {
  int _count;
  StreamController<int> _streamController;

  CountBLoC() {
    _count = 0;
    _streamController = new StreamController();
  }

  void increment() {
    _streamController.sink.add(++_count);
  }

  Stream<int> get value => _streamController.stream;

  void dispose() {
    _streamController.close();
  }
}

class BLoCProvider extends InheritedWidget {
  CountBLoC _bLoC = CountBLoC();

  BLoCProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CountBLoC of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BLoCProvider) as BLoCProvider)
        ._bLoC;
  }
}
