import 'package:flutter/material.dart';
import '../phone/main.dart';
import '../discover/main.dart';
import '../buy/main.dart';
import '../service/main.dart';
import '../message/main.dart';

const List<Map<String, String>> tabbarList = [
  {
    'label': '云手机',
    'icon': 'assets/images/tabbar/phone-new.png',
    'activeIcon': 'assets/images/tabbar/phone-new-active.png',
  },
  {
    'label': '发现',
    'icon': 'assets/images/tabbar/find-new.png',
    'activeIcon': 'assets/images/tabbar/find-new-active.png'
  },
  {
    'label': '购买',
    'icon': 'assets/images/tabbar/add-new.png',
    'activeIcon': 'assets/images/tabbar/add-new.png'
  },
  {
    'label': '云服务',
    'icon': 'assets/images/tabbar/service-new.png',
    'activeIcon': 'assets/images/tabbar/service-new-active.png'
  },
  {
    'label': '消息',
    'icon': 'assets/images/tabbar/notice-new.png',
    'activeIcon': 'assets/images/tabbar/notice-new-active.png'
  },
];

const List<Widget> pageList = [
  Home(),
  Discover(),
  Buy(),
  Service(),
  Message()
];
