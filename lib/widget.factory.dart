


import 'package:flutter/material.dart';

class WidgetFactory {

  static AppBar getAppBar({ String title }) =>
    AppBar(
      title: Text(title),
      backgroundColor: Colors.deepPurple,
    );

  static Scaffold getScaffold({ @required String title, Widget child }) =>
    Scaffold(
      appBar: getAppBar(title: title),
      body: child ?? Container(),
    );
}
