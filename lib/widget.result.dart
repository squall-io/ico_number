import 'package:flutter/material.dart';
import 'package:ico_number/widget.toolkit.dart';


class Result extends StatelessWidget {

  final IconData _icon;

  Result(this._icon);

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Text(
              'Here\'s Your Icon...',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Center(
              heightFactor: 2,
              child: Icon(
                _icon,
                size: 150,
                color: Colors.grey,
              ),
            ),
            Text(
              'Click the refresh to restart !',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      appBar: Toolkit.getAppBar('IcoNumber | Result'),
      floatingActionButton: Toolkit.getFloatingActionButton(Icons.cached),
    );

}
