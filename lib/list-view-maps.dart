import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListViewMap extends StatefulWidget {
  @override
  ListViewMapState createState() => new ListViewMapState();
}

class ListViewMapState extends State<ListViewMap> {
  Map _countries = new Map();
  void _getData() async {
    var url = 'http://country.io/names.json';
    var response = await http.get(url);
    if(response.statusCode == 200) {
      setState(() => _countries = jsonDecode(response.body));
      print('Loaded ${_countries.length} countries.');
    }
  }

  @override
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('ListView Map')),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Countries", style: new TextStyle(fontWeight: FontWeight.bold)),
              new Expanded(
                child: new ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = _countries.keys.elementAt(index);
                    return new Row(
                      children: <Widget>[
                        new Text('${key} '),
                        new Text(_countries[key])
                      ],
                    );
                  }
                )
              )
            ],
          ),
        ),
      ),
    );
  }

}