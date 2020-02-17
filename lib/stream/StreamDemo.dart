import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilderDemo(),
    );
  }
}

class StreamBuilderDemo extends StatefulWidget {
  @override
  _StreamBuilderState createState() => _StreamBuilderState();
}

class _StreamBuilderState extends State<StreamBuilderDemo> {
  StreamController<int> _streamController = StreamController.broadcast();
  Sink<int> _sink;
  int _count = 0;

  StreamController<int> _streamController1;
  Sink<int> _sink1;
  StreamSubscription<int> _streamSubscription1;

  @override
  void initState() {
    super.initState();
    _sink = _streamController.sink;
    final transform = new StreamTransformer<int, String>.fromHandlers(
      handleData: (data, newSink) {
        if (data > 5) {
          newSink.add('大');
        } else {
          newSink.add('小');
        }
      },
    );
    _streamController.stream.transform(transform).listen((value) {
//      print(value);
    });

    _streamController1 = new StreamController();
    _sink1 = _streamController1.sink;
    _sink1.add(19999000);
    _streamSubscription1 = _streamController1.stream.listen((value) {
      print('=======' + value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (context, snapshot) => Text('${snapshot.data}'),
          initialData: _count,
          stream: _streamController.stream.where((data) {
            return data <= 10;
          }).take(8),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          testSingleStream();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  /// 点击 floatingActionButton 之后 _count 依次增加
  void _addNumber() {
    _count = _count + 1;
    _sink.add(_count);
  }

  void testSingleStream() {
    _sink1.add(11);
    _sink1.add(12);
    _sink1.add(13);
    _streamSubscription1.pause();
    _sink1.add(14);
    _sink1.add(15);
    _sink1.add(16);
    _streamSubscription1.resume();
    _sink1.add(17);
    _sink1.add(18);
    _sink1.add(19);
  }

  @override
  void dispose() {
    super.dispose();
    _sink.close();
    _streamController.close();

    _streamController1.close();
    _sink1.close();
    _streamSubscription1.cancel();
  }
}
