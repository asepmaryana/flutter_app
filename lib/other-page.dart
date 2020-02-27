import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  
  String pageText;

  OtherPage(this.pageText);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(pageText)),
      body: new Center(
        child: new Text(pageText)
      ),
    );
  }

}