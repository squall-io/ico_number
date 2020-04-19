import 'package:flutter/material.dart';
import 'package:ico_number/widget.home.dart';



void main() =>
    runApp(EntryWidget());

class EntryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      home: HomeWidget(),
    );

}
