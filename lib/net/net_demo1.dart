import 'dart:io';
import 'dart:convert' show utf8;

import 'package:flutter/material.dart';

/// https://juejin.im/post/5cb3d9e4f265da038e549c7d
class NetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('NetDemo'),
        ),
        body: Center(
          child: Container(
            width: 500,
            height: 48,
            child: RaisedButton(
              onPressed: () {
                netRequest();
              },
              child: Text('Click me'),
            ),
          ),
        ),
      ),
    );
  }

  void netRequest() async {
    HttpClient client;
    var url = 'http://gank.io'
        '/api/search/query/listview/category/Android/count/10/page/1';
    try {
      client = HttpClient();
      Uri uri = Uri.parse(url);
      HttpClientRequest request = await client.getUrl(uri);
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      print(responseBody);
    } catch (e) {
      print(e.toString());
    } finally {
      client.close();
    }
  }
}
