import 'dart:async';

import 'package:flutter/material.dart';

class Todo {
  bool finished;
  String name;

  Todo(this.finished, this.name);

}

class TodoPage extends StatefulWidget {
  final Todo todo;
  
  TodoPage({Key key, this.todo}) : super(key : key);

  @override 
  TodoPageState createState() => new TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('My Todo')),
      body: new Column(
        children: <Widget>[
          new Text("Finished: "+widget.todo.finished.toString()),
          new Text("Name: "+widget.todo.name)
        ],
      ),
    );
  }
}

class TodoItemPage extends StatefulWidget {
  final Todo todo;
  
  TodoItemPage({Key key, this.todo});

  @override 
  TodoItemPageState createState() => new TodoItemPageState();
}

class TodoItemPageState extends State<TodoItemPage> {
  void _onTap() {
    Route route = new MaterialPageRoute(
      builder: (BuildContext context) => new TodoPage(todo: widget.todo),
      settings: new RouteSettings(name: "/todos")
    );
    Navigator.of(context).push(route);
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: new Text("-"),
      title: new Text(widget.todo.name),
      onTap: _onTap,
    );
  }

}

class TodosPage extends StatefulWidget {
  @override 
  TodosPageState createState() => new TodosPageState();
}

class TodosPageState extends State<TodosPage> {
  Future<Null> _onRefresh() {
      Completer<Null> completer = new Completer<Null>();
      Timer timer = new Timer(
        new Duration(seconds: 3), () {
          completer.complete();
        }
      );
      return completer.future;
    }

    Todo getTodo(int index) {
      return new Todo(false, "Todo $index");
    }

    Widget _itemBuilder(BuildContext context, int index) {
      Todo todo = getTodo(index);
      return new TodoItemPage(todo: todo);
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('My Todos')),
      body: new RefreshIndicator(
        child: new ListView.builder(itemBuilder: _itemBuilder), 
        onRefresh: _onRefresh),
    );
  }
}

class ListViewHome extends StatefulWidget {
  @override 
  ListViewHomeState createState() => new ListViewHomeState();
}

class ListViewHomeState extends State<ListViewHome> {
  void _onPressed() {
    Navigator.of(context).pushNamed("/todos");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Home Page")),
      body: new RaisedButton(onPressed: _onPressed, child: new Text("My Todos"))
    );
  }

}