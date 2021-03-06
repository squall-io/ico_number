import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:ico_number/home/home.screen.dart';
import 'package:ico_number/how-to/how-to.screen.dart';
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

  final IconData _iconData;

  bool _done = false;

  _GuessIconScreenState(this._iconData) : super() {
    Future.delayed(
      Duration(milliseconds: 1750 + _random.nextInt(3751)),
      () => setState(() => _done = true),
    );
  }

  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      context: context,
      title: 'screen.title.guess-icon',
      child: WidgetFactory.getPadding(
        child: ListView(
          children: <Widget>[
            _done
              ? _container
              : I18nText(
                'guess-icon.description',
                child: Text('', textAlign: TextAlign.justify),
              ),
            WidgetFactory.getPadding(
              child: Center(
                child: _done
                  ? Icon(_iconData, size: _size, color: Colors.grey)
                  : SizedBox(
                    child: CircularProgressIndicator(strokeWidth: 15),
                    height: _size,
                    width: _size,
                  ),
              ),
            ),
            _done
              ? I18nText(
                'guess-icon.what-next',
                child: Text('', textAlign: TextAlign.justify),
              )
              : _container,
          ],
        ),
      ),
      actionButtons: _done
        ? [
          CustomActionButton(
            i18n: '\$action.rate-app',
            iconData:Icons.rate_review,
            alignment: Alignment.bottomLeft,
          ),
          CustomActionButton(
            iconData: Icons.autorenew,
            i18n: '\$action.try-again',
            alignment: Alignment.bottomRight,
            onPressed: () => WidgetFactory.navigateTo(context, (context) => HowToScreen(), isPushBackAware: false),
          ),
        ]
        : null,
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () => WidgetFactory.navigateTo(context, (context) => HomeScreen(), isPushBackAware: false),
      ),
    );
}
