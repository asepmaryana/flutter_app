import 'package:flutter/material.dart';

class RaiseButApp extends StatefulWidget {
  
  @override 
  _State createState() => new _State();

}

class _State extends State<RaiseButApp> {
  String _value = "Hello world";
  int _counter = 0;

  void _onPressed() {
    setState(() {
      _value = 'My name is asep';
    });
  }

  void _onPressedParam(String value) {
    setState(() {
      _value = value;
    });
  }

  void _add() {
    setState(() {
      _counter++;
    });
  }

  void _subtract() {
    setState(() {
      _counter--;
    });
  }

  void _onChanged(String value) {
    setState(() {
      _value = 'Changed : $value';
    });
  }

  void _onSubmitted(String value) {
    setState(() {
      _value = 'Submitted: $value';
    });
  }

  bool _value1 = false;
  bool _value2 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name here"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value),
              new RaisedButton(onPressed: () => _onPressedParam('Agus'), child: new Text('Click Me !')),
              //new FlatButton(onPressed: _onPressed, child: new Text('FlatButton')),
              new Text('Counter = $_counter'),
              new IconButton(icon: new Icon(Icons.add), onPressed: _add),
              new IconButton(icon: new Icon(Icons.remove), onPressed: _subtract),
              new TextField(
                decoration: new InputDecoration(
                  labelText: 'Hello',
                  hintText: 'Hint',
                  icon: new Icon(Icons.people)
                ),
                autocorrect: true,
                //autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _onChanged,
                onSubmitted: _onSubmitted,
              ),
              new Checkbox(value: _value1, onChanged: _value1Changed),
              new CheckboxListTile(
                value: _value2, 
                onChanged: _value2Changed,
                title: new Text('Hello world !'),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: new Text('Sub Title'),
                secondary: new Icon(Icons.archive),
                activeColor: Colors.red,
              ),

            ],
          ),
        ),
      ),
    );
  }

}