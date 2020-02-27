import 'package:flutter/material.dart';

class SandyShores extends StatelessWidget {
  static String routeName = "sandyShores";

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("You've landed on the Sandy Shores !"),
    );
  }
  
}

class DrawVarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder> {
      SandyShores.routeName: (BuildContext context) => new SandyShores()
    };

    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,      
      routes: routes,
      //home: new DrawVarHomePage(title: 'Flutter Demo Homepage'),
      home: new Loader(),
    );
  }

}

class DrawVarHomePage extends StatefulWidget {
  final String title;
  DrawVarHomePage({Key key, this.title});

  @override 
  DrawVarHomePageState createState() => new DrawVarHomePageState();
}

class DrawVarHomePageState extends State<DrawVarHomePage> {
  @override
  Widget build(BuildContext context) {
    var headerText = new Text('Header');
    var header = new DrawerHeader(child: headerText);
    var itemText = new Text('Sandy Shores');
    var itemIcon = new Icon(Icons.settings);
    var item1 = new ListTile(title: itemText, leading: itemIcon, onTap: onItemOnTap);
    var children = [header, item1];
    var listView = new ListView(children: children);
    var drawer = new Drawer(child: listView);

    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(title: new Text('Tabs Demo')),
      body: new Center(child: new Text(''))
    );
  }

  void onItemOnTap() {
    Navigator.popAndPushNamed(context, SandyShores.routeName);
  }
}

class Loader extends StatefulWidget {

  @override 
  State createState() => new LoaderState();

}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: new Duration(microseconds: 800));
    animation = new CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation.addListener((){
      this.setState((){});
    });
    animation.addStatusListener((AnimationStatus status){});
    controller.repeat();
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 100.0
        ),
        new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 75.0,          
        ),
        new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 50.0,          
        ),
      ],
    );
  }

}