import 'package:flutter/material.dart';
import 'package:newsread_flutter/screens/homepage_screen.dart';

import 'screens/widgets/custom_list_tile.dart';
import 'model/article_model.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            bodyText2: TextStyle(
              fontSize: 14.0,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: Colors.orange,
            ),
          )),
    );
  }
}


