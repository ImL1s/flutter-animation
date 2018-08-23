import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() {
    print('MyHomePage 構造函數');
  }

  @override
  State<StatefulWidget> createState() {
    print('createState');
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final random = Random();
  int dataSet = 50;
  AnimationController animation;
  double startHeight = 0.0;
  double currentHeight = 0.0;
  double endHeight;
  Tween<double> tween;

  MyHomePageState() {
    print('MyHomePageState 構造函數');

    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    tween = Tween<double>(begin: 0.0, end: dataSet.toDouble());
    animation.forward();
  }

  void changeData() {
    print('changeData');
    setState(() {
      dataSet = random.nextInt(100);
      tween = Tween<double>(
          begin: tween.evaluate(animation), end: dataSet.toDouble());
      animation.forward(from: 0.0);
    });
  }

  @override
  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
    animation.dispose();
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    print('MyHomePageState didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomePageState build');
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(200.0, 100.0),
          painter: BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

//  final barHeight;
  final Animation<double> animation;

  BarChartPainter(Animation<double> animation)
      : animation = animation,
        super(repaint: animation) {
    print('BarChartPainter constructor');
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('BarChartPainter paint');
    final barHeight = animation.value;
    final paint = Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTWH((size.width - barWidth) / 2.0,
            (size.height - barHeight) / 2.0, barWidth, barHeight),
        paint);
  }

  @override
  bool shouldRepaint(BarChartPainter old) => false;
}
