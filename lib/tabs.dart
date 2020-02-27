import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Icon(Icons.accessibility_new, size: 150.0, color: Colors.brown)
      )
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Icon(Icons.favorite, size: 150.0, color: Colors.red)
      )
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Icon(Icons.local_pizza, size: 150.0, color: Colors.teal)
      )
    );
  }
}

class MyTabs extends StatefulWidget {
  @override 
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override 
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override 
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Page"), backgroundColor: Colors.deepOrange,),            
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,        
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
          new Tab(icon: new Icon(Icons.arrow_forward)),
          new Tab(icon: new Icon(Icons.arrow_downward)),
          new Tab(icon: new Icon(Icons.arrow_back))
          ])
      ),
      body: new TabBarView(        
        controller: controller,
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage()
        ]
        ),
    );
  }
}