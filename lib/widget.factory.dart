


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetFactory {

  static AppBar getAppBar({ String title }) =>
    AppBar(
      title: Text(title),
      backgroundColor: Colors.deepPurple,
    );

  static Widget getScaffold({ @required String title, Widget child }) =>
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(),
      child: Scaffold(
        appBar: getAppBar(title: title),
        body: child ?? Container(),
      ),
    );
}
