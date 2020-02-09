import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// https://flutterchina.club/tutorials/animation/
/// 用AnimatedWidget简化
class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> curAnimation = listenable;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AnimatedWidget"),
        ),
        body: Center(
          child: Container(
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
  State createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
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
