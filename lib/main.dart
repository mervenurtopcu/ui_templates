import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_templates/movie_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark),
        bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
          elevation: 5,
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.grey[350],
          showSelectedLabels: true,
          showUnselectedLabels: true
          // selectedIconTheme: IconThemeData(
          //   color: Colors.pinkAccent,
          // ),
        ),
      ),
      home: const Scaffold(
        body: MovieUiTemplates(),
      ),
    );
  }
}
