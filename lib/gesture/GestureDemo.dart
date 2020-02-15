import 'package:flutter/material.dart';

class GestureDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GestureDemo'),
        ),
        body: GestureLogo(),
      ),
    );
  }
}

class GestureLogo extends StatefulWidget {

  @override
  _GestureState createState() => _GestureState();
}

class _GestureState extends State<GestureLogo> {
  double top = 0.0;
  double left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            color: Colors.yellow,
          ),
          onPanDown: (details) {
            setState(() {
              top = details.globalPosition.dy;
              left = details.globalPosition.dx;
            });
          },
          onPanUpdate: (details) {
            setState(() {
              top = details.globalPosition.dy;
              left = details.globalPosition.dx;
            });
          },
          onPanCancel: () {
            setState(() {
              top = 0;
              left = 0;
            });
          },
          onPanEnd: (details) {
            setState(() {
              top = 0;
              left = 0;
            });
          },
        ),
        Positioned(
          left: left,
          top: top,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}