import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ico_number/how-to/screen.how-to.dart';



void main() =>
  runApp(EntryWidget());



class EntryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      home: HowToScreen(),
    );
  }

}
