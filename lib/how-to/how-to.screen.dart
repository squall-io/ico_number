import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:ico_number/look-icon/look-icon.screen.dart';
import 'package:ico_number/widget.factory.dart';



class HowToScreen extends StatefulWidget {

  @override
  _HowToScreenState createState() => _HowToScreenState();

}

class _HowToScreenState extends State<HowToScreen> {

  static const _divider = Divider();

  static final _random = Random();

  List<int> _digits;
  int _difference;
  int _digitsSum;
  int _number;

  _HowToScreenState() {
    _number = 10 + _random.nextInt(pow(10, 2 + _random.nextInt(3)) - 1);
    _digits = _number.toString().split('').map(int.parse).toList();
    _digitsSum = _digits.reduce((a, b) => a + b);
    _difference = _number - _digitsSum;
  }

  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      context: context,
      child: ListView(
        children: <Widget>[
          _Step(
            description: 'how-to.step.description.imagine',
            example: 'how-to.step.example.imagine',
            parameters: { 'number': _number },
          ),
          _divider,
          _Step(
            description: 'how-to.step.description.sum-digits',
            example: '${ _digits?.join(' + ' ) } = $_digitsSum',
            isPlain: true,
          ),
          _divider,
          _Step(
            description: 'how-to.step.description.substract',
            example: '$_number - $_digitsSum = $_difference',
            isPlain: true,
          ),
          _divider,
          _Step(
            description: 'how-to.step.description.look-icon',
            example: 'how-to.step.example.look-icon',
            parameters: { 'difference': _difference },
          ),
          _divider,
          _Step(
            description: 'how-to.step.description.remember-icon',
          ),
          _divider,
          _Step(
            description: 'how-to.step.description.guess-icon',
            example: 'how-to.step.description.thank-you',
          ),
        ],
      ),
      title: FlutterI18n.translate(context, 'screen.title.how-to'),
      actionButtons: [
        CustomActionButton(
          i18n: '\$action.continue',
          iconData: Icons.navigate_next,
          alignment: Alignment.bottomRight,
          onPressed: () => WidgetFactory.navigateTo(context, (context) => LookIconScreen()),
        ),
      ],
    );

}

// ignore: must_be_immutable
class _Step extends StatelessWidget {

  Map<String, String> _parameters;
  String _description;
  String _example;
  bool _isPlain;

  _Step({ Key key, @required String description, String example, bool isPlain: false, Map<String, dynamic> parameters}) : super(key: key) {
    _parameters = null == parameters ? null : parameters.map((key, value) => MapEntry(key, '$value'));
    _description = description;
    _example = example;
    _isPlain = isPlain;
  }

  @override
  Widget build(BuildContext context) =>
    ListTile(
      title: I18nText(_description),
      subtitle: null != _example ? _isPlain ? Text(_example) : I18nText(_example, translationParams: _parameters) : null,
    );

}
