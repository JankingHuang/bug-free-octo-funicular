import 'package:flutter/material.dart';
import 'package:untitled/app/flow_app.dart';
import 'package:untitled/demo/chat_demo.dart';
import 'package:untitled/layout/loop_layout.dart';
import 'package:untitled/layout/stack_layout.dart';
import 'package:untitled/layout/wrap_layout.dart';

import 'app/overlay_app.dart';
import 'demo/list_demo.dart';
import 'layout/direction_flex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(themitle: 'Flutter Demo Home Page'),
      // home:  OverlayApp(),
      // home: const FlowApp(),
      home: const ChatDemo(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
       // body: Center(child: DirectionFlex()),
       // body: const Center(child: LoopLayout()),
       // body:  Center(child: StackDemo()),
       // body:  Center(child: ListDemo()),
       // body:  Center(child: WrapDemo()),
    );
  }
}
