import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/swiper.dart';
import 'initialize.dart';
import 'package:flutter_app/widgets/button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('000'),
      ),
      body: Column(
        children: [
          Swiper(swiperList, width: 250, height: 410,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: '注册',
              )
            ],
          )
        ],
      ),
    );
  }
}
