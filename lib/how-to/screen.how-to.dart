import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ico_number/widget.factory.dart';



class HowToScreen extends StatefulWidget {

  @override
  _HowToScreenState createState() => _HowToScreenState();

}

class _HowToScreenState extends State<HowToScreen> {

  static final _random = Random();

  List<_Step> _steps;

  _HowToScreenState() {
    final digits = <int>[];
    var digitCount = 2 + _random.nextInt(3);

    do {
      digits.add(_random.nextInt(9));
      if (0 == digits.first) digits.removeAt(0);
    } while (digitCount > digits.length);

    final number = digits
      .map((digit) => digit * pow(10, --digitCount))
      .reduce((hay, number) => hay + number);
    final sum = digits.reduce((stack, digit) => stack + digit);
    final difference = number - sum;

    _steps = [
      _Step('Imagin a whole number with 2+ digits', 'Example: $number'),
      _Step('Sum its digits', '${ digits.join(' + ') } = $sum'),
      _Step('Substract the sum from the number', '$number - $sum = $difference'),
      _Step('Check result\'s matching icon', 'Match icon for $difference'),
      _Step('Let me guess witch icon it was', 'That\'s it !'),
    ];
  }

  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      title: "How It Works",
      child: ListView(
        children: _steps,
      ),
    );

}

class _Step extends StatelessWidget {

  final String _instruction;
  final String _example;

  const _Step(this._instruction, this._example, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    ListTile(
      subtitle: Text(_example),
      title: Text(_instruction),
    );

}
