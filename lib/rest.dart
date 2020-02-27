import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageRest extends StatefulWidget {
  @override 
  HomePageRestState createState() => new HomePageRestState();
}

class HomePageRestState extends State<HomePageRest> {

  Future <String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );
    List data = jsonDecode(response.body);
    print(data[1]["title"]);
    return data[1]["title"];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Stateful Widget !"), backgroundColor: Colors.deepOrange),
      body: new Center(
        child: new RaisedButton(onPressed: getData, child: new Text("Get Data !", style: new TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 20.0)))
      ),
    );
  }

}