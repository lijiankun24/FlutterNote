import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('RxDartDemo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            testRxDart();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void testRxDart() {
    final subject = ReplaySubject<int>();
    subject.add(1);
    subject.add(2);
    subject.add(3);
    subject.stream.listen((value) {
      print('$value');
    });
    subject.stream.listen((value) {
      print('$value');
    });
    subject.stream.listen((value) {
      print('$value');
    });
    subject.close();
  }
}
