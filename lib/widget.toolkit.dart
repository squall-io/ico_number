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
        Navigator
          .of(context)
          .pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) =>
                target()
            ), (route) => true),
    );

}
