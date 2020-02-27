import 'package:flutter/material.dart';

class WidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: WidgetPage(),
      debugShowCheckedModeBanner: false,
    );
  }

}

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),             
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return StatefulPage(
                  title: 'Stateful Page',
                );
              }));
            }
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          /*
          _buildContainer(context),
          _buildImage(context),
          _buildText(context),
          */
          _buildIcon(context),          
          _buildRaisedButton(context),          
          _buildSnackBarButton(context),          
          _buildPlaceHolder(context),          
          _buildColumn(context),
          _buildRow(context),
        ],
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        decoration: BoxDecoration(border: Border.all()),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Image.network('https://www.packtpub.com/sites/default/files/press/logos/packt.png'),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Center(
      child: Container(
        height: 50.0,
        width: 50.0,
        child: Text('This is a text'),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Center(
      child: Container(
        height: 48.0,
        width: 100.0,
        child: Icon(Icons.flag),
      ),
    );

  }

  Widget _buildRaisedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          child: RaisedButton(
            onPressed: () => print('on pressed'),
            child: Text('RAISE BUTTON'),
            color: Colors.cyan,
          ),
        ),
      ),
    );
  }

  Widget _buildSnackBarButton(BuildContext context) {
    return Builder(
      builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              child: RaisedButton(
                onPressed: (){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Hello !')));
                },
                child: Text('BUTTON'),
                color: Colors.blue,
              ),
            ),
          ),
        )
    );
  }

  Widget _buildPlaceHolder(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Placeholder(),
      ),
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 20.0,
              width: 20.0,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 20.0,
              width: 20.0,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 20.0,
              width: 20.0,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.red,
          ),
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.green,
          ),
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class StatefulPage extends StatefulWidget {
  final String title;

  const StatefulPage({Key key, this.title}) : super(key: key);

  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: value ? Colors.black : Colors.white,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: Switch(
            value: value,
            onChanged: (v) {
              setState(() {
                value = v;
              });
            }),
      ),
    );
  }
}