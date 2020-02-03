import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new _CountIncrement(_increment),
        new _CountDisplay(_count),
      ],
    );
  }
}

class _CountIncrement extends StatelessWidget {
  final VoidCallback increment;

  _CountIncrement(this.increment);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: increment,
      child: new Text('increment'),
    );
  }
}

class _CountDisplay extends StatelessWidget {
  final int _count;

  _CountDisplay(this._count);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('count is $_count'),
    );
  }
}
