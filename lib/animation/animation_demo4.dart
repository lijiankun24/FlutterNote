import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('AnimationBuilder'),
          ),
          body: Center(
            child: Container(
              child: AppLogo(),
            ),
          ),
        )
    );
  }
}

class AppLogoTransition extends StatelessWidget {
  AppLogoTransition({this.animation, this.child});

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class AppLogo extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppLogo> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    CurvedAnimation curvedAnimation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animation = new Tween(begin: 100.0, end: 600.0).animate(curvedAnimation);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AppLogoTransition(animation: _animation, child: FlutterLogo());
  }

  @override
  void dispose() {
    _animationController.dispose()
    super.dispose();
  }
}
