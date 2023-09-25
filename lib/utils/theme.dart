import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme { //1
    return ThemeData(
      // Define the default brightness and colors.
        primaryColor: adPrimary,
        scaffoldBackgroundColor:kIsWeb? scaffoldBackground:amdAppbar,

        // Define the default font family.
        // fontFamily: 'Hind',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: kIsWeb? adTextColor:scaffoldBackground),
          headline2: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold,color: kIsWeb? adTextColor:scaffoldBackground),
          headline3: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color:kIsWeb? adTextColor:scaffoldBackground),
          headline4: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: kIsWeb? adTextColor:scaffoldBackground),
          headline5: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: Colors.white),
          headline6: const TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: kIsWeb? adTextColor:scaffoldBackground),
          bodyText1: const TextStyle(fontSize: 15.0,color: kIsWeb? adTextColor:scaffoldBackground ),
          bodyText2: TextStyle(fontSize: 12.0, color: Colors.grey.shade900),
        ) ,
        inputDecorationTheme:  InputDecorationTheme(
            isDense: true,
            filled: true,
            fillColor: scaffoldBackground,
            iconColor: adPrimary,
            labelStyle: const TextStyle(color: adTextColor, letterSpacing: 1,fontSize: 16),
            hintStyle:  TextStyle(color: adTextColor.withOpacity(0.5), letterSpacing: 1,fontSize: 14),
            border: const OutlineInputBorder(),
            enabledBorder:OutlineInputBorder(
              borderSide:  BorderSide(
                  color: adTextColor.withOpacity(0.2)),
              borderRadius:
              BorderRadius.circular(5),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide:  BorderSide(
                color: adTextColor.withOpacity(0.2),
              ),
              borderRadius:
              BorderRadius.circular(5),
            )
          // errorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: errorColor),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: errorColor),
          // ),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: adSecondary),
          centerTitle: false,
          elevation: 0,
          toolbarHeight:80,
          // color: secondaryColor,
          backgroundColor: amdAppbar,
          // toolbarTextStyle: TextStyle(color: secondaryColor),
          titleTextStyle: TextStyle(
            color: adSecondary,
            // fontFamily: 'AcuminBold',
            fontSize: 23,
          ),

        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: adPrimary,
        ),
        textSelectionTheme: const TextSelectionThemeData(cursorColor: adTextColor),
        dataTableTheme: const DataTableThemeData(),
        elevatedButtonTheme:  ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(adPrimary),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10,vertical: 0)),
                textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 13,letterSpacing: 1,color: adTextColor,fontWeight: FontWeight.bold))
            )
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: adPrimary)
    );
  }
}