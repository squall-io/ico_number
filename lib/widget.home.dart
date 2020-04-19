import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ico_number/widget.icon-view.dart';
import 'package:ico_number/widget.toolkit.dart';



class HomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      body: FutureBuilder(
        builder: (content, snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              shrinkWrap: true,
              selectable: true,
              data: snapshot.data as String,
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: rootBundle.loadString("assets/how-to.md"),
      ),
      appBar: Toolkit.getAppBar('IcoNumber | Rules'),
      floatingActionButton: Toolkit.getFloatingActionButton(
        iconData: Icons.play_arrow,
        target: () => IconView(),
        context: context,
      ),
    );

}