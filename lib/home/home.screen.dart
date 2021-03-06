import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:ico_number/how-to/how-to.screen.dart';
import 'package:ico_number/widget.factory.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      context: context,
      title: 'app-name',
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
          i18n: '\$action.try',
          iconData: Icons.play_arrow,
          alignment: Alignment.bottomRight,
          onPressed: () => WidgetFactory.navigateTo(context, (context) => HowToScreen()),
        ),
      ],
    );
}
