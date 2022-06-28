import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  static const TextStyle textStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  final blueBox = Container(
    alignment: Alignment.bottomRight,
    color: Colors.blue,
    height: 100,
    width: 100,
    child: const Text(
      '1',
      style: textStyle,
    ),
  );

  final redBox = Container(
    alignment: Alignment.bottomRight,
    color: Colors.red,
    height: 80,
    width: 80,
    child: const Text(
      '2',
      style: textStyle,
    ),
  );
  final yellowBox = Container(
    alignment: Alignment.bottomRight,
    color: Colors.orange,
    height: 60,
    width: 60,
    child: const Text(
      '3',
      style: textStyle,
    ),
  );
  final greenBox = Container(
    alignment: Alignment.bottomRight,
    color: Colors.green,
    height: 40,
    width: 40,
    child: const Text(
      '4',
      style: textStyle,
    ),
  );

  final purpleBox = Container(
    alignment: Alignment.center,
    color: Colors.purple,
    height: 20,
    width: 20,
    child: const Text(
      '5',
      style: textStyle,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 10,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.all(5),
              // alignment: Alignment.topLeft,
              width: 200,
              height: 120,
              color: Colors.grey.withAlpha(33),
              child: Stack(
                alignment: const Alignment(-0.5,0),
                children: [blueBox, redBox, yellowBox, greenBox],
              )),
          Text('Alignment(-0.5,0)')
        ],
      ),
    );
  }
}