import 'package:flutter/material.dart';
import 'dart:async';

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
  int _count;

  @override
  void initState() {
    super.initState();
    _sink = _streamController.sink;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (context, snapshot) => Text('${snapshot.data}')
          , initialData: _count, stream: _streamController.stream,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _sink.add(++_count);
      },
        child: Icon(Icons.add,),),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _sink.close();
    _streamController.close();
  }
}
