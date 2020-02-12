import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TwoAnimations'),
        ),
        body: AppLogo(),
      ),
    );
  }
}

class TransitionLogo extends AnimatedWidget {
  static final opacityAnimation = Tween(begin: 0.1, end: 1.0);
  static final sizeAnimation = Tween(begin: 100.0, end: 600.0);

  TransitionLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Opacity(
        opacity: opacityAnimation.evaluate(animation),
        child: Container(
          width: sizeAnimation.evaluate(animation),
          height: sizeAnimation.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class AppLogo extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppLogo> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 3000,
      ),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TransitionLogo(
      animation: _animation,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
