import 'package:flutter/material.dart';
import 'package:newsread_flutter/screens/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsRead',
      home: const HomePage(),
      theme: ThemeData(
          fontFamily: 'Lato',
          brightness: Brightness.light,
          primaryColor: Colors.orange,
          appBarTheme: const AppBarTheme(
            color: Colors.orange,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 14.0,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.orange,
            ),
          )),
    );
  }
}


