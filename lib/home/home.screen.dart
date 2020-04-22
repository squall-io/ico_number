import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:ico_number/widget.factory.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      title: 'screen.title.home',
      child: ListView(
        children: <Widget>[
          WidgetFactory.getPadding(
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/img/ic_launcher.png'),
                  height: 200,
                ),
                const Divider(),
              ],
            ),
          ),
          WidgetFactory.getPadding(
            child: I18nText(
              'home.description',
              child: Text(
                '',
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
      actionButtons: [
        CustomActionButton(
          widget: Icon(Icons.help),
          alignment: Alignment.bottomCenter,
        ),
        CustomActionButton(
          widget: Icon(Icons.play_arrow),
          alignment: Alignment.bottomRight,
        ),
      ],
    );
}
