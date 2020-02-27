import 'package:flutter/material.dart';
import 'package:hand_app/other-page.dart';

class HomePageSd extends StatefulWidget {

  @override
  HomePageSdState createState() => new HomePageSdState();

}

class HomePageSdState extends State<HomePageSd> {

  String mainProfilePicture = 'https://randomuser.me/api/portraits/women/44.jpg';
  String otherProfilePicture = 'https://randomuser.me/api/portraits/women/47.jpg';

  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState((){
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Drawer App"), backgroundColor: Colors.redAccent),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Asep Maryana"), 
              accountEmail: new Text("asep.maryana@gmail.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => switchUser,
                child: new CircleAvatar(backgroundImage: new NetworkImage(mainProfilePicture))
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => print("this is the other picture"),
                  child: new CircleAvatar(backgroundImage: new NetworkImage(otherProfilePicture)),
                )
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage('https://orig00.deviantart.net/20eb/f/2015/030/6/f/_minflat__dark_material_design_wallpaper__4k__by_dakoder-d8fjqzu.jpg')
                )
              ),
            ),
            new ListTile(
              title: new Text("First Page"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              },
            ),
            new ListTile(
              title: new Text("Second Page"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("Second Page")));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: new Center(
        child: new Text("Homepage", style: new TextStyle(fontSize: 35.0))
      ),
    );
  }

}
