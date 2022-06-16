import 'package:flutter/material.dart';
import './network/http_request.dart';
import './widgets/star_rating.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试111'),
      ),
      body: StarRating(
        count: 5,
        rating: 6.5,
        maxRating: 10,
        size: 30,
      ),
    );
  }
}
