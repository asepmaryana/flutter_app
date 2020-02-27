import 'package:flutter/material.dart';

class RowColApp extends StatefulWidget {
  @override 
  RowColAppState createState() => new RowColAppState();
}

class RowColAppState extends State<RowColApp> {
  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(title: new Text('Row and Column'), backgroundColor: Colors.red),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Expanded(child: new Image.network('https://static.makeuseof.com/wp-content/uploads/2012/10/flutter-logo.jpg')),
              new Text('Please Login'),
              new Row(
                children: <Widget>[
                  new Text('Username'),
                  new Container(width: 10.0),
                  new Expanded(child: new TextField(controller: _user))
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text('Password'),
                  new Container(width: 10.0),
                  new Expanded(child: new TextField(controller: _pass))
                ],
              ),
              new Padding(
                padding: new EdgeInsets.all(32.0),
                child: new RaisedButton(onPressed: () => print('Login ${_user.text}'), child: new Text('Click me'))
              ),
            ],
          ),
        ),
      ),
    );
  }

}