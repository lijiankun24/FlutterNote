import 'package:flutter/material.dart';
import 'dart:async';

class BLoCDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BLoCProvider<BLoC>(
      bloc: new BLoC(),
      child: MaterialApp(
        home: BLoCPageOne(),
      ),
    );
  }
}

class BLoCPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BLoC bLoC = BLoCProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoCPageOne'),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (context, snapshot) {
            return Text('${snapshot.data}');
          },
          initialData: bLoC.value,
          stream: bLoC.stream,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BLoCPageTwo()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class BLoCPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BLoC bLoC = BLoCProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoCPageTwo'),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (context, snapshot) {
            return Text('${snapshot.data}');
          },
          initialData: bLoC.value,
          stream: bLoC.stream,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bLoC.increase();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BLoC extends BaseBLoC {
  var _streamController = StreamController<int>.broadcast();
  var _count = 0;

  int get value => _count;

  Stream<int> get stream => _streamController.stream;

  void increase() {
    _streamController.sink.add(++_count);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

abstract class BaseBLoC {
  void dispose();
}

class BLoCProvider<T extends BaseBLoC> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BLoCProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BaseBLoC>(BuildContext context) {
    final type = _typeOf<BLoCProvider<T>>();
    BLoCProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BLoCProvider<BaseBLoC>> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    this.widget.bloc.dispose();
  }
}
