import 'package:flutter/material.dart';
import './ui/TaskScreen.dart';
import './ui/NewScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Assignment_03',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => TodoScreen(),
        "/new": (context) => NewSubject()
      },
    );
  }
}