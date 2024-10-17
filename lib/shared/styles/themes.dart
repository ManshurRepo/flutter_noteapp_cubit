// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// ThemeData lightTheme = ThemeData(
//   scaffoldBackgroundColor: Colors.blue.shade50,
//   // app bar theme
//   appBarTheme: const AppBarTheme(
//       elevation: 0,
//       backgroundColor: Colors.blue,
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: Colors.white,
//         statusBarIconBrightness: Brightness.dark,
//         statusBarBrightness: Brightness.dark,
//       ),
//       centerTitle: true,
//       titleTextStyle: TextStyle(
//           color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
//       iconTheme: IconThemeData(color: Colors.white)),
//   primarySwatch: Colors.blue,
//   iconTheme: const IconThemeData(color: Colors.blue),
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Colors.blue, foregroundColor: Colors.white),
//   textTheme: const TextTheme(
//     bodyMedium: TextStyle(
//         fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
//   ),
//   cardTheme: CardTheme(
//     color: Colors.white,
//     elevation: 15,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(5),
//     ),
//   ),
// buttonTheme: const ButtonThemeData(
  
//     buttonColor: Colors.blue, // Background color for buttons
//     textTheme: ButtonTextTheme.primary, // Text color for buttons
//   ),
// );


// ThemeData darkTheme = ThemeData(
//     useMaterial3: true,
//     scaffoldBackgroundColor: Colors.grey,
//     // app bar theme
//     appBarTheme: const AppBarTheme(
//         elevation: 0,
//         backgroundColor: Colors.black,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: Color.fromARGB(255, 72, 72, 72),
//           statusBarIconBrightness: Brightness.light,
//           statusBarBrightness: Brightness.light,
//         ),
//         centerTitle: true,
//         titleTextStyle: TextStyle(
//             color: Colors.deepOrange,
//             fontSize: 20,
//             fontWeight: FontWeight.w500),
//         iconTheme: IconThemeData(color: Colors.deepOrange)),
//     primarySwatch: Colors.deepOrange,
//     iconTheme: const IconThemeData(color: Colors.deepOrange),
//     floatingActionButtonTheme:
//         const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
//     textTheme: const TextTheme(
//       bodyMedium: TextStyle(
//           fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
//     ),
//     cardTheme: CardTheme(
//       color: Colors.white,
//       elevation: 15,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//       ),
//     ),
//     buttonTheme: const ButtonThemeData(
//     buttonColor: Colors.deepOrange, // Background color for buttons
//     textTheme: ButtonTextTheme.primary, // Text color for buttons
//   ),
//   );
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.blue.shade50,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.blue,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    secondary: Colors.blueAccent,
    onPrimary: Colors.white // Warna sekunder untuk tema terang
  ),
  iconTheme: const IconThemeData(color: Colors.blue),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 15,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue, // Background color for buttons
    textTheme: ButtonTextTheme.primary, // Text color for buttons
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.blue.shade50,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.grey.shade300,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 72, 72, 72),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.deepOrange,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: Colors.deepOrange),
  ),
  primarySwatch: Colors.deepOrange,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange).copyWith(
    secondary: Colors.deepOrangeAccent,
    onPrimary: Colors.black // Warna sekunder untuk tema gelap
  ),
  iconTheme: const IconThemeData(color: Colors.deepOrange),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
    foregroundColor: Colors.black
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 15,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.deepOrange, // Background color for buttons
    textTheme: ButtonTextTheme.primary, 
    // Text color for buttons
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey.shade200,
  ),
);
