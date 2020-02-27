import 'package:flutter/material.dart';

class GridListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List Example';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(12, (index){
            return Center(
              child: Text('Position $index', style: Theme.of(context).textTheme.headline),
            );
          }),
        ),
      ),
    );
  }

}