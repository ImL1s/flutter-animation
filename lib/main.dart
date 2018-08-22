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

  MyHomePageState() {
    print('MyHomePageState 構造函數');

    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() => setState(() =>
          currentHeight = lerpDouble(startHeight, endHeight, animation.value)));
    endHeight = dataSet.toDouble();
    animation.forward();
  }

  void changeData() {
    print('changeData');
    setState(() {
      startHeight = currentHeight;
      dataSet = random.nextInt(100);
      endHeight = dataSet.toDouble();
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
          painter: BarChartPainter(currentHeight),
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
  final barHeight;

  BarChartPainter(this.barHeight) {
    print('BarChartPainter constructor');
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('BarChartPainter paint');
    final paint = Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTWH((size.width - barWidth) / 2.0,
            (size.height - barHeight) / 2.0, barWidth, barHeight),
        paint);
  }

  @override
  bool shouldRepaint(BarChartPainter old) {
//    return false;
    final shouldRePaintBool = barHeight != old.barHeight;
    print('BarChartPainter shouldRepaint: $shouldRePaintBool');
    return shouldRePaintBool;
  }
}
