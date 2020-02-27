
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new BasicLayoutPage(title: 'Product Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BasicLayoutPage extends StatelessWidget {
  final String title;
  BasicLayoutPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(this.title)),
      body: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          new ProductBox(
            name: "iPhone",
            description: "iPhone is the stylist phone ever",
            price: 1000,
            image: "iphone.jpg"
          ),
          new ProductBox(
            name: "Pixel",
            description: "Pixel is the most featureful phone ever",
            price: 800,
            image: "pixel.jpg"
          ),
          new ProductBox(
            name: "Laptop",
            description: "Laptop is most productive development tool",
            price: 2000,
            image: "laptop.jpg"
          ),
          new ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meeting",
            price: 1500,
            image: "tablet.jpg"
          ),
          new ProductBox(
            name: "Pendrive",
            description: "Pendrive is useful storage medium",
            price: 100,
            image: "pendrive.jpg"
          ),
          new ProductBox(
            name: "Floppy Drive",
            description: "Floppy drive is useful rescue storage medium",
            price: 20,
            image: "floppydisk.jpg"
          )
        ],
      )
    );
  }

}

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final String image;

  ProductBox({Key key, this.name, this.description, this.price, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(12.0),
      height: 120.0,
      child: new Card(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,          
          children: <Widget>[
            Image.asset("assets/images/"+image),
            Expanded(
              child: new Container(
                padding: new EdgeInsets.all(5.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(this.name, style: new TextStyle(fontWeight: FontWeight.bold)),
                    new Text(this.description, style: new TextStyle(fontSize: 10), textDirection: TextDirection.ltr,),
                    new Text("Price: "+ this.price.toString())
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}