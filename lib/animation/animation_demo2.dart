import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// https://flutterchina.club/tutorials/animation/
/// 用AnimatedWidget简化
/// 查看 AnimatedWidget 源码会发现，其实其中也是通过 [Animation.addListener] 和
/// [StatefulWidget.setState] 方法实现更新 [build] 方法的
class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> curAnimation = listenable;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AnimatedWidget"),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            width: curAnimation.value,
            height: curAnimation.value,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animation = new Tween(
      begin: 100.0,
      end: 600.0,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLogo(
      animation: _animation,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
