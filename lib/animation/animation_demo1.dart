import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// Flutter 中的动画：https://flutterchina.club/animations/
/// Flutter 中的动画：https://flutterchina.club/tutorials/animation/
class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
        ),
        body: Container(
          child: LogoApp(),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  State createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp>
    with SingleTickerProviderStateMixin<LogoApp> {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _animation = new Tween<double>(
      begin: 100.0,
      end: 600.0,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: _animation.value,
        width: _animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
