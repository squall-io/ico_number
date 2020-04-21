import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class WidgetFactory {

  static const padding = EdgeInsets.all(20);

  static Padding getPadding({ Widget child }) =>
      Padding(
        child: child,
        padding: padding,
      );

  static AppBar getAppBar({ String title }) =>
    AppBar(
      title: Text(title),
      backgroundColor: Colors.deepPurple,
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
        appBar: getAppBar(title: title),
        floatingActionButton: Stack(
          children: actionButtons
            .map((actionButton) =>
              Align(
                child: getFloatingActionButton(
                  child: actionButton.widget,
                  onPressed: actionButton.onPressed,
                ),
                alignment: actionButton.alignment,
              )
            )
          .toList(),
        ),
      ),
    );

  static FloatingActionButton getFloatingActionButton({ Widget child, Function onPressed }) =>
    FloatingActionButton(
      child: child,
      onPressed: onPressed,
      backgroundColor: Colors.deepPurple,
    );

}

class CustomActionButton {

  final Widget widget;
  final Function onPressed;
  final Alignment alignment;

  CustomActionButton({this.onPressed, this.widget, this.alignment});

}
