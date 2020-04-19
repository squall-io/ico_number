import 'package:flutter/material.dart';



class Toolkit {

  static AppBar getAppBar(String title) =>
    AppBar(
      title: Text(title),
      backgroundColor: Colors.purple,
    );

  static getFloatingActionButton<A1>({
    @required BuildContext context,
    @required IconData iconData,
    @required Widget target(),
  }) =>
    FloatingActionButton(
      child: Icon(iconData),
      backgroundColor: Colors.purple,
      onPressed: () =>
        Toolkit.navigateTo(context, target),
    );

  static void navigateTo(BuildContext context, Widget target()) =>
    Navigator
      .of(context)
      .pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
            target()
        )
    );

}
