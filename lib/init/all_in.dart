import 'package:flutter/material.dart';

class Product {
  final String name;

  const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onChangedCallback;

  ShoppingListItem({Product product, this.inCart, this.onChangedCallback})
      : product = product,
        super(key: new ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) {
      return null;
    }
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
      leading: new CircleAvatar(
        child: new Text(product.name[0]),
        backgroundColor: _getColor(context),
      ),
      onTap: () {
        onChangedCallback(product, inCart);
      },
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> productList;

  ShoppingList({Key key, this.productList}) : super(key: key);

  @override
  State createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final Set<Product> _shoppingCart = new Set<Product>();

  @override
  void initState() {
    // 仅会执行一次，可以用于初始化一些对象或动作
    super.initState();
  }

  @override
  void dispose() {
    // 在 State 对象销毁时，会调用此方法，此方法也只会调用一次
    super.dispose();
  }

  // 以 下划线 _ 开头的方法，是私有的方法
  void _handleCartChanged(Product product, bool inCard) {
    setState(() {
      if (inCard) {
        _shoppingCart.remove(product);
      } else {
        _shoppingCart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('All in one'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.productList.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onChangedCallback: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
