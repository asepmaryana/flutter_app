import 'package:flutter/material.dart';

class ChangeIconColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Custom Bottom Nav',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Custom Bottom Nav')),
        body: new Container(),
        bottomNavigationBar: new ButtomNav(navCallback: (i) => print("Navigating to $i")),        
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}

class ButtomNav extends StatefulWidget {

  final int initialIndex;
  final ValueChanged<int> navCallback;

  ButtomNav({@required this.navCallback, this.initialIndex:0});

  @override 
  ButtomNavState createState() => new ButtomNavState();
}

class ButtomNavState extends State<ButtomNav> {
  int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
    notifyCallback();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      elevation: 8.0,
      child: new Container(
        height: 48.0,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildButton(0, Icons.home, "Home"),
            _buildButton(1, Icons.book, "Bookmarks"),
            _buildButton(2, Icons.video_library, "Videos"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int index, IconData data, String tooltip) {
    return new Flexible(
      flex: 1,
      child: new Tooltip(
        message: tooltip,
        child: new InkWell(
          onTap: () => onButtonTap(index),
          child: new Center(
            child: new Icon(data,
              color: _selected == index ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  void onButtonTap(int index) {
    setState(() {
      _selected = index;
    });
    notifyCallback();
  }
  
  void notifyCallback() {
    widget.navCallback(_selected);
  }
}