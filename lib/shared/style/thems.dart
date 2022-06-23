import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/shared/style/colors.dart';

ThemeData darkTheme(context) => ThemeData(
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        // brightness: isAppDark(context) ? Brightness.dark : Brightness.light,
        backgroundColor: backgroundDark,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: green),
      ),
      iconTheme: const IconThemeData(
        color: green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: green,
        unselectedItemColor: Colors.grey,
        elevation: 20.0,
        backgroundColor: black4,
      ),
      textTheme: const TextTheme(
        caption: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        headline6: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        headline5: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        headline3: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.w300,
          color: white,
        ),
        button: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w600,
          color: white,
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

ThemeData lightTheme(context) => ThemeData(
      scaffoldBackgroundColor: white,
      primarySwatch: Colors.green,
      appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        // brightness: isAppDark(context) ? Brightness.dark : Brightness.light,
        backgroundColor: white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: green,
        ),
      ),
      iconTheme: const IconThemeData(
        color: green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: green,
        unselectedItemColor: Colors.grey,
        elevation: 20.0,
        backgroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        caption: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: black1,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: black1,
        ),
        headline6: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: black1,
        ),
        headline5: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
          color: black1,
        ),
        headline3: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.w300,
          color: black1,
        ),
        button: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w600,
          color: black1,
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
