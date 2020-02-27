import 'package:flutter/material.dart';

class RouteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder> {
      MyItemsPage.routeName: (BuildContext context) => new MyItemsPage(title: 'MyItemsPage')
    };

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: 'Flutter Demo Homepage'),
      routes: routes
    );
    
  }

}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title});

  @override 
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    //_counter++;
    Navigator.pushNamed(context, MyItemsPage.routeName);
  }

  void _onButtonPressed() {
    Navigator.pushNamed(context, MyItemsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Column(
        children: <Widget>[
          new Text("Dogs"),
          new Text("Cats"),
          new IconButton(icon: new Icon(Icons.access_alarm), onPressed: _onButtonPressed)
        ],
      ),
      floatingActionButton: new FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: new Icon(Icons.add))
    );
  }

}

class MyItemsPage extends StatefulWidget {
  final String title;
  
  MyItemsPage({Key key, this.title});
  
  static const String routeName = "/MyItemsPage";

  @override 
  MyItemsPageState createState() => new MyItemsPageState();

}

class MyItemsPageState extends State<MyItemsPage> {
  void _onFloatingActionButtonPressed() {

  }

  void _onButtonPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text('Item 1'),
            new Text('Item 2'),
            new IconButton(
              icon: new Icon(Icons.arrow_back), 
              onPressed: _onButtonPressed
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        onPressed: _onFloatingActionButtonPressed,
        child: new Icon(Icons.add),
        ),
    );
  }

}