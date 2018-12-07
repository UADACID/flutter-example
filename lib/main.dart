import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // 1
      appBar: new AppBar(
        title: new Text("Screen 1"), // screen title
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                button1(context);
              },
              child: new Text("Go to Screen 2"),
            )
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

void main() {
  runApp(new MaterialApp(
    home: new Screen1(),
    routes: <String, WidgetBuilder>{
      '/screen1': (BuildContext context) => new Screen1(),
      '/screen2': (BuildContext context) => new Screen2()
    },
  ));
}

void button1(BuildContext context) {
  print("Button 1");
  Navigator.of(context).push(new SecondPageRoute());
}

void button2(BuildContext context) {
  print("Button 2");
  // Navigator.of(context).pop(true);
  Navigator.of(context).pushNamed('/screen2');
}

void button3(BuildContext context) {
  print("Button32");
  Navigator.of(context).pop(true);
}

class SecondPageRoute extends CupertinoPageRoute {
  SecondPageRoute()
      : super(builder: (BuildContext context) => new SecondPage());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new SecondPage());
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => new _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Page'),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                button2(context);
              },
              child: new Text("Go to Dashboard"),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
