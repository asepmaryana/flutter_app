import 'package:flutter/material.dart';

class RadioApp extends StatefulWidget {

  @override 
  RadioAppState createState() => new RadioAppState();

}

class RadioAppState extends State<RadioApp> {
  int _value1 = 0;
  int _value2 = 0;

  void _setValue1(int value) => setState(() => _value1 = value);
  void _setValue2(int value) => setState(() => _value2 = value);

  Widget makeRadios() {
    List<Widget> list = new List<Widget>();
    for(int i=0; i<3; i++) {
      list.add(new Radio(value: i, groupValue: _value1, onChanged: _setValue1));
    }

    return new Column(children: list);

  }

  Widget makeRadioTiles() {
    List<Widget> list = new List<Widget>();
    for(int i=0; i<3; i++) {
      list.add(
        new RadioListTile(
          value: i, 
          groupValue: _value2, 
          onChanged: _setValue2,
          activeColor: Colors.green,
          controlAffinity: ListTileControlAffinity.trailing,
          title: new Text('Item: $i'),
          subtitle: new Text('Sub title')
        )
      );
    }
    return new Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Radio Demo')),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              makeRadios(),
              makeRadioTiles()
            ],
          ),
        ),
      ),
    );
  }

}