import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DataTableApp extends StatefulWidget {
  @override 
  DataTableAppState createState() => new DataTableAppState();
}

class DataTableAppState extends State<DataTableApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('DataTable')),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new Text('Students', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          new DataTable(
              //dataRowHeight: 30.0,
              //headingRowHeight: 30.0,
              columns: [
                new DataColumn(label: new Text('No')),
                new DataColumn(label: new Text('Name')),
                new DataColumn(label: new Text('Class')),
              ], 
              rows: [
                new DataRow(cells: [
                  new DataCell(new Text('1')),
                  new DataCell(new Text('Asep')),
                  new DataCell(new Text('3-A'))
                ]),
                new DataRow(cells: [
                  new DataCell(new Text('2')),
                  new DataCell(new Text('Agus')),
                  new DataCell(new Text('3-C'))
                ]),
                new DataRow(cells: [
                  new DataCell(new Text('3')),
                  new DataCell(new Text('Dani')),
                  new DataCell(new Text('3-F'))
                ]),
              ])
        ],
      ),
    );
  }

}