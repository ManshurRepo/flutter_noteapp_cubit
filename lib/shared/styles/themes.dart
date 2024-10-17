import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blue.shade50,
    // app bar theme
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.blue,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        iconTheme: IconThemeData(color: Colors.white)),
    primarySwatch: Colors.blue,
    iconTheme: const IconThemeData(color: Colors.blue),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.blue, foregroundColor: Colors.white),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ));

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 72, 72, 72),
    // app bar theme
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 72, 72, 72),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white)),
    primarySwatch: Colors.deepOrange,
    iconTheme: const IconThemeData(color: Colors.deepOrange),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ));
