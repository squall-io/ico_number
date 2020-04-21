import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ico_number/look-icon.screen.dart';



void main() =>
  runApp(EntryWidget());



class EntryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      home: LookIconScreen(),
      localizationsDelegates: [
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            basePath: 'assets/i18n',
          ),
        ),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
      ],
    );

}
