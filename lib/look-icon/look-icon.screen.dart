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

  final _listFrom = TextEditingController(text: '1');
  final _icons = <IconData>{};

  _LookIconScreenState() {
    do {
      _icons.add(lookIcons.elementAt(_random.nextInt(lookIcons.length)));
    } while (8 > _icons.length);

    _listFrom.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (builder, index) {
          switch (index) {
            case 0:
              return WidgetFactory.getPadding(
                child: Column(
                  children: <Widget>[
                    I18nText(
                      'look-icon.description',
                      child: Text(
                        '',
                        textAlign: TextAlign.justify
                      ),
                    ),
                    LookIconScreen._divider,
                    _ListFromInput(
                      context: context,
                      controller: _listFrom,
                    ),
                  ],
                )
              );
            default:
              index += (double.tryParse(_listFrom.text)?.toInt() ?? 0) - 1;

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

}

class _ListFromInput extends StatelessWidget {

  static final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller;

  _ListFromInput({Key key, @required TextEditingController controller, BuildContext context }):
    _controller = controller,
    super(key: key) {
      _controller.addListener(() =>
        _formKey.currentState.validate()
      );
  }


  @override
  Widget build(BuildContext context) =>
    Form(
      key: _formKey,
      child: TextFormField(
        controller: _controller,
        validator: (value) {
          String error;

          if (null == double.tryParse(value)?.toInt())
            error = FlutterI18n.translate(context, 'look-icon.validation.invalid-list-from');

          return error;
        },
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          hintText: FlutterI18n.translate(context, 'look-icon.list-from'),
        ),
      ),
    );



}
