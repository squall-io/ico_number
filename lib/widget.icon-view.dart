import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ico_number/icons.dart';


class IconView extends StatelessWidget {
  // ignore: sdk_version_set_literal
  final _icons = <IconData>{};

  IconView() {
    do {
      _icons.add(_getIconData(from: icons));
    } while (12 > _icons.length);
  }

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(
        title: Text('IcoNumber | Icons'),
      ),
      body: FutureBuilder(
        builder: (content, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (0 == index) return Markdown(
                  shrinkWrap: true,
                  selectable: true,
                  data: snapshot.data as String,
                );

                final matched = 0 == (index += 8) % 9;

                return Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      title: Text('$index'),
                      trailing: Icon(matched ? _icons.elementAt(0) : _getIconData()),
                    ),
                  ],
                );
              }
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: rootBundle.loadString("assets/icon-view.md"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () =>
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) =>
                null
              ),
            ),
      ),
    );

  IconData _getIconData({ Set<IconData> from, int max}) {
    from ??= _icons;
    max ??= from.length - 1;

    final random = Random.secure();

    return from.elementAt(random.nextInt(max));
  }

}
