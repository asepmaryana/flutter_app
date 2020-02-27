import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableApp extends StatefulWidget {
  @override 
  TableAppState createState() => new TableAppState();
}

class TableAppState extends State<TableApp> {
  double iconSize = 40;
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(title: new Text('Table')),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(10),
              child: new Table(
                border: new TableBorder.all(),
                children: [
                  new TableRow(
                    children: [
                      new Column(
                        children: <Widget>[
                          new Icon(Icons.account_box, size: iconSize),
                          new Text('My Account')
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          new Icon(Icons.settings, size: iconSize),
                          new Text('Settings')
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          new Icon(Icons.lightbulb_outline, size: iconSize),
                          new Text('My Ideas')
                        ],
                      ),
                    ]
                  ),
                  new TableRow(
                    children: [
                      new Icon(Icons.cake, size: iconSize),
                      new Icon(Icons.voice_chat, size: iconSize),
                      new Icon(Icons.add_location, size: iconSize),
                    ]
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}