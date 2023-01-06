
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsread_flutter/repository/article_repository.dart';
import 'package:newsread_flutter/screens/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsRead',
      home:  RepositoryProvider(
        create: (context) => ArticleRepository(),
        child: const HomePage(),
      ),
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


