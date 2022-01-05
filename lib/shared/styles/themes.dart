import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

 ThemeData lighTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  primaryColor: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    elevation: 0.0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
  ),
);

 ThemeData darkTheme = ThemeData(
   primarySwatch: Colors.deepOrange,
   primaryColor: Colors.deepOrange,
   appBarTheme: AppBarTheme(
     titleSpacing: 20.0,
     elevation: 0.0,
     backgroundColor: HexColor('333739'),
     iconTheme: const IconThemeData(
       color: Colors.white,
     ),
     titleTextStyle: const TextStyle(
       color: Colors.white,
       fontSize: 25.0,
       fontWeight: FontWeight.bold,
     ),
     systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: HexColor('333739'),
       statusBarIconBrightness: Brightness.light,
     ),
   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     type: BottomNavigationBarType.fixed,
     elevation: 20.0,
     selectedItemColor: Colors.deepOrange,
     unselectedItemColor: Colors.grey,
     backgroundColor: HexColor('333739'),
   ),
   scaffoldBackgroundColor: HexColor('333739'),
   textTheme: const TextTheme(
     bodyText1: TextStyle(
         fontSize: 20.0,
         fontWeight: FontWeight.w600,
         color: Colors.white),
   ),
 );