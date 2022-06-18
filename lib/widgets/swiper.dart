import 'dart:async';

import 'package:flutter/material.dart';

class Swiper extends StatefulWidget {
  final List<Widget> list;
  final double width;
  final double height;
  final bool autoPlay;

   const Swiper(this.list, {
     this.width = 300,
     this.height = 500,
     this.autoPlay = true
  });

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  int _currentIndex = 0;
  late PageController _controller;
  late Timer _timer;

  @override
  initState(){
    super.initState();
    _controller = PageController(initialPage: _currentIndex);

    if(widget.autoPlay){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        startTimer();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildSwiperWrop(),
          buildSwiperPointer()
        ],
      )
    );
  }

  Widget buildSwiperWrop(){
    return GestureDetector(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: PageView.builder(
          itemCount: widget.list.length,
          controller: _controller,
          itemBuilder: (ctx, index){
            return widget.list[index % widget.list.length];
          },
          onPageChanged: (index) => setState((){
            _currentIndex = index;
          }),
        ),
      ),
      onPanStart: (e) {
        if(widget.autoPlay){
          _timer.cancel();
        }
      },
      onPanEnd: (e) {
        if(widget.autoPlay){
          startTimer();
        }
      },
    );
  }

  Widget buildSwiperPointer(){
    return Positioned(
      bottom: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(widget.list.length, (index) => Container(
          width: _currentIndex == index ? 18 : 7,
          height: 7,
          margin: EdgeInsetsDirectional.all(5),
          decoration: BoxDecoration(
              color: _currentIndex == index ? Color(0xffffffff) : Color(0xffcccccc),
              borderRadius: BorderRadius.all(Radius.circular((50)))
          ),
        ),),
      ),
    );
  }

  void startTimer() {
    //间隔两秒时间
    _timer = Timer.periodic(Duration(milliseconds: 2000), (value) {
      _currentIndex++;
      if(_currentIndex >= widget.list.length){
        setState(() => _currentIndex = 0);
      }
      //触发轮播切换
      _controller.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }
}
