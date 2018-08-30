import 'dart:async';

import 'package:flutter/material.dart';

class AnimationUseDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: AnimationUseDemoContent(),
    );
  }
}

class AnimationUseDemoContent extends StatefulWidget {
  AnimationUseDemoContent({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimationUseDemoContentState();
  }
}

class AnimationUseDemoContentState extends State<AnimationUseDemoContent>
    with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation curved;
  Animation<double> tween;
  bool forward = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    curved = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    tween = Tween(begin: 0.0, end: 10.0).animate(_controller)
      ..addListener(() {
        setState(() {
          print(tween.value);
        });
      });

    Timer(const Duration(milliseconds: 2000), () {
      forward = !forward;
      _controller.forward();

    });

//    _controller.repeat();
//  _controller.fling();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('controller vale: ${_controller.value} animation value: ${tween
            .value}'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('controller vale: ${_controller.value} \n animation value: ${tween
              .value}'),
            FadeTransition(opacity: curved, child: FlutterLogo(size: 200.0)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (forward)
            _controller.forward();
          else
            _controller.reverse();
          forward = !forward;
        },
        tooltip: 'fade',
        child: Icon(Icons.track_changes),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
