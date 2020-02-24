import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

/// https://github.com/flutterchina/dio/blob/master/README-ZH.md
/// https://juejin.im/post/5cb3d9e4f265da038e549c7d#heading-1
class DioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DioDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('DioDemo'),
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
    var url = 'http://gank.io'
        '/api/search/query/listview/category/Android/count/10/page/1';
    try {
      Dio dio = new Dio();
      // 最基本的 GET 请求
      Response response = await dio.get(url);
      print(response.toString());

      // 核心 API request
      Response response1 =
          await dio.request(url, options: Options(method: 'GET'));
      print(response1.data.toString());

      // 并发请求
      var response2 = await Future.wait([dio.get(url), dio.get(url)]);
      print('${response2.length}');
    } catch (e) {
      print(e.toString());
    }
  }
}
