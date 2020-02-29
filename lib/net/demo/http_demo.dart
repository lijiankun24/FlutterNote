import 'package:flutter/material.dart';
import 'package:flutter_demo/bloc/bloc_demo2.dart';
import 'random_user_model.dart';
import 'dart:async';
import 'application.dart';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BLoCProvider<RandomUserBLoC>(
      bloc: RandomUserBLoC(),
      child: MaterialApp(
        title: 'HttpDemo',
        home: UserWidget(),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RandomUserBLoC randomUserBLoC = BLoCProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (context, snapshot) {
            return Image.network(
              snapshot.data.results[0].picture.large,
              width: 100,
              height: 100,
            );
          },
          stream: randomUserBLoC.stream,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        randomUserBLoC.updateUserInfo();
      }),
    );
  }
}

class RandomUserBLoC extends BaseBLoC {
  StreamController _streamController = StreamController.broadcast();
  RandomUserModel _randomUserModel;

  RandomUserModel get user => _randomUserModel;

  Stream get stream => _streamController.stream;

  void updateUserInfo() {
    Application.httpUtils.get('/api').then((response) {
      _randomUserModel = RandomUserModel.fromJson(response.data);
      _streamController.add(_randomUserModel);
    });
  }

  @override
  void dispose() {
    _streamController?.close();
  }
}
