import 'package:flutter/material.dart';

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.list), onPressed: null),
        title: new Text('MD Init'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null),
        ],
      ),
      body: new Center(
        child: new Text('MD Body'),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add), tooltip: 'MD Add', onPressed: null),
    );
  }
}
