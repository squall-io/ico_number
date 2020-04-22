import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:ico_number/guess-icon/guess-icon.screen.dart';
import 'package:ico_number/look-icon/look-icon.model.dart';
import 'package:ico_number/widget.factory.dart';



class LookIconScreen extends StatefulWidget {

  static const _divider = Divider();

  @override
  _LookIconScreenState createState() => _LookIconScreenState();

}

class _LookIconScreenState extends State<LookIconScreen> {

  static const _duration = const Duration(milliseconds: 1000);

  static final _scrollController = ScrollController();
  static final _random = Random.secure();

  final _listFromController = TextEditingController(text: '');
  final _icons = <IconData>{};

  int _listFrom = 1;

  _LookIconScreenState() {
    do {
      _icons.add(lookIcons.elementAt(_random.nextInt(lookIcons.length)));
    } while (8 > _icons.length);

    _listFromController.addListener(() =>
      setState(() => _listFrom = double.tryParse(_listFromController.text)?.toInt() ?? 1));
  }

  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      context: context,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (builder, index) {
          switch (index) {
            case 0:
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: I18nText(
                  'look-icon.description',
                  child: Text( '', textAlign: TextAlign.justify))
              );
            case 1:
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: TextFormField(
                  controller: _listFromController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    hintText: FlutterI18n.translate(context, 'look-icon.list-from'),
                  ),
                ),
              );
            default:
              index += _listFrom - 2;

              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text('$index'),
                    trailing: Icon(
                      _icons.elementAt(
                        0 == index % 9 ? 0
                            : _random.nextInt(_icons.length),
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
          }
        }
      ),
      actionButtons: [
        CustomActionButton(
          i18n: '\$action.scroll-up',
          onPressed: () =>
            _scrollController.animateTo(
              0,
              duration: _duration,
              curve: Curves.elasticInOut,
            ),
          alignment: Alignment.bottomLeft,
          iconData: Icons.keyboard_arrow_up,
        ),
        CustomActionButton(
          i18n: '\$action.guess',
          alignment: Alignment.bottomRight,
          iconData: Icons.find_replace,
          onPressed: () =>
            WidgetFactory.navigateTo(context, (context) =>
              GuessIconScreen(_icons.elementAt(0)), isPushBackAware: false),
        ),
      ],
      title: FlutterI18n.translate(context, 'screen.title.look-icon'),
    );

  @override
  void dispose() {
    _listFromController.dispose();
    super.dispose();
  }
}
