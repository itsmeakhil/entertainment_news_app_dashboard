import 'package:entertainment_news_app_dashboard/screens/login_screen.dart';
import 'package:entertainment_news_app_dashboard/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme ,
      home: LoginScreen(),
    );
  }
}


