import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        textTheme: TextTheme(
            headlineLarge: TextStyle(
              color: darkPurpleColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: darkPurpleColor,
              fontSize: 20,
            )),
        scaffoldBackgroundColor: creamColor,
        cardColor: Colors.white,
        primarySwatch: Colors.deepPurple,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: darkPurpleColor, foregroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(darkPurpleColor))),
        fontFamily: "Lato",
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: darkPurpleColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        scaffoldBackgroundColor: darkPurpleColor,
        cardColor: lightBlueColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: creamColor, foregroundColor: darkPurpleColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(darkPurpleColor),
                backgroundColor: MaterialStateProperty.all(creamColor))),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        fontFamily: "Lato",
      );

  static Color creamColor = const Color.fromARGB(255, 239, 239, 239);
  static Color darkPurpleColor = const Color.fromARGB(255, 10, 0, 100);
  static Color lightBlueColor = const Color.fromARGB(255, 202, 196, 255);
}
