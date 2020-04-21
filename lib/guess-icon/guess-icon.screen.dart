import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:ico_number/widget.factory.dart';



class GuessIconScreen extends StatefulWidget {

  final IconData _iconData;

  GuessIconScreen(this._iconData, { Key key }) : super(key: key);

  @override
  _GuessIconScreenState createState() => _GuessIconScreenState(_iconData);
}

class _GuessIconScreenState extends State<GuessIconScreen> {

  static final _random = Random.secure();
  static final _container = Container();
  static const _size = 150.0;

  final Widget _description = I18nText(
    'guess-icon.description',
    child: Text('', textAlign: TextAlign.justify),
  );
  final Widget _whatNext = I18nText(
    'guess-icon.what-next',
    child: Text('', textAlign: TextAlign.justify),
  );
  final List<CustomActionButton> actionButtons = [
    CustomActionButton(
      widget: Icon(Icons.rate_review),
      alignment: Alignment.bottomCenter,
    ),
    CustomActionButton(
      widget: Icon(Icons.autorenew),
      alignment: Alignment.bottomRight,
    ),
  ];
  final IconData _iconData;

  Widget _widget = SizedBox(
    child: CircularProgressIndicator(),
    height: _size,
    width: _size,
  );
  bool _done = false;


  _GuessIconScreenState(this._iconData) : super() {
    Future.delayed(
      Duration(milliseconds: 1750 + _random.nextInt(3751)),
      () =>
        setState(() {
          _widget = Icon(_iconData, size: _size);
          _done = true;
        }),
    );
  }

  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      title: 'screen.title.guess-icon',
      child: WidgetFactory.getPadding(
        child: ListView(
          children: <Widget>[
            _done ? _container : _description,
            WidgetFactory.getPadding(
              child: Center(
                child: _widget,
              ),
            ),
            _done ? _whatNext : _container,
          ],
        ),
      ),
      actionButtons: actionButtons,
    );
}
