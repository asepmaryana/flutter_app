import 'package:flutter/material.dart';

class HomePageLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Home Page Less"), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.favorite, color: Colors.redAccent),
                iconSize: 70.0, 
                onPressed: () {Navigator.of(context).pushNamed('/SeconPage');}
              ),
              new Text('Home Page')
            ],
          ),
        ),
      ),
    );
  }
}

class SeconPageLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Secon Page Less"), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(                
                icon: new Icon(Icons.home, color: Colors.blue),
                iconSize: 70.0, 
                onPressed: null
              ),
              new Text('Second Page')
            ],
          ),
        ),
      ),
    );
  }
}