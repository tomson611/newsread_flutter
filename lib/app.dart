import 'package:flutter/material.dart';
import 'package:newsread_flutter/article/view/articles_page.dart';

class App extends MaterialApp {
  App({super.key})
      : super(
          home: const ArticlesPage(),
          theme: ThemeData(
            fontFamily: 'Lato',
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        );
}
