import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:ico_number/home/home.screen.dart';
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
      child: ListView.separated(
        separatorBuilder: (context, index) => _divider,
        itemBuilder: (context, index) {
          switch(index) {
            case 0:
              return _Step(
                description: 'how-to.step.description.imagine',
                example: 'how-to.step.example.imagine',
                parameters: { 'number': _number },
              );
            case 1:
              return _Step(
                description: 'how-to.step.description.sum-digits',
                example: '${ _digits?.join(' + ' ) } = $_digitsSum',
                isPlain: true,
              );
            case 2:
              return _Step(
                description: 'how-to.step.description.substract',
                example: '$_number - $_digitsSum = $_difference',
                isPlain: true,
              );
            case 3:
              return _Step(
                description: 'how-to.step.description.look-icon',
                example: 'how-to.step.example.look-icon',
                parameters: { 'difference': _difference },
              );
            case 4:
              return _Step(
                description: 'how-to.step.note',
                example: 'how-to.step.description.remember-icon',
                parameters: { 'continue': FlutterI18n.translate(context, '\$action.continue') },
              );
            case 5:
              return WidgetFactory.getPadding();
            default:
              return null;
          }
        },
        itemCount: 6,
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
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () => WidgetFactory.navigateTo(context, (context) => HomeScreen(), isPushBackAware: false),
      ),
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
