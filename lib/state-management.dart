import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = new List<Product>();
    items.add(new Product("Pixel", "Pixel is the most feature-full phone ever", 800, "pixel.jpg"));
    items.add(new Product("Laptop", "Laptop is most productive development tool", 2000, "laptop.jpg"));
    items.add(new Product("Table", "Tablet is the most useful device ever for meeting", 1500, "tablet.jpg"));
    items.add(new Product("Pendrive", "Pendrive is useful storage medium", 100, "pendrive.jpg"));
    items.add(new Product("Floppy", "Floppy drive is useful rescue storage medium", 20, "floppydisk.jpg"));

    return items;
  }
}

class RatingBox extends StatefulWidget {
  @override 
  RatingBoxState createState() => new RatingBoxState();
}

class RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() => _rating = 1);
  }

  void _setRatingAsTwo() {
    setState(() => _rating = 2);
  }

  void _setRatingAsThree() {
    setState(() => _rating = 3);
  }

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);

    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_rating >= 1 ? new Icon(Icons.star, size: _size) : new Icon(Icons.star_border, size: _size)), 
            onPressed: _setRatingAsOne,
            iconSize: _size,
            color: Colors.red[500],
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_rating >= 2 ? new Icon(Icons.star, size: _size) : new Icon(Icons.star_border, size: _size)), 
            onPressed: _setRatingAsTwo,
            iconSize: _size,
            color: Colors.red[500],
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_rating >= 3 ? new Icon(Icons.star, size: _size) : new Icon(Icons.star_border, size: _size)), 
            onPressed: _setRatingAsThree,
            iconSize: _size,
            color: Colors.red[500],
          ),
        ),
      ],
    );
  }

}

class ProductBox extends StatelessWidget {
  final Product item;
  ProductBox({Key key, this.item}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(2),
      height: 140,
      child: new Card(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/images/"+this.item.image),
            new Expanded(
              child: new Container(
                padding: new EdgeInsets.all(5),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(this.item.name, style: new TextStyle(fontWeight: FontWeight.bold)),
                    new Text(this.item.description),
                    new Text("Price : "+this.item.price.toString()),
                    new RatingBox()
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

class ProductPage extends StatelessWidget {
  final Product item;
  ProductPage({Key key, this.item}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(this.item.name)),
      body: new Center(
        child: new Container(
          padding: new EdgeInsets.all(0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/images/"+this.item.image),
              new Expanded(
                child: new Container(
                  padding: new EdgeInsets.all(5),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text(this.item.name, style: new TextStyle(fontWeight: FontWeight.bold)),
                      new Text(this.item.description),
                      new Text("Price : "+this.item.price.toString()),
                      new RatingBox()
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

}

class MgmtHomePage extends StatelessWidget {
  final String title;
  final items = Product.getProducts();

  MgmtHomePage({Key key, this.title}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Product Navigation')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: (){
              Navigator.push(
                context, 
                new MaterialPageRoute(builder: (context) => ProductPage(item: items[index]))
              );
            },
          );
        }
      ),
    );
  }

}

/*
class ManagementApp extends StatefulWidget {
  @override 
  ManagementAppState createState() => new ManagementAppState();
}

class ManagementAppState extends State<ManagementApp> {
  @override
  Widget build(BuildContext context) {
    
    return null;
  }

}
*/

class ManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'State Mgt',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MgmtHomePage(title: 'Product Navigation')
    );
  }
}