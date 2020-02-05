import 'package:flutter/material.dart';

/// Flutter 中的合约束：https://flutterchina.club/layout/
class Constraint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Constraint'),
        ),
        body: _getColumn(),
      ),
    );
  }

  Widget _getColumn() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
            child: Text('data1'),
          ),
        ),
        Container(
          child: Expanded(
            flex: 2,
            child: UnconstrainedBox(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 300,
                  minWidth: 200,
                  minHeight: 100
                ),
                color: Colors.green,
                child: Text('data2'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getContainerBox() {
    return Container(
      color: Colors.green,
      constraints: BoxConstraints(
        minWidth: 100,
        minHeight: 50,
      ),
      child: Container(
        color: Colors.yellow,
        constraints: BoxConstraints(
          minWidth: 50,
          minHeight: 100,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
