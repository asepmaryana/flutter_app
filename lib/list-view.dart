import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageLv extends StatefulWidget {

  @override 
  HomePageLvState createState() => new HomePageLvState();

}

class HomePageLvState extends State<HomePageLv> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState((){
      data = jsonDecode(response.body);
    });

    print(data[1]["title"]);

    return "Success!";

  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(title: new Text("ListViews"), backgroundColor: Colors.deepOrange),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text("${index+1} : "+data[index]['title']),
          );
        }
      ),
    );

  }

}