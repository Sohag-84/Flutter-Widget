// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(),
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20, color: Colors.orange),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.black),
        iconTheme: IconThemeData(color: Colors.red, size: 50),
      );



  ThemeData darkTheme(context) => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(color: Colors.black, elevation: 0),
      iconTheme: IconThemeData(color: Colors.white,size: 50),
      );
}
