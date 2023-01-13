import 'package:flutter/material.dart';
import 'package:newsread_flutter/articles_page.dart';

class App extends MaterialApp {
  App({super.key})
      : super(
          home: const ArticlesPage(),
          theme: ThemeData(
            fontFamily: 'Lato',
            brightness: Brightness.light,
            primaryColor: Colors.orange,
            appBarTheme: const AppBarTheme(
              color: Colors.orange,
            ),
            textTheme: const TextTheme(
              bodyText2: TextStyle(
                fontSize: 14.0,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.orange,
              ),
            ),
          ),
        );
}
