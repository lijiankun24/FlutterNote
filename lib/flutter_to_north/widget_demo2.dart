import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DemoApp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  final List<String> menus = ['One', 'Two', 'Three'];
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: menus.length, vsync: this);
    _pageController = PageController();
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.animateToPage(_tabController.index,
            duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
//        automaticallyImplyLeading: false,
//        leading: Icon(Icons.menu),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
              return List<PopupMenuItem<String>>.generate(
                  menus.length,
                  (index) => PopupMenuItem(
                      value: menus[index], child: Text(menus[index])));
            },
            onSelected: (value) {
              print('the selected value is $value');
            },
            icon: Icon(Icons.more_vert, color: Colors.red),
          ),
        ],
        bottom: TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.yellow,
            controller: _tabController,
            isScrollable: true,
            tabs: List<Tab>.generate(
                menus.length, (index) => Tab(text: menus[index]))),
      ),
      body: PageView(
        controller: _pageController,
        children: menus
            .map((content) => TabChangePage(
                  content: content,
                ))
            .toList(),
        onPageChanged: (index) {
          _tabController.index = index;
        },
      ),
      drawer: Drawer(
        child: SafeArea(
            child: Text(
          'Drawer',
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 30.0),
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.android,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.people,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class TabChangePage extends StatelessWidget {
  final String content;

  TabChangePage({this.content, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        content,
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30.0),
      ),
    );
  }
}
