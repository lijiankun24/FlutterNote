import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'model/counter.dart';
import 'model/switcher.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageTwo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Provide<Counter>(builder: (context, child, counter) {
              return Text('${counter.value} times');
            }),
            Provide<Switcher>(
              builder: (context, child, switcher) {
                return Switch(
                  value: switcher.status,
                  onChanged: (value) {
                    switcher.toggle();
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provide.value<Counter>(context).increase();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
