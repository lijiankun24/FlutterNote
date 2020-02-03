import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator App',
      routes: {
        '/': (_) => PageA(),
        '/page_b': (_) => PageB(),
        '/page_c': (_) => PageC(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageA'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
//            Navigator.pushReplacement(
//              context,
//              MaterialPageRoute(
//                builder: (_) => PageB(),
//              ),
//            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageB()),
            );
          },
          child: Text('Click To Next Page'),
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text('PageB'),
          ),
          body: Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => PageC()),
                    ModalRoute.withName('/'));
//            Navigator.pushReplacementNamed(context, '/page_c');
//            Navigator.pushNamed(context, '/page_c');
              },
              child: Text('Click To Next Page'),
            ),
          ),
        ),
        onWillPop: null);
  }
}

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageC'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Click To Next Page'),
        ),
      ),
    );
  }
}
