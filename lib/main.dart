import 'dart:math';

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

class MyHomePageState extends State<MyHomePage> {
  var widget1 = Widget1();

  final random = Random();
  int dataSet;

  MyHomePageState() {
    print('MyHomePageState 構造函數');
  }

  void changeData() {
    print('changeData');
    setState(() {
      dataSet = dataSet == null ? random.nextInt(100) : null;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            dataSet != null ? Text('資料: $dataSet') : widget1,
            Widget2(this.dataSet)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class Widget1 extends StatefulWidget {
  Widget1() {
    print('Widget1 構造函數');
  }

  @override
  State<StatefulWidget> createState() {
    return Widget1State();
  }
}

class Widget1State extends State<Widget1> {
  Widget1State() {
    print('Widget1State 構造函數');
  }

  @override
  void initState() {
    print('Widget1State initState');
    super.initState();
  }

  @override
  void dispose() {
    print('Widget1State dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    print('Widget1State deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(Widget1 oldWidget) {
    print('Widget1State didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('Widget1State didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Widget1State');
  }
}

class Widget2 extends StatefulWidget {
  final int i;

  Widget2(this.i) {
    print('Widget2 構造函數');
  }

  @override
  State<StatefulWidget> createState() {
    print('Widget2 createState');
    return Widget2State();
  }
}

class Widget2State extends State<Widget2> {
  Widget2State() {
    print('Widget2State 構造函數');
  }

  @override
  void initState() {
    print('Widget2State initState');
    super.initState();
  }

  @override
  void dispose() {
    print('Widget2State dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    print('Widget2State deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(Widget2 oldWidget) {
    print('Widget2State didUpdateWidget oldWidget: ${oldWidget.i}');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('Widget2State didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Widget2State: i:${widget.i}');
  }
}
