import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var title = 'Nasa api';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: Container(
          child: Text('hola'),
        ),
      ),
    );
  }
}