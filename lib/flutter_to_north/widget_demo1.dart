import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DemoApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      home: ButtonPage(),
    );
  }
}

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonPage'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('RaisedButton enable.'),
            ),
            RaisedButton(
              onPressed: null,
              child: Text('RaisedButton disable.'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('RaisedButton enable.'),
            ),
            FlatButton(
              onPressed: null,
              child: Text('RaisedButton disable.'),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.add),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('MaterialButton enable'),
            ),
            MaterialButton(
              onPressed: null,
              child: Text('MaterialButton disable'),
            ),
            OutlineButton(
              onPressed: () {},
              child: Text('OutlineButton enable'),
            ),
            OutlineButton(
              onPressed: null,
              child: Text('OutlineButton disable'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('FloatingActionButton'),
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  final String _localImage = 'images/ali.jpg';
  final String _netImage =
      'https://timg05.bdimg.com/timg?wapbaike&quality=60&size=b1440_952&cut_x=143&'
      'cut_y=0&cut_w=1633&cut_h=1080&sec=1349839550&di=cbbc175a45ccec5482ce2cff09a3ae34&'
      'src=http://imgsrc.baidu.com/baike/pic/item/4afbfbedab64034f104872baa7c379310b551d80.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagePage'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                _localImage,
                width: 80,
                height: 80,
              ),
              Image(
                image: AssetImage(_localImage),
                width: 80,
                height: 80,
              ),
              Image(
                image: NetworkImage(_netImage),
                width: 80,
                height: 80,
                fit: BoxFit.fitHeight,
              ),
              Image.network(
                _netImage,
                width: MediaQuery.of(context).size.width,
                height: 80,
                repeat: ImageRepeat.repeatX,
              ),
              FadeInImage.assetNetwork(
                placeholder: _localImage,
                image: _netImage,
                height: 80,
                fit: BoxFit.fitHeight,
                fadeInDuration: Duration(milliseconds: 50),
                fadeInCurve: Curves.bounceIn,
              ),
              Icon(
                Icons.add,
                size: 80,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextPage'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '绿色背景黑色文字展示',
                style: TextStyle(
                  color: Colors.black,
                  backgroundColor: Colors.green,
                  fontSize: 24.0,
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                '这是一个带红色下划线的文字展示',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
