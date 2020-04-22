import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:url_launcher/url_launcher.dart';



class WidgetFactory {

  static const padding = EdgeInsets.all(20);

  static Padding getPadding({ Widget child }) =>
      Padding(
        child: child,
        padding: padding,
      );

  static Widget getScaffold({
    Widget child,
    BuildContext context,
    @required String title,
    List<CustomActionButton> actionButtons,
  }) =>
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(),
        child: Scaffold(
          body: child ?? Container(),
          appBar: AppBar(
            title: I18nText(title),
            actions: null == context ? null : <Widget>[
              IconButton(
                onPressed: () =>
                    showModalBottomSheet(
                      context: context,
                      builder: _getAboutWidget,
                    ),
                icon: Icon(Icons.fingerprint),
              ),
            ],
          ),
          floatingActionButton: Stack(
            children: actionButtons
                ?.map((actionButton) =>
                Align(
                  child: FloatingActionButton(
                    heroTag: GlobalKey(),
                    child: actionButton.widget,
                    onPressed: actionButton.onPressed,
                  ),
                  alignment: actionButton.alignment,
                ),
            )
                ?.toList()
                ?? [],
          ),
        ),
      );

  static void navigateTo(BuildContext context, WidgetBuilder builder, { bool isPushBackAware = true }) {
    if (isPushBackAware) {
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: builder,
      ));
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
        builder: builder,
      ));
    }
  }

  static Widget _getAboutWidget(BuildContext context) =>
    ListView.separated(
      itemCount: 4,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        switch(index) {
          case 0:
            return ListTile(
              trailing: Image.asset('assets/img/ic_launcher.png'),
              title: I18nText('app-name'),
              subtitle: Text('1.0.0 [MIT]'),
            );
          case 1:
            return ListTile(
              title: I18nText('about.developer'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Salathiel Genese'),
                  InkWell(
                    child: Text('salathiel@genese.name', style: TextStyle(color: Colors.lightBlue)),
                    onTap: () => launch('mailto:salathiel@genese.name'),
                  ),
                ],
              ),
            );
          case 2:
            return ListTile(
              subtitle: I18nText('about.note', child: Text('', textAlign: TextAlign.justify)),
            );
          default:
            return null;
        }
      },
    );

}

class CustomActionButton {

  final Widget widget;
  final Function onPressed;
  final Alignment alignment;

  CustomActionButton({this.onPressed, @required this.widget, @required this.alignment});

}
