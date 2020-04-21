


import 'package:flutter/material.dart';

class WidgetFactory {

  static AppBar getAppBar({ String title }) =>
    AppBar(
      title: Text(title),
      backgroundColor: Colors.teal,
    );

}
