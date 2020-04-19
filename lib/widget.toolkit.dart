import 'package:flutter/material.dart';



class Toolkit {

  static AppBar getAppBar(String title) =>
    AppBar(
      title: Text(title),
      backgroundColor: Colors.purple,
    );

  static getFloatingActionButton(IconData iconData, { void onPressed() }) =>
    FloatingActionButton(
      onPressed: onPressed,
      child: Icon(iconData),
      backgroundColor: Colors.purple,
    );

}
