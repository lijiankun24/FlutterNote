import 'package:flutter/material.dart';

/// 尺寸限制类容器: https://book.flutterchina.club/chapter5/constrainedbox_and_sizebox.html
class Constraint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Constraint'),
        ),
        body: _getUncnostrainedBox(),
      ),
    );
  }

  // 可以通过 UnconstrainedBox 去除 父Constraint 对 子Constraint 的限制
  Widget _getUncnostrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // 父 Constraint
        minHeight: 100,
        minWidth: 50,
      ),
      child: UnconstrainedBox(
        // 去除 父Constraint 对 子Constraint 的限制
        child: ConstrainedBox(
          // 子 Constraint
          constraints: BoxConstraints(
            minHeight: 50,
            minWidth: 100,
          ),
          child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.deepOrangeAccent)),
        ),
      ),
    );
  }

  Widget _getMultiBox() {
    // 有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。
    return ConstrainedBox(
      constraints: BoxConstraints(
        // 父
        minWidth: 100,
        minHeight: 20,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // 子
          minWidth: 20,
          minHeight: 100,
        ),
        child: DecoratedBox(
            decoration: BoxDecoration(
          color: Colors.blue,
        )),
      ),
    );
    // 思考题：对于maxWidth和maxHeight，多重限制的策略是什么样的呢？
  }

  // SizedBox 和 ConstrainedBox 其实很相似，固定大小
  Widget _getSizedBox() {
    return SizedBox(
      width: 200,
      height: 400,
      child: Container(
        color: Colors.green,
        width: 50,
        height: 80,
      ),
    );
  }

  //  ConstrainedBox 对子 Widget 应用 constraints
  Widget _getConstrainedBox() {
    return ConstrainedBox(
      // BoxConstraints API 文档：
      // https://api.flutter.dev/flutter/rendering/BoxConstraints-class.html
      constraints: BoxConstraints(
        minWidth: 50,
        minHeight: 100,
        maxWidth: 200,
        maxHeight: 200,
      ),
      child: Container(
        width: 10,
        height: 20,
        color: Colors.yellow,
        child: Text('Text'),
      ),
    );
  }
}
