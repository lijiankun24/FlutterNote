import 'package:flutter/material.dart';

// https://flutterchina.club/tutorials/layout/

class LayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LayoutDemo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String _imageSrc = 'images/ali.jpg';

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.all(28),
      alignment: Alignment.center,
      color: Colors.yellow,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.star),
          Text('41')
        ],
      ),
    );
  }

  Widget buildIconSection() {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.call,
                color: Colors.blue,
              ),
              Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'CALL',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.near_me,
                color: Colors.blue,
              ),
              Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'ROUTER',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.share,
                color: Colors.blue,
              ),
              Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'SHARE',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDes() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        '我们过了江，进了车站。我买票，他忙着照看行李。行李太多了，得向脚夫行些小费才可过去。他便又忙着和他们讲价钱。我那时真是聪明过分，总觉他说话不大漂亮，非自己插嘴不可，但他终于讲定了价钱；就送我上车。他给我拣定了靠车门的一张椅子；我将他给我做的紫毛大衣铺好坐位。他嘱我路上小心，夜里警醒些，不要受凉。又嘱托茶房好好照应我。我心里暗笑他的迂；他们只认得钱，托他们只是白托！而且我这样大年纪的人，难道还不能料理自己么？唉，我现在想想，那时真是太聪明了！',
        softWrap: true,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset(
            _imageSrc,
            width: 600.0,
            height: 350.0,
            fit: BoxFit.cover,
          ),
          buildTitle(),
          buildIconSection(),
          buildDes(),
        ],
      ),
    );
  }
}
