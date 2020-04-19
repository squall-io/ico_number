import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ico_number/widget.icon-view.dart';



class HomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(
        title: Text('IcoNumber | Rules'),
      ),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () =>
            Navigator
                .of(context)
                .push(
              MaterialPageRoute(
                  builder: (context) =>
                  IconView(),
              ),
            ),
      ),
    );

}

