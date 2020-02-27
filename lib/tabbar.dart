import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabbarApp extends StatefulWidget {
  @override 
  TabbarAppState createState() => new TabbarAppState();
}

class TabbarAppState extends State<TabbarApp> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2, 
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Tabbar'),
          bottom: new TabBar(tabs: [
            new Tab(icon: new Icon(Icons.android), text: 'Android'),
            new Tab(icon: new Icon(Icons.phone), text: 'iOS')
          ]),
        ),
        body: new TabBarView(children: [
          new Center(child: new Text('Android Page')),
          new Center(child: new Text('iOS Page')),
        ]),
      )
    );
  }

}