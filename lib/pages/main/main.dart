import 'package:flutter/material.dart';
import '../phone/main.dart';
import 'initialize_items_list.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: tabbarList.map((item) => BottomNavigationBarItem(
            icon: Image.asset(item['icon']!,
            width: item['label'] == '购买' ? 50 : 30),
            label: item['label'],
            activeIcon: Image.asset(item['activeIcon']!,
            width: item['label'] == '购买' ? 50 : 30)
        )).toList(),
        onTap: (index){
          setState(() => _currentIndex = index);
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     children: [],
      //   )
      // ),
    );
  }
}
