import 'package:flutter/material.dart';
import 'package:tarea_5/pages/create_page.dart';
import 'package:tarea_5/pages/details_page.dart';
import 'package:tarea_5/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomePage(),
      routes: {
        '/home': (BuildContext context) => const HomePage(),
        '/create': (BuildContext context) => const CreatePage(),
        '/details': (BuildContext context) => const DetailsPage(),
      },
    );
  }
}
