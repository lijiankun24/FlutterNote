import 'dart:async';

import 'package:flutter/material.dart';

/// https://juejin.im/post/5bb6f344f265da0aa664d68a
/// https://juejin.im/post/5cb340d0e51d456e2d69a75e#heading-1
class BLoCDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bLoC = BLoCProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoCDemo'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          builder: (context, snapshot) {
            return Text('${snapshot.data}');
          },
          initialData: bLoC.value,
          stream: bLoC.stream,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BLoCDemoPageTwo())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class BLoCDemoPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bLoC = BLoCProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoCDemoPageTwo'),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (context, snapshot) {
            return Text('${snapshot.data}');
          },
          stream: bLoC.stream,
          initialData: bLoC.value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bLoC.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CountBLoC {
  int _count = 0;
  StreamController<int> _streamController = StreamController<int>.broadcast();

  Stream<int> get stream => _streamController.stream;

  int get value => _count;

  void increment() {
    _streamController.sink.add(++_count);
  }

  void dispose() {
    _streamController.close();
  }
}

class BLoCProvider extends InheritedWidget {
  final _bLoC = CountBLoC();

  BLoCProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static CountBLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BLoCProvider) as BLoCProvider)
          ._bLoC;
}
