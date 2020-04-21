import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';



class WidgetFactory {

  static const padding = EdgeInsets.all(20);

  static Padding getPadding({ Widget child }) =>
    Padding(
      child: child,
      padding: padding,
    );

  static Widget getScaffold({
    Widget child,
    @required String title,
    List<CustomActionButton> actionButtons,
  }) =>
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(),
      child: Scaffold(
        body: child ?? Container(),
        appBar: AppBar(title: I18nText(title)),
        floatingActionButton: Stack(
          children: actionButtons
            ?.map((actionButton) =>
              Align(
                child: FloatingActionButton(
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

}

class CustomActionButton {

  final Widget widget;
  final Function onPressed;
  final Alignment alignment;

  CustomActionButton({this.onPressed, @required this.widget, @required this.alignment});

}
