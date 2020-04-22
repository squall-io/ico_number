import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ico_number/home/home.screen.dart';



void main() =>
  runApp(EntryWidget());



class EntryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        buttonTheme: ButtonThemeData(
          splashColor: Colors.deepPurple,
          textTheme: ButtonTextTheme.primary,
        ),
        primarySwatch: Colors.deepPurple,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: HomeScreen(),
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
