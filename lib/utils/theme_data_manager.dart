import 'package:flutter/material.dart';

class ThemeDataManager {
  static ThemeData get getTheme {
    return ThemeData(
      primaryColor: Colors.pink,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
          .copyWith(secondary: Colors.amber),
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      // fontFamily: 'Raleway',
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            titleTextStyle: const TextStyle(
              fontSize: 20,
              fontFamily: 'Raleway',
            ),
          ),
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }
}
