import 'package:flutter/material.dart';
import 'package:hand_app/car.dart';
import 'package:hand_app/db-helper.dart';

class SqlHome extends StatefulWidget {
  @override 
  SqlHomeState createState() => new SqlHomeState();
}

class SqlHomeState extends State<SqlHome> {
  final dbHelper = DatabaseHelper.instance;

  List<Car> cars  = [];
  List<Car> carsByName  = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();
 
  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  void _insert(name, miles) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : name,
      DatabaseHelper.columnMiles : miles
    };
    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('insert row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows.forEach((row) => cars.add(Car.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState((){});
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Car.fromMap(row)));
  }

  void _update(id, name, miles) async {
    // row to update
    Car car = Car(id, name, miles);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold("updated $rowsAffected row(s)");
  }

  void _delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold("deleted $rowsDeleted row(d) : row $id");
  }
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 5, 
      child: new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text('SQLite Flutter'),
          bottom: new TabBar(tabs: [
            new Tab(text: "Insert"),
            new Tab(text: "View"),
            new Tab(text: "Query"),
            new Tab(text: "Update"),
            new Tab(text: "Delete")
          ]),
        ),
        body: new TabBarView(children: [
          new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(20),
                  child: new TextField(
                    controller: nameController,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      labelText: 'Car Name'
                    ),
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(20),
                  child: new TextField(
                    controller: milesController,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      labelText: 'Car Miles'
                    ),
                  ),
                ),
                new RaisedButton(
                  child: new Text('Insert Car Details'),
                  onPressed: (){
                    String name = nameController.text;
                    int miles = int.parse(milesController.text);
                    _insert(name, miles);
                  }
                )
              ],
            ),
          ),
          // view tab
          new Container(
            child: new ListView.builder(
              itemCount: cars.length+1,
              itemBuilder: (BuildContext context, int index){
                if(index == cars.length) {
                  return new RaisedButton(
                    child: new Text('Refresh'),
                    onPressed: (){
                      setState(() {
                        _queryAll();
                      });
                    }
                  );
                }
                return new Container(
                  height: 40,
                  child: new Center(
                    child: new Text('[${cars[index].id}] ${cars[index].name} - ${cars[index].miles} miles', style: new TextStyle(fontSize: 18))
                  ),
                );
              }
            ),
          ),
          // query tab
          new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(20),
                  child: new TextField(
                    controller: queryController,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      labelText: 'Car Name'
                    ),
                    onChanged: (text){
                      if(text.length >= 2) {
                        setState(() {
                          _query(text);
                        });
                      }
                      else {
                        setState(() {
                          carsByName.clear();
                        });
                      }
                    },
                  ),
                  height: 100,
                )
              ],
            ),
          ),
          // update tab
          new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(20),
                  child: new TextField(
                    controller: idUpdateController,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      labelText: 'Car Id'
                    ),
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(20),
                  child: new TextField(
                    controller: nameUpdateController,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      labelText: 'Car Name'
                    ),
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(20),
                  child: new TextField(
                    controller: milesUpdateController,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      labelText: 'Car Miles'
                    ),
                  ),
                ),
                new RaisedButton(
                  child: new Text('Update Car Details'),
                  onPressed: (){
                    int id = int.parse(idUpdateController.text);
                    String name = nameUpdateController.text;
                    int miles = int.parse(milesUpdateController.text);
                    _update(id, name, miles);
                  }
                )
              ],
            ),
          ),
          // delete tab
          new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(20),
                  child: new TextField(
                    controller: idDeleteController,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      labelText: 'Car Id'
                    ),
                  ),
                ),
                new RaisedButton(
                  child: new Text('Delete'),
                  onPressed: (){
                    int id = int.parse(idDeleteController.text);
                    _delete(id);
                  }
                )
              ],
            ),
          )
        ]),
      )
    );
  }

}