import 'package:flutter/material.dart';

class SwitchApp extends StatefulWidget {
  @override 
  SwitchAppState createState() => new SwitchAppState();
}

enum Answers { YES, NO, MAYBE }

class SwitchAppState extends State<SwitchApp> {
  bool _value1 = false;
  bool _value2 = false;
  double _value3 = 0.0;
  String _date = '';

  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);
  void _setValue3(double value) => setState(() => _value3 = value);

  List<BottomNavigationBarItem> _items;
  int _index = 0;

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime(2019),
      firstDate: new DateTime(2016),
      lastDate:  new DateTime(2100)
    );
    if(picked != null) setState(() => _date = picked.toString());
  }

  void _showBottom(){
    showModalBottomSheet<void>(
      context: context, 
      builder: (BuildContext context){
        return new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Some info here', style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text('Close'))
            ],
          ),
        );
      });
  }

  void _add() => setState(() => _value3 = _value3 + 1.0 );
  void _remove() => setState(() => _value3 = _value3 - 1.0 );
  void _onClicked() => setState(() => _date = new DateTime.now().toString());

  

  Future _showAlert(BuildContext context, String message) {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text(message),
        actions: <Widget>[
          new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Ok'))
        ],
      ));
  }

  Future _askUser() async {
    switch(await 
      showDialog(
        context: context,
        child: new SimpleDialog(
            title: new Text('Do you like flutter ?'),
            children: <Widget>[
              new SimpleDialogOption(child: new Text('Yes'), onPressed: () => Navigator.pop(context, Answers.YES)),
              new SimpleDialogOption(child: new Text('No'), onPressed: () => Navigator.pop(context, Answers.NO)),
              new SimpleDialogOption(child: new Text('Maybe'), onPressed: () => Navigator.pop(context, Answers.MAYBE)),
            ],
        )
      )
    )
    {
      case Answers.YES:
        setState(() {
          _date = 'YES';
        });
      break;

      case Answers.NO:
        setState(() {
          _date = 'NO';
        });
      break;

      case Answers.MAYBE:
        setState(() {
          _date = 'MAYBE';
        });
      break;

    }
  }

  @override
  void initState() {
    _items = new List<BottomNavigationBarItem>();
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.people), title: new Text('People')));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.weekend), title: new Text('Weekend')));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.message), title: new Text('Message')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Switch Demo'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: _remove),
        ],
        centerTitle: true,

      ),
      body: new Container(
        padding: new EdgeInsets.all(32.00),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Switch(value: _value1, onChanged: _onChanged1),
              new SwitchListTile(
                value: _value2, 
                onChanged: _onChanged2, 
                title: new Text('Hello', 
                  style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.red)
                )
              ),
              new Text('Value: ${(_value3 * 100).round()}'),
              new Slider(value: _value3, onChanged: _setValue3),
              new Text(_date),
              new RaisedButton(onPressed: _selectDate, child: new Text('Click me')),
              new RaisedButton(onPressed: () => _showAlert(context, 'Flutter !'), child: new Text('Alert')),
              new RaisedButton(onPressed: () => _askUser, child: new Text('Ask')),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _showBottom,
        backgroundColor: Colors.red,
        mini: true,
        child: new Icon(Icons.timer)
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text('Hello Drawer'),
              new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text('Close'))
            ],
          ),
        ),
      ),
      /*
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.timer), onPressed: null),
        new IconButton(icon: new Icon(Icons.people), onPressed: null),
        new IconButton(icon: new Icon(Icons.map), onPressed: null),
      ],
      */
      bottomNavigationBar: new BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item){
          setState(() {
            _index = item;
            _date = "Current value is: $_index";
          });
        },
      ),
    );
  }

}