import 'package:flutter/material.dart';

class InteractionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interaction',
      home: Center(
        child: ParentWidget3(),
      ),
    );
  }
}

// 状态管理3 -- 由子 Widget & 父 Widget 共同管理状态 Start
class ParentWidget3 extends StatefulWidget {
  @override
  State createState() {
    return ParentState3();
  }
}

class ParentState3 extends State<ParentWidget3> {
  bool _isActive = false;

  void toggleActive(bool active) {
    setState(() {
      _isActive = active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _isActive ? Colors.yellow : Colors.green,
          border: _isActive ? Border.all(color: Colors.green) : null,
    ),
    padding: const EdgeInsets.all(10.0),
    child: ChildWidget3(onChange: toggleActive),
    );
  }
}

class ChildWidget3 extends StatefulWidget {
  final ValueChanged<bool> onChange;

  ChildWidget3({Key key, @required this.onChange}) : super(key: key);

  @override
  State createState() {
    return ChildState3();
  }
}

class ChildState3 extends State<ChildWidget3> {
  bool _isActive = false;

  void _toggleActive() {
    bool nextVal = !_isActive;
    widget.onChange(nextVal);
    setState(() {
      _isActive = nextVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleActive,
      child: Container(
        color: _isActive ? Colors.green : Colors.yellow,
        child: Text(
          'ParentAndChild',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
// 状态管理3 -- 由子 Widget & 父 Widget 共同管理状态 End

// 状态管理2 -- 由父 Widget 管理状态 Start
class ParentWidget extends StatefulWidget {
  @override
  State createState() {
    return _ParentState();
  }
}

class _ParentState extends State<ParentWidget> {
  bool _isActive = false;

  void _toggleActive(bool active) {
    setState(() {
      _isActive = active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ParentToChild(
        isActive: _isActive,
        onChanged: _toggleActive,
      ),
    );
  }
}

class ParentToChild extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;

  ParentToChild({Key key, this.isActive: false, @required this.onChanged})
      : super(key: key);

  void _toggleActive() {
    onChanged(!isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleActive,
      child: Container(
        padding: const EdgeInsets.all(32.0),
        color: isActive ? Colors.green : Colors.grey,
        child: Text(
          'ParentToChild',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
// 状态管理2 -- 由父 Widget 管理状态 End

// 状态管理1 -- 由子 Widget 本身管理状态 Start
class ChildWidget extends StatefulWidget {
  @override
  _ChildState createState() {
    return _ChildState();
  }
}

class _ChildState extends State<ChildWidget> {
  bool _isActive = false;

  void _toggleActive() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleActive,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        color: _isActive ? Colors.green : Colors.grey,
        child: Text(
          'ChildState',
          style: TextStyle(color: Colors.white, fontSize: 28.0),
        ),
      ),
    );
  }
}
// 状态管理1 -- 由子 Widget 本身管理状态 End
